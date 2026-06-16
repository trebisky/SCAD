/* OpenSCAD file to make a bullet sizer
 * Tom Trebisky  6-16-2026
 */

mmpi = 25.4;
function mm(x) = x * mmpi;

thick = mm ( 0.15 );
width = mm ( 1.0 );
length = mm ( 2.0 );

// dimensions of drill hole
d_diam = mm ( 0.275 );
d_len = thick * 2.0;

// location of drill hole
x1 = mm ( 0.5 );
y1 = mm ( 0.5 );

module drill (x, y) {
    translate ( [ x, y, 0.0 ] )
    translate ( [ 0.0, 0.0, -thick/2.0 ] )
    cylinder ( d=d_diam, h=d_len, $fn=100 );
}

// The first coord x is left to right
// The second coord y is front to back, + to the rear
// The last coord z is up and down
module slab () {
		cube ( [ width, length, thick ] );
}

// The hole is invisible, so we switch to union
//  to be able to see it.

// union () {
difference () {
	slab ();
	drill ( x1, y1 );
}

// THE END
