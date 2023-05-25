/* OpenSCAD file for my V block
 * Tom Trebisky  5-24-2023
 */

/* I make all my measurements in inches.
 * We need to convert to mm so the STL file will be in mm.
 */
mmpi = 25.4;
function mm(x) = x * mmpi;

// The base plate
len = mm ( 1.0 );
wid = mm ( 0.6 );
th = mm ( 0.2 );

// Height of the triangle
ty = mm ( 0.25 );

tb = len / 2.0;

module base () {
	color ( "cyan" )
	    translate ( [ -tb, -th, 0 ] )
	    cube ( [ len, th, wid ] );
}

module left () {
	linear_extrude (wid) polygon ( points = [[0,0],[-tb,ty],[-tb,0]], paths=[[0,1,2]]);
}

module right () {
	linear_extrude (wid) polygon ( points = [[0,0],[tb,0],[tb,ty]], paths=[[0,1,2]]);
}

module vblock () {
    union () {
	base ();
	left ();
	right ();
    }
}

vblock ();

// THE END
