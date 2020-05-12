use <hdd.scad>;
use <rpi.scad>;
use <wall.scad>;

module case_floor(
    wall_length,
    thickness
)
{
    cylinder(
        r   = wall_length,
        h   = thickness,
        $fn = 6
    );
}

module case_walls(
    wall_length,
    thickness,
    height
)
{
    radius = wall_length * cos(30);

    for (th = [0 : 5])
        color([255, 255, 255] / 255)
        rotate([0, 0, 60 * th])
        translate([-wall_length/2, radius, 0])
            cylinder(
                r   = thickness / 2,
                h   = height,
                $fn = 30
            );

    translate([0, radius, 0])
        back_wall(
            width         = wall_length,
            height        = height,
            thickness     = thickness,
            panel_width   = 40.0,
            outline       =  3.0,
            cell_radius   =  7.0,
            cell_distance =  1.7
        );

    for (th = [60, 300])
        rotate([0, 0, th])
        translate([0, radius, 0])
            back_side_wall(
                width     = wall_length,
                height    = height,
                thickness = thickness
            );

    for (th = [120, 240])
        rotate([0, 0, th])
        translate([0, radius, 0])
            front_side_wall(
                width         = wall_length,
                height        = height,
                thickness     = thickness,
                outline       = 3.0,
                cell_radius   = 7.0,
                cell_distance = 1.7
            );

    rotate([0, 0, 180])
    translate([0, radius, 0])
        front_wall(
                width     = wall_length,
                height    = height,
                thickness = thickness
        );
}

module case(
    floor_thickness,
    wall_length,
    wall_thickness,
    height
)
{
    case_floor(
        wall_length = wall_length,
        thickness   = floor_thickness
    );

    case_walls(
        wall_length = wall_length,
        thickness   = wall_thickness,
        height      = height
    );
}

case(
    floor_thickness =   3.0,
    wall_length     = 100.0,
    wall_thickness  =   3.0,
    height          =  25.0
);

translate([40, 0, 3])
    raspberry_pi_4b_threaded_insert_sockets(length = 4);

translate([-30, 0, 3])
    hdd_2_5_bay();
