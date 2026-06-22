# Makefile for bullet cell	6-16-2026

all: cell.stl

cell.stl:	cell.scad
	openscad -o cell.stl cell.scad

run: cell.scad
	openscad cell.scad

# ----------------------------

SD = /run/media/tom/6331-3331/

copy:
	#cp cell.gcode $(SD)
	cp CE3PRO_cell.gcode $(SD)/cell.gcode
	rm -f $(SD)/CE3PRO_cell.gcode

clean:
	rm -f *.stl

# THE END
