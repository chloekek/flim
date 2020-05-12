use <honeycomb.scad>;

module back_wall(
    width,
    height,
    thickness,
    panel_width,
    outline,
    cell_radius,
    cell_distance
)
{
    color([102, 255, 102] / 255)
    translate([panel_width/2, 0, height/2])
    rotate([90, 0, 0])
        grill(
            width         = width - panel_width,
            height        = height,
            thickness     = thickness,
            outline       = outline          ,
            cell_radius   = cell_radius,
            cell_distance = cell_distance
        );

    color([255, 102, 102] / 255)
    translate([-width/2 + panel_width/2, 0, height/2])
    rotate([90, 0, 0])
        cube(
            size = [
                panel_width,
                height,
                thickness
            ],
            center = true
        );
}

module back_side_wall(width, height, thickness)
{
    color([255, 255, 102] / 255)
    translate([0, 0, height/2])
    rotate([90, 0, 0])
        cube(size = [width, height, thickness], center = true);
}

module front_side_wall(
    width,
    height,
    thickness,
    outline,
    cell_radius,
    cell_distance
)
{
    color([102, 102, 255] / 255)
    translate([0, 0, height/2])
    rotate([90, 0, 0])
        grill(
            width,
            height,
            thickness,
            outline,
            cell_radius,
            cell_distance
        );
}

module front_wall(width, height, thickness) {
    color([102, 255, 255] / 255)
    translate([0, 0, height/2])
    rotate([90, 0, 0])
        cube(size = [width, height, thickness], center = true);
}
