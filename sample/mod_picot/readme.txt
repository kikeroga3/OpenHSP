:: Picot data file

fg.png		Character (1 piece 16 x 16 pixel dot picture arranged in 16 x 16 square)
bg.png		Map chip (1 piece 16 x 16 pixel dot picture arranged in 32 x 8 square)
map.bin		map data (created with map editor)


:: Picot module function

#include "mod_picot.as"

	When using the Picot module, include it first.


mapini map_xs, map_ys

	map_xs, map_ys		Specify the X and Y sizes of the entire map

	Initialize the Picot module.
	Load the necessary data files "map.bin", "fg.png", "bg.png" and set the map size.


map sx, sy, draw_xs, draw_ys, zoom

	sx, sy				X, Y coordinates of map cell to start drawing
	draw_xs, draw_ys	X, Y size of the map cell to be drawn on the screen
	zoom				Magnification when drawing

	Draw a map of the specified size from the current position to the screen.


v = mget (x, y)

	x, y				Specify the X, Y coordinates of the map cell
	v					Variable to get the value of the map cell

	Gets the map cell value of the specified coordinates.


mput x, y, v

	x, y				Specify the X, Y coordinates of the map cell
	v					The value to write to the map cell

	Writes a value to the map cell with the specified coordinates.


---
★Picotデータファイル

fg.png		キャラクター(1個16x16ピクセルのドット絵を16x16マスに並べた画像)
bg.png		マップチップ(1個16x16ピクセルのドット絵を32x8マスに並べた画像)
map.bin		マップデータ(マップエディターで作成する)

★Picotモジュール関数

#include "mod_picot.as"

	Picotモジュールを使用する場合、最初にインクルードします。


mapini map_xs,map_ys

	map_xs,map_ys		マップ全体のX,Yサイズを指定

	Picotモジュールを初期化します。
	必要なデータファイル"map.bin","fg.png","bg.png"を読み込んでマップサイズを設定します。


map sx,sy,draw_xs,draw_ys,zoom

	sx,sy				描画開始するマップセルのX,Y座標
	draw_xs,draw_ys		画面に描画するマップセルのX,Yサイズ
	zoom				描画時の拡大率

	カレントポジションから画面に指定サイズのマップを描画します。


v=mget(x,y)

	x,y					マップセルのX,Y座標を指定
	v					マップセルの値を取得する変数

	指定した座標のマップセル値を取得します。


mput x,y,v

	x,y					マップセルのX,Y座標を指定
	v					マップセルに書き込む値

	指定した座標のマップセルに値を書き込みます。

