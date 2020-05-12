/**
 * Render a bay suitable for mounting a 2.5” HDD.
 * The bay has holes in the side for inserting screwing.
 * No threaded inserts are needed;
 * the 2.5” HDD should already have threads.
 *
 * In preview mode, also render a cuboid with the same dimensions as a
 * 2.5” HDD.
 */
module hdd_2_5_bay()
{
    // These parameters can be found on
    // Wikipedia, List of disk drive form factors.
    width  =  69.85;
    height = 100.00;
    depth  =   9.50;
    // TODO: Figure out screw sizes.

    // TODO: Figure out optimal thickness.
    thickness = 2;

    // TODO: Figure out optimal quadrant size.
    quadrant_width  =  5;
    quadrant_height = 30;

    // TODO: Figure out the optimal margin.
    margin = 1;
    eff_width  = width + margin;
    eff_height = height + margin;

    // TODO: Render screw holes.

    color([255, 102, 255] / 255)
    translate([0, 0, depth/2 + thickness/2])
        difference() {

            // Render the outer cube.
            cube(
                size = [
                    eff_width  + 2 * thickness,
                    eff_height + 2 * thickness,
                    depth + thickness
                ],
                center = true
            );

            // Cut away space for the 2.5” HDD.
            translate([0, 0, thickness])
                cube(
                    size = [
                        eff_width,
                        eff_height,
                        depth + thickness
                    ],
                    center = true
                );

            // Cut away a cross of redundant material.
            // This also allows removing the 2.5” HDD by hand.
            cube(
                size = [
                    eff_width - 2 * quadrant_width,
                    2 * (eff_height + thickness),
                    2 * (depth + thickness)
                ],
                center = true
            );
            cube(
                size = [
                    2 * (eff_width + thickness),
                    eff_height - 2 * quadrant_height,
                    2 * (depth + thickness)
                ],
                center = true
            );
        }

    // Render a 2.5” HDD.
    if ($preview)
        color([102, 102, 102] / 255)
        translate([0, 0, thickness + depth/2])
            cube(
                size   = [width, height, depth],
                center = true
            );
}
