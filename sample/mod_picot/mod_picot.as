; Picot module

#module mod_picot

#deffunc mapini int map_xs, int map_ys
	;	mapini filename,map_xs,map_ys
	;	(Map data initialization)
	sdim mapdt,map_xs*map_ys
	fnm="map.bin" :exist fnm
	if strsize>0 :bload fnm,mapdt
	celload "fg.png",1 :celdiv 1,16,16
	celload "bg.png",2 :celdiv 2,16,16
	return

#deffunc map int sx, int sy, int xs, int ys, int zm
	;	map sx,ys,xsize,ysize,zoom
	;	(Map drawing)
	px=ginfo_cx :py=ginfo_cy :z=zm :if z<1 :z=1
	repeat ys :y=cnt :yy=sy+y
		repeat xs :x=cnt :xx=sx+x
			if xx>-1 and xx<256 and yy>-1 and yy<256 {
				a=peek(mapdt,256*yy+xx)
				pos px+16*x*z,py+16*y*z :celput 2,a,z,z
			}
		loop
	loop
	return

#deffunc mput int xp, int yp, int vp
	;	mput x,y,chip
	;	(Put a map chip)
	poke mapdt,256*yp+xp,vp
	return

#defcfunc mget int xg, int yg
	;	chip=mget(x,y)
	;	(Get a map chip)
	vg=peek(mapdt,256*yg+xg)
	return vg

#deffunc fprt str _p1
	;	fprt "message"
	;	(Font display using images)
	i=0 :st=_p1 :gmode 2
	repeat
	a1=peek(st,i) :i++ :if a1=0 :break
	if a1=13 or a1=10 {
		a1=peek(st,i) :if a1=10 :i++
		continue	; 改行
	} else {
		celput 1,a1
	}
	loop
	return

#global

