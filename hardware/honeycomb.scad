/**
 * Render the cells of a honeycomb.
 *
 * @param horizontal_cells The horizontal number of cells.
 * @param vertical_cells The vertical number of cells.
 * @param cell_radius The inner radius of each cell.
 * @param cell_distance The amount of space between any two neighboring cells.
 * @param thickness The depth of the honeycomb sheet.
 */
module honeycomb(
    horizontal_cells,
    vertical_cells,
    cell_radius,
    cell_distance,
    thickness
)
{
    n = horizontal_cells;
    m = vertical_cells;
    r = cell_radius;
    d = cell_distance;

    rd = r + d;
    w = 2 * rd;
    h = sqrt(3) * rd;
    for (row = [-n/2 : n/2], col = [-m/2 : m/2]) {
        x = rd * 3/2 * row;
        y = rd * sqrt(3) * (col + 0.5 * (row % 2));
        translate([x, y, 0])
            cylinder(
                h      = thickness,
                r      = r,
                $fn    = 6,
                center = true
            );
    }
}

/**
 * Render the skeleton of a honeycomb with a rectangular outline around it.
 *
 * @param width The width of the grill.
 * @param height The height of the grill.
 * @param thickness The depth of the grill.
 * @param outline The width of the outline.
 * @param cell_radius The inner radius of each cell.
 * @param cell_distance The amount of space between any two neighboring cells.
 */
module grill(
    width,
    height,
    thickness,
    outline,
    cell_radius,
    cell_distance
)
{
    // Grill outline.
    difference() {
        cube(
            size = [
                width,
                height,
                thickness
            ],
            center = true
        );
        cube(
            size = [
                width - 2 * outline,
                height - 2 * outline,
                2 * thickness
            ],
            center = true
        );
    }

    // Grill honeycomb.
    difference() {
        cube(
            size = [
                width - outline,
                height - outline,
                thickness
            ],
            center = true
        );
        honeycomb(
            horizontal_cells = ceil(width  / cell_radius),
            vertical_cells   = ceil(height / cell_radius),
            cell_radius      = cell_radius,
            cell_distance    = cell_distance,
            thickness        = 2 * thickness
        );
    }
}
