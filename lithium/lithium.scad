/* OpenSCAD file for my 21700 battery adapter
 * Tom Trebisky  8-15-2022
 */
mmpi = 25.4;

// We made measurements in inches
// These 3 numbers define the object

// inner_diam = 0.185 * mmpi;
inner_diam = 0.200 * mmpi;
outer_diam = 0.840 * mmpi;
height = 0.150 * mmpi;

// The first print in PETG was fine for the OD,
// my calipers measure 0.845, which works fine.
//
// The inner hole was too small (as expected).
// I measure 0.170, so I should bump the
// ID up to 0.200 and see if I get 0.185.

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
