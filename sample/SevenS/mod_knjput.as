#module

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

	dim ki,32
	ki=0,192,384,544,0,0,672,768,880,1072,1264,1456,1648,1840,2032,2224,2416,2608,2800,2992,3184,3376,3568,3760

	wxs=470		;画面幅590ドット想定で改行文字数を算出
	if lfs=0 {
		if en :lfs=wxs/15 :else :lfs=wxs/10
	}

	gmode 2
	ln=strlen(msg) :c=(ln+lfs-1)/lfs
	repeat c
		s=strmid(msg,lfs*cnt,lfs) :ln=strlen(s)/(2-en)
		repeat ln
			if en {
				a=peek(s,cnt)
			} else {
				h=abs(peek(s,cnt*2)-$81)\32 :l=peek(s,cnt*2+1)-$40-$50*(h=7) :a=ki(h)+l
			}
			celput 3+en,a,zm,zm
		loop
		pos jx,ginfo(23)+20
	loop

	return

#global

