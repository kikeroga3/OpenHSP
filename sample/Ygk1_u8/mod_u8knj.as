#module

#deffunc knjini

	celload "font_eng.png",3
	celdiv 3,15,20

	celload "font_u8knj.png",4
	celdiv 4,20,20

	sdim u8no,10242
	bload "u8no.txt",u8no

	return

#deffunc knjput str moj,int egl,int crs
	;	自作フォント文字列表示
	;
	;	knjput 表示文字列,日英モード,改行文字数
	;
	;	▼日英モード
	;	0:日本語(20x20)	
	;	1:英語(15x20)
	;	+2:表示文字を1.5倍に拡大

	sdim msg,1024
	sdim s,256

	msg=moj :en=egl&1 :lfs=crs :jx=ginfo(22)
	zm=double(2+(egl>1))/2	;1.5倍拡大文字対応

	wxs=600		;画面幅600ドット想定で改行文字数を算出
	if lfs=0 {
		if en :lfs=wxs/15-1 :else :lfs=(wxs*3/2)/10
	}

;	gmode 2
	ln=strlen(msg) :c=(ln+lfs-1)/lfs

	repeat c
		s=strmid(msg,lfs*cnt,lfs) :ln=strlen(s)/(3-en-en)
		repeat ln
			if en {
				a=peek(s,cnt)
			} else {
				i=cnt*3 :a1=peek(s,i) :b1=peek(s,i+1) :c1=peek(s,i+2)
				repeat 3414
					j=cnt*3 :a2=peek(u8no,j) :b2=peek(u8no,j+1) :c2=peek(u8no,j+2)
					if a1=a2 and b1=b2 and c1=c2 :a=cnt :break
				loop
			}
			celput 4-en,a,zm,zm
		loop
		pos jx,ginfo(23)+20
	loop

	return

#global

