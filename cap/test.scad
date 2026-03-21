/* OpenSCAD file for a "test" washer prior to
 * printing the actual cap.
 * Tom Trebisky  3-21-2026
 */
mmpi = 25.4;

/* I measure the microscope flange as 1.495 inches and
 *  try a print at 1.5.  It is too tight and I measure
 *  the ID at 1.48.  So we should add 0.020.
 *  I will add 0.025
 * Note: I measure the OD at 1.85, so that is bigger too,
 *  and by 0.050 inches.
 */
// inner_diam = 1.5 * mmpi;
inner_diam = 1.525 * mmpi;
outer_diam = 1.8 * mmpi;

// This is the thickness.
// height = 0.25 * mmpi;
height = 0.1 * mmpi;

// In mm
extra = 2.0;

r_in = inner_diam / 2.0;
r_out = outer_diam / 2.0;
h_extra = height + extra;

// Note - OpenSCAD will yield undersized holes since a cylinder
// (or circle) will be generated as a polygon with vertices on
// the specified radius.  The default seems to be a 12 sided polygon
// but the $fn parameter will override that.

// We can set the circle resolution in a global way like this,
// or individualy below.  This is all about OpenSCAD scope.

$fn = 60;

difference () {
    cylinder( r = r_out, h = height );
    translate([0,0,-1.0]) cylinder( r = r_in, h = h_extra );
}

// THE END
