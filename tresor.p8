pico-8 cartridge // http://www.pico-8.com
version 29
__lua__
--tresor

function _init()
	create_player()
	init_msg()
	create_msg("mr pole emploi","j'ai faim",
	"ventre vide = pas de formation")
end

function _update()
	if not messages[1] then
		player_mouvment()
	end
	update_camera()
	update_msg()
end		

function _draw()
	cls()
	draw_map()
	draw_player()
	draw_msg()
	draw_ui()
end

-->8
--map
function draw_map()
	map(0,0,0,0,128,64)
	end
	
function check_flag(flag,x,y)
	local sprite = mget(x,y)
	return fget(sprite,flag)
end

function update_camera()
	camx=flr(p.x/16)*16
	camy=flr(p.y/16)*16
	camera(camx*8,camy*8)
end

function next_tile(x,y)
	local sprite=mget(x,y)
	mset(x,y,sprite+1)
end

function pick_up_key(x,y)
	next_tile(x,y)
	p.keys+=1
 sfx(0)
end

function pacman_move(x,y)
	next_tile(x,y)
	p.keys-=1
end
	
-->8
--player
function create_player()
p={x=6,y=6,sprite=19,keys=0}
end

function player_mouvment()
  newx=p.x
  newy=p.y
		if (btnp(➡️))	newx+=1 
		if (btnp(⬅️))	newx-=1	
		if (btnp(⬇️))	newy+=1
		if (btnp(⬆️))	newy-=1
		
		
	 --⬆️maintenir appuyer+❎
	 --if (btn(❎)) then
		interact(newx,newy)
		--end
		
		
	 if not check_flag(0,newx,newy)
	then 
 		p.x=newx
 		p.y=newy
 	end
end

function interact(x,y)
	if check_flag(1,x,y) 
		then pick_up_key(x,y)
	elseif check_flag(2,x,y)
		and p.keys>0 then
		pacman_move(x,y)
		end
end

function draw_player()
spr(p.sprite,p.x*8,p.y*8)
end


		


-->8
--ui

function draw_ui()
	camera()
	spr(1,2,2)
	outline("X"..p.keys,10,2)
	
end

function outline(text,x,y)
	print(text,x-1,y,0)
	print(text,x+1,y,0)
	print(text,x,y-1,0)
	print(text,x,y+1,0)
	print(text,x,y,7)
end
	
-->8
--message
function init_msg()
	messages={}
end

function create_msg(name,...)
	msg_title=name
	messages={...}
end

function update_msg()
	if btnp(❎) then 
		deli(messages,1)
	end
end

