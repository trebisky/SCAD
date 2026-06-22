/* OpenSCAD file to make a bullet sizer
 * Tom Trebisky  6-16-2026
 */

mmpi = 25.4;
function mm(x) = x * mmpi;

thick = mm ( 0.15 );
width = mm ( 1.2 );
length = mm ( 2.0 );

// dimensions of drill hole
// This came out .129 and I will need to drill it
// to pass a 6-32 bolt (which is .135).
d_diam = mm ( 0.142 );
d_len = thick * 2.0;

// location of drill holes
x1 = mm ( 0.6 );
y1 = mm ( 0.3 );
x2 = mm ( 0.6 );
y2 = mm ( 1.7 );

// location of cup
xc = mm ( 0.6 );
yc = mm ( 1.0 );
c_diam = mm ( 0.72 );
c_len = mm ( 1.0 );
c_dent = mm ( 0.035 );

w_diam = mm ( 0.082 );
w_len = mm ( 1.0 );
xw = mm ( 0.6 );
yw = mm ( 1.25 );

module wire (x, y) {
    translate ( [ x, y, 0.0 ] )
    translate ( [ 0.0, 0.0, -thick/2.0 ] )
    cylinder ( d=w_diam, h=w_len, $fn=100 );
}

module drill (x, y) {
    translate ( [ x, y, 0.0 ] )
    translate ( [ 0.0, 0.0, -thick/2.0 ] )
    cylinder ( d=d_diam, h=d_len, $fn=100 );
}

module cup ( x, y ) {
	zc = thick - c_dent;
	translate ( [ x, y, zc ] )
	cylinder ( d=c_diam, h=c_len, $fn=150 );
}

// The first coord x is left to right
// The second coord y is front to back, + to the rear
// The last coord z is up and down
module slab () {
		cube ( [ width, length, thick ] );
}

module corner ( rot, right ) {
		w = mm ( 2.0 );	
		l = mm ( 4.0 );	
		t = mm ( 1.0 );	
		fudge = mm ( 0.1 );

		if ( right ) {
			translate ( [ fudge, 0, 0 ] )
			translate ( [ width, 0, 0 ] )
			rotate ( [ 0.0, 0.0, rot] )
			translate ( [ 0.0, -l/2.0, -t/2.0 ] )
			cube ( [ w, l, t ] );
		} else {
			// works
			// rotates ccw about Z
			translate ( [ -fudge, 0, 0 ] )
			rotate ( [ 0.0, 0.0, rot] )
			translate ( [ -w, -l/2.0, -t/2.0 ] )
			cube ( [ w, l, t ] );
		}
}

module plate () {
	translate ( [ 0, -length/2.0, 0 ] )
	difference () {
		slab ();
		drill ( x1, y1 );
		drill ( x2, y2 );
		cup ( xc, yc );
		wire ( xw, yw );
	}
}

// Using union is very handy for debugging.

// union () {
difference () {
	plate ();
	corner ( 30.0, false );
	corner ( -30.0, false );
	corner ( 30.0, true );
	corner ( -30.0, true );
}

// THE END
