/* OpenSCAD file for a cap for the microscope photo tube
 * Tom Trebisky  3-21-2026
 */
mmpi = 25.4;

inner_diam = 1.525 * mmpi;
outer_diam = 1.8 * mmpi;

height = 0.9 * mmpi;
lid = 0.2 * mmpi;

r_in = inner_diam / 2.0;
r_out = outer_diam / 2.0;

// Note - OpenSCAD will yield undersized holes since a cylinder
// (or circle) will be generated as a polygon with vertices on
// the specified radius.  The default seems to be a 12 sided polygon
// but the $fn parameter will override that.

// We can set the circle resolution in a global way like this,
// or individualy below.  This is all about OpenSCAD scope.

$fn = 60;

// Note - use %cylinder to make the outer cylinder transparent.

difference () {
    cylinder( r = r_out, h = height );
    translate([0,0,lid]) cylinder( r = r_in, h = height );
}

// THE END
