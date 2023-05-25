# Makefile for my vblock

vblock.stl:	vblock.scad
	openscad -o vblock.stl vblock.scad

# Must run Cura by hand, see the Readme

SD = /run/media/tom/6331-3331/

copy:
	#cp vblock.gcode $(SD)
	cp CE3PRO_vblock.gcode $(SD)/vblock.gcode
	rm -f $(SD)/CE3PRO_vblock.gcode
