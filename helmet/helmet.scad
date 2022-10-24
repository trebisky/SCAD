/* OpenSCAD file for my helmet lamp bracket
 * Tom Trebisky  10-12-2022
 */

// Front and Back are different
front = true;
// front = false;

/* I make all my measurements in inches.
 * We need to convert to mm so the STL file will be in mm.
 */
mmpi = 25.4;
function mm(x) = x * mmpi;

/* I printed one at 0.085 and it came out .085, but it binds in the slots.
 * So 0.080 is better.
 */
pth = mm ( 0.080 );	// plate thickness

/* The "plate" is the trapezoid piece that fits into the helmet "dovetail"
 */

/* I made my test print and got:
 * height = 1.015
 * base = 1.075
 * top = 1.18
 * So - it is printing oversize by .01 to .025
 */

// base = 1.04;
// top = 1.16;

h = mm ( 1.0 );		// plate height
b = mm ( 1.02 );	// plate base
t = mm ( 1.14 );	// plate top

// Now the latch
ll = mm ( 1.125 );	// latch location
lw = mm ( 0.40 );	// latch width
lh = mm ( 0.04 );	// latch height
lb = mm ( 0.150 );	// latch base

// box1 - main body, sticks out top
bw = mm ( 0.80 );	// box width
bt = mm ( 0.325 );	// box thickness
bl = mm ( front ? 1.8 : 1.7 );	// box length

// box2 - sticks out bottom
b2_extra = mm ( 0.3 );
bw2 = mm ( 0.50 );	// box width
bt2 = mm ( 0.325 );	// box thickness
bl2 = bl + b2_extra;	// box length
by2 = -b2_extra;	// box length

// box3 - front only, bar on top
bw3 = mm ( 1.50 );	// box width
bt3 = mm ( 0.325 );	// box thickness
bl3 = mm ( 0.60 );	// box length
by3 = bl - bl3;

// front hole spacing
fhs = mm ( 0.86 );

// Hole dimensions
// hole at .166 was to small.
// hex at 0.39 fit some nuts, but tight
hole_diam = mm ( 0.175 );
hex_diam = mm ( 0.40 );
hex_thick = mm ( 0.125 );

// define the shape of the plate
trap = [
	[-b/2, 0 ],
	[-t/2, h ],
	[t/2, h ],
	[b/2, 0 ]
    ];

module plate () {
    linear_extrude ( pth )
	polygon ( trap );
}

module latch () {

    tri = [
	[0, 0 ],
	[0, lb ],
	[lh, lb ]
    ];

    color ( "red" );
    translate ( [ lw/2, ll-lb, pth ] )
	rotate ( [0, -90, 0 ] )
	    linear_extrude ( lw )
		polygon ( tri );
}

module box1 () {
    translate ( [ -bw/2, 0, pth-bt] )
	cube ( [ bw, bl, bt ] );
}

module box2 () {
    translate ( [ -bw2/2, by2, pth-bt] )
	cube ( [ bw2, bl2, bt2 ] );
}

module box3 () {
    translate ( [ -bw3/2, by3, pth-bt] )
	cube ( [ bw3, bl3, bt3 ] );
}

module hex () {
    del = 1;
    ht = hex_thick + del;
    cylinder ( d=hex_diam, h=ht, $fn=6 );
}

module hole ( xloc, yloc ) {
    del = 1;
    ht = bt + 2*del;
    translate ( [ xloc, yloc, pth-bt-del ] )
	union () {
	    cylinder ( d=hole_diam, h=ht, $fn=100 );
	    translate ( [ 0, 0, bt-hex_thick+del] )
		hex ();
	}
}

module front_bracket () {
    difference () {

	union () {
	    plate ();
	    latch ();
	    box1 ();
	    box2 ();
	    box3 ();
	}

	hole ( -fhs/2, mm(1.5) );
	hole ( fhs/2, mm(1.5) );
    }
}

module back_bracket () {
    difference () {

	union () {
	    plate ();
	    latch ();
	    box1 ();
	    box2 ();
	}

	hole ( 0, mm(-0.05) );
	hole ( 0, mm(1.35) );
    }
}

	if ( front )
	    front_bracket ();
	else
	    back_bracket ();

// THE END
