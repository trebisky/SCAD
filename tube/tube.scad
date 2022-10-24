/* OpenSCAD file for my tubular microscope shim
 * Tom Trebisky  10-15-2021
 */
mmpi = 25.4;

// We make measurements with a set of metric calipers.

// inner_diam = 30.06;
// outer_diam = 35.4;
inner_diam = 30.7;
outer_diam = 36.0;

// This is the critical dimension.
// I measure 1.9, but will print 2.0 and
// carefully sand to fit.
// height = 1.9;
height = 2.0;

r_in = inner_diam / 2.0;
r_out = outer_diam / 2.0;
h_extra = height + 2.0;

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
