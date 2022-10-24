# Makefile for my helmet bracket

helmet.stl:	helmet.scad
	openscad -o helmet.stl helmet.scad

SD = /run/media/tom/6331-3331/

copy:
	#cp helmet.gcode $(SD)
	cp CE3PRO_helmet.gcode $(SD)/helmet.gcode
	rm -f $(SD)/CE3PRO_helmet.gcode