function draw_msg()
	if messages[1] then
	local y=100
	rectfill(6,y,
		6+#msg_title*4,y+6,14)
	rectfill(2,y+9,125,y+20,2)
	print(msg_title,7,y+1,7)
	print(messages[1],4,y+10,7)
	end
end
	
__gfx__
0000000011b311000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000001b3881000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700188881000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000188881000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000118811000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700111111000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000033aaaa333333333300222220000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000003aaa8aa3333333330e244420000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000033aaaaaa33333333224b4b22000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000333aaaaa3333333322444422000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000003333aaaa3333333322211122000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000aaaaaaaa3333333302817180000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000003aaaaaa33333333300011100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000333aaa333333333300080800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000ddeeeddd0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000defffedd0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000ef8f8fed0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000efffffed0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000dd111dcd0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000d1ccc1dd0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000c11111dd0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000dd1d1ddd0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000033bbbb3333bbbb3333bbbb330000000099999999dddddddd0e20d18000000000dddddddddddddddd9999999999999999999999990000000000000000
000000003bbaabb33bbaabb33bbaabb30000000099999999000000000e20d18003333333dddddddddd0000dd9933339999333399993333990000000000000000
000000003bbba3b33bbba3b33bbba3b300000000999999994c4774440000000003737337ddddddddd0ffff0d930000399300003993e0c0390000000000000000
000000003b9b33133b8b33133b3b33130000000099997999444774440d08201003373333ddddddddd0ffff0d9500005995000059950a08590000000000000000
00000000311bb113311bb113311bb1130000000099979799444444440d08201003333333ddddddddd0ffff0d9553335995533359955333590000000000000000
000000003332233333322333333223330000000099997999400000040000000003333333ddddddddd0ffff0d9555555995555559955555590000000000000000
00000000333443333334433333344333000000009999999940dddd040e2c0ed000000000dddddddddd0000dd9555555995555559955555590000000000000000
00000000331442333314423333144233000000009999999940dddd040e2c0ed000000000dddddddddddddddd9555555995555559955555590000000000000000
00000000cccccccc333333333333333300000000fe20d02fddddddd0dddddddddddddddd02eeeeeeeeeeee20dd000dd0dd0990dd000000000000000000000000
00000000cccccccc337333333333333300000000ee20d02e0ddddd02dddddd0000000dddd2eeefeeeee2222dd0555502d8888880000000000000000000000000
00000000c7c77c7c37a7333333333333000000002f2002f220ddd022dddd0222222220ddd22eeeeeeee220dd088880220800008d000000000000000000000000
000000007c7cc7c73373333333333333000000000e2002e2220dd02eddd022eeeeee200dd02eeeefeeee20dd0559902e05000050000000000000000000000000
00000000cccccccc3333373333333333000000000ef20fe0e220d22eddd02eeeeeee220dd02eeeeeeee220dd0888822e08899880000000000000000000000000
00000000c1c11c1c33337a73333333330000000002e202e0ee2002efd0222efeeeeee220dd2222eeeee20ddd088802ef08888880000000000000000000000000
000000001c1cc1c1333337333333333300000000d0e202f0fe2202efd02eeeeeeeeeee20ddd002222222dddd055502ef05555550000000000000000000000000
00000000cccccccc333333333333333300000000d02202e0fe2202efd22eeeeeeeeeee20dddddd00000dddddd00002efd0000d00000000000000000000000000
0000000000088800fffffffffff331ff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000880000fffff4ffff33ba3f007777700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000008000000ffffffffff3bbb3f007070700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000008888000ffffffffffbbbbaf007777700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000008880ffffffffffbbbabf000777000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000008000880fffffffff3bbbb3f000070000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000008888800f4fffffffff44fff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000880000ffffffffff4444ff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000445444453131b1334545453b43b3b3bbb3b5b5b51111c3314444444454454444c139999cc138888c00000000000000000000000000000000
0000000000000000544445443b3b3b3b5444444b3b3b3b3b5b3b3b3b3331cc3344444444444444541c9931311c88313100000000000000000000000000000000
000000000ccccc0044454444b43444434454543344545433b3535533c3331cc34445555444545444c9999c19c8888c1800000000000000000000000000000000
00000000000c000044444454444454444444434b4444434b3b3b335bc113111c4455665444444454997999998878888800000000000000000000000000000000
00000000000cc0005445444445444444544543bb544543bb5335b3bbcccc333145567554544544449999999c8888888c00000000000000000000000000000000
00000000cc00c000444445444445444445444333454443333b333335331cccc34557754444b4434bc9999c99c8888c8800000000000000000000000000000000
000000000c00c00044454444454444444445443b4445443bb535b53bc33331cc445555444b3b3b4b1c99c1c91c88c1c800000000000000000000000000000000
000000000c00c0004544444544444454454433bb454433bb35b3335bcc31111c44444444b33333b331c9991331c8881300000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000450000001c9399c91c8300c800000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000045000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__gff__
0000000000000000000000000000000000050000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010301000001010100000103010000000000000001000000000006000000000000000000000000000000000000000000000001010100010001000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
4141414141414141414141414141414147474747474847474848474748474747737373737373737373737373737373750000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
41535353535353535353535342415341474c4545454949494949494949454547727278787676767272727276787872740000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4153535353535353535353535353534147454545494649464949464946494547727278787a77767878767677777876740000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
41535353534343534353534343535341474b4545494a494a49494a494a49454772727276777777767878767b777672740000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
415343435253535343535352535353414745454549464946494946494649454772727272767b7676777a7777777672740000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
41535353535353535353534353435341474b4545494a494a49494a494a49454772727876767676777b7b7776767672740000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4153434343535253535353435353534147454545494649464949464946494547727276787777777a7b777776777272740000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4153435353535353535353535353531152524545494a494a49494a494a494572727876777b7b7777777777777a7772740000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
41534353535353535353535343435341474b45454946494649494649464945477278767a7b777678787777777b7676740000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4153535343525353535353435353534147454545494a494a49494a494a4945477272787677767672767b7777777272740000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
41535343435253535353534352534341474b4545494649464949464946494547727272787676727276777a77787872740000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4153535353535353535353535353534147454545494a494a49494a494a494547727272727272727278767676727272740000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
41535353535353534343535353434341474b4545494949494949494949494547727272787878727272727272727872740000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4141415252414141414141525241414147454545454545454545454545454547727272727878727272787878727272740000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
43434252524141525243435252434343474b454c454b454b454b454b45454b47727272727272727272727272727272740000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4343434343434343434343434343434347474747474747474747474757584747727979797279797272797979727272740000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000555555555555555555555547595a4755636363636363636363636363636363630000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000055494949575849215549494949494955636262626262626262626262626262630000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000055494949595a49495555494949494955636262626262626262626262626262630000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000055495555555549494949494957584955636262626262626262626262626262630000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000554949494949494949494949595a4955636262626262626262626262626262630000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000055555555555555555555554957584955636262626262626262626262626262630000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000055555b565656565656565649595a4955636262626262626262626262626262630000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000055555555555555555555554949494955636262626262626262626262626262630000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000055472155494949494949494957584955636262626262626262626262626262630000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000554a49554949495758494949595a4955636262626262626262626262626262630000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000554a4949494949595a55555556565655636262626262626262626262626262630000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000055555656565656494955494955555555636262626262626262626262626262630000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000055474755555555494955215656565b55636262626262626262626262626262630000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000055494949494949494955495555555555636262626262626262626262626262630000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000055494949494949494949494949565655636262626262626262626262626262630000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000055555555555555555555555555555555636363636363636363636363636363630000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
000600000000000000000000000014050180501c0501e050220500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
