# Makefile for rails for the S9 Antminer

all: right.stl left.stl testr.stl

right.stl:	rails.scad
	openscad -D 'right=true' -o right.stl rails.scad

left.stl:	rails.scad
	openscad -D 'right=false' -o left.stl rails.scad

testr.stl:	testr.scad
	openscad -o testr.stl testr.scad

run: rails.scad
	openscad rails.scad

# ----------------------------

SD = /run/media/tom/6331-3331/

copy:
	#cp rails.gcode $(SD)
	cp CE3PRO_rails.gcode $(SD)/rails.gcode
	rm -f $(SD)/CE3PRO_rails.gcode

clean:
	rm -f *.stl
