# Makefile for my scope bracket

scope.stl:	scope.scad
	openscad -o scope.stl scope.scad

run: scope.scad
	openscad scope.scad

SD = /run/media/tom/6331-3331/

copy:
	#cp scope.gcode $(SD)
	cp CE3PRO_scope.gcode $(SD)/scope.gcode
	rm -f $(SD)/CE3PRO_scope.gcode

clean:
	rm -f *.stl
