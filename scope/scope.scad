/* OpenSCAD file for my microscope light bracket
 * Tom Trebisky  10-4-2024
 */

/* I make all my measurements in inches.
 * We need to convert to mm so the STL file will be in mm.
 */
mmpi = 25.4;
function mm(x) = x * mmpi;

l = mm ( 2.0 );		// size front to back
w = mm ( 1.5 );		// width side to side
h = mm ( 2.5 );		// height top to bottom

l_diam = mm ( 0.952 );	// LED housing diameter
l_len = mm ( 10.0 );
l_shift = mm ( -4.0);

d_diam = mm ( 3.0 / 16.0 );
d_len = w + mm ( 1.0 );
d_shift = mm ( -0.5 );

// locations of drill holes
x1 = mm ( 0.4 );
y1 = mm ( 0.4 );

x2 = mm ( 1.5 );
y2 = mm ( 1.9 );

// =======================================================

// rotation angles  [x, y, z]
// The X axis is to the right, this rotates CCW around it.
// The Y axis is straight backward, this rotates CCW around it.
// The Z axis is up, this rotates CCW around it
// The rotations happen in the order X, Y, then Z
// if you want a different order use several rotate commands

module drill (x, y) {
    translate ( [ x, y, d_shift] )
	cylinder ( d=d_diam, h=d_len, $fn=100 );
}

// hole for the LED
module lhole () {
    translate ( [ 0, 50, w/2] )
	rotate ( [90, 0, 45 ] )
	translate ( [0, 0, l_shift] )
	cylinder ( d=l_diam, h=l_len, $fn=100 );
}

// a big cube to slice off half of the object
// (we will print a right half and a left half seperately)
module chop () {
	translate ( [ -50, -50, w/2 ] )
	cube ( [ l+100, h+100, w ] );
}

// union () { }

difference () {
	difference () {
		cube ( [ l, h, w ] );
		lhole ();
		drill ( x1, y1 );
		drill ( x2, y2 );
	}
	chop ();
}

// THE END
