use <screw.scad>;

/**
 * Render a set of threaded insert sockets suitable for mounting a
 * Raspberry Pi 4B.
 * In preview mode, also render a cuboid with the same dimensions as a
 * Raspberry Pi 4B.
 *
 * @param length The length of all of the threaded inserts.
 */
module raspberry_pi_4b_threaded_insert_sockets(length)
{
    // These parameters can be found in rpi_MECH_4b_4p0.pdf.
    width                   = 56.00;
    height                  = 85.00;
    depth                   = 10.00;
    mount_radius            =  1.35;
    mount_thickness         =  1.65;
    vertical_mount_distance = 58.00;

    // TODO: Investigate screw types and thread inserts.
    mount_points = [
        [ -width/2 + 3.5, -height/2 + 3.5,                           0 ],
        [  width/2 - 3.5, -height/2 + 3.5,                           0 ],
        [ -width/2 + 3.5, -height/2 + 3.5 + vertical_mount_distance, 0 ],
        [  width/2 - 3.5, -height/2 + 3.5 + vertical_mount_distance, 0 ]
    ];
    for (mount_point = mount_points)
        color([255, 102, 255] / 255)
        translate(mount_point)
            threaded_insert_socket(
                radius    = mount_radius,
                length    = length,
                thickness = mount_thickness
            );

    if ($preview)
        color([102, 102, 102] / 255)
        translate([0, 0, length + depth/2])
            cube(
                size   = [width, height, depth],
                center = true
            );
}
