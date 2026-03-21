# Makefile for my microscope cap

all: cap.stl

cap.stl:	cap.scad
	openscad -o cap.stl cap.scad

test.stl:	test.scad
	openscad -o test.stl test.scad

run: cap.scad
	openscad cap.scad

trun: test.scad
	openscad test.scad

SD = /run/media/tom/6331-3331/

copy:
	#cp cap.gcode $(SD)
	cp CE3PRO_test.gcode $(SD)/test.gcode
	#rm -f $(SD)/CE3PRO_cap.gcode

clean:
	rm -f *.stl
