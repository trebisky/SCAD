# Makefile for bullet sizer 6-16-2026

all: sizer.stl

sizer.stl:	sizer.scad
	openscad -o sizer.stl sizer.scad

run: sizer.scad
	openscad sizer.scad

# ----------------------------

SD = /run/media/tom/6331-3331/

copy:
	#cp sizer.gcode $(SD)
	cp CE3PRO_sizer.gcode $(SD)/sizer.gcode
	rm -f $(SD)/CE3PRO_sizer.gcode

clean:
	rm -f *.stl

# THE END
