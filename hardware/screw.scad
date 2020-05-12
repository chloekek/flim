/**
 * Render a hexagonal socket for a threaded insert.
 *
 * @param radius The inner radius of the socket.
 * @param length The length of the socket.
 * @param thickness The difference between the inner radius and the outer
 *                  radius of the socket.
 */
module threaded_insert_socket(radius, length, thickness)
{
    difference() {
        cylinder(
            r      = radius + thickness,
            h      = length,
            $fn    = 5
        );
        translate([0, 0, -length/2])
            cylinder(
                r      = radius,
                h      = 2 * length,
                $fn    = 6
            );
    }
}
