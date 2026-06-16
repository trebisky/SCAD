/* OpenSCAD file to make a pair of rails to hold
 * one of my Antminer X9 boards
 * Tom Trebisky  5-10-2026
 */

/* I design this so it will print slot upwards
 */

// right = true;
right = false;

mmpi = 25.4;
function mm(x) = x * mmpi;

l = mm ( 3.5 );		// length along the PCB
h = mm ( 0.5 );		// thickness
w = mm ( 0.5 );		// perpendicular to card edge
up = mm ( 0.4 );
shift = mm ( 0.25 );
half = mm ( 0.5 );

// [left/right, front/back, up/down ]

slice = mm ( 0.095 );
big1 = mm ( 1.0 );
big2 = mm ( 2.0 );
big4 = mm ( 4.0 );

// d_diam = mm ( 3.0 / 16.0 );
d_diam = mm ( 0.155 );
d_len = w + mm ( 1.5 );
// d_shift = mm ( -0.5 );
// d_shift = mm ( 0.0 );
d_up = mm ( 0.2 );
// d_over1 = mm ( 0.25 );
d_over1 = mm ( 0.5 );
d_over2 = mm ( 3.0 );

/* This dimension is critical, as it is the piece
 * that fits into the slot on the PCB.
 * It comes out 0.210 when printed as 0.20
 */
// bite_l = mm ( 0.20 );
bite_l = mm ( 0.180 );

bite_pos = mm ( 3.1 );

// locations of drill holes
x1 = mm ( 0.4 );
y1 = mm ( 0.4 );

module drill (x, y) {
    // translate ( [ x, y, d_shift] )
	rotate ( [ 90.0, 0.0, 0.0 ] )
    translate ( [ x, y, 0.0 ] )
    translate ( [ 0.0, 0.0, -d_len/2.0 ] )
    cylinder ( d=d_diam, h=d_len, $fn=100 );
}

module rail () {
		cube ( [ l, h, w ] );
}

module bite () {
	translate ( [ bite_pos, 0.0, 0.0 ] )
		cube ( [ bite_l, half, big1 ] );
}

module slab () {
 	difference () {
		translate ( [ -shift, shift, up ] )
			cube ( [ big4, slice, big1 ] );
		bite ();
	}
}

module thing () {
	difference () {
		rail ();
		slab ();
		drill ( d_over1, d_up );
		drill ( d_over2, d_up );
	}
}

// [left/right, front/back, up/down ]

if ( right )
    thing ();
else
    mirror ( [ 1, 0, 0 ] )
		thing ();

// slab ();

// drill ( big1, d_up );
// drill ( d_over, d_up );

// THE END
