pico-8 cartridge // http://www.pico-8.com
version 18
__lua__
sunangle = .25
mousex = 0
mousey = 0

numrects = 0
numlines = 0
lines = {}
rects = {}

function _init()
	poke(0x5f2d, 1)
	addrect(50,80,20,10)
end

function _update()
	mousex = stat(32)
	mousey = stat(33)
end

function _draw()
	//color(1)
	color(12)
	rectfill(0,0,128,128)
	shadows()
	color(10)
	circfill(64 + 50*cos(sunangle),44 + 30*sin(sunangle),10)
	print(sunangle,0,0)
	color(1)
	angle = coordtoangle(mousex,abs(-mousey+64)-64)
	circfill(64 + cos(angle)*50,64+sin(angle)*50,3)
	sunangle += .2*(angle-sunangle)
	drawrects()
end
-->8
function coordtoangle(ax,ay)
	return atan2(ax-64,ay-64)
end

function addrect(x,y,w,h)
	newrect = {}
	newrect.x = x
	newrect.y = y
	newrect.w = w
	newrect.h = h
	addline(x,y,x+w,y)
	addline(x,y,x,y+h)
	addline(x+w,y+h,x+w,y)
	addline(x+w,y+h,x,y+h)
	numrects+=1
	rects[numrects] = newrect
end
function addline(x,y,x2,y2)
	newline = {}
	newline.x = x
	newline.y = y
	newline.x2 = x2
	newline.y2 = y2
	numlines+=1
	lines[numlines] = newline
end
function drawrects()
	color(1)
	for i=1,numrects do
		rectfill(rects[i].x,rects[i].y,rects[i].x+rects[i].w,rects[i].y+rects[i].h)
	end
end
function shadows()
	for i=1,numlines do
		//x = rects[numrects].x
		//y = rects[numrects].y
		//x2 = rects[numrects].x+rects[numrects].w
		//color(0)
		//for j=1,50 do
		//	line(x-j*sin(sunangle-.25)/cos(sunangle-.25),y+j,x2-j*sin(sunangle-.25)/cos(sunangle-.25),y+j)
		//end
		//color(1)
		//line(x,y,x + 100*cos(sunangle+.5),y + 100*sin(sunangle+.5))
		//line(x2,y,x2 + 100*cos(sunangle+.5),y + 100*sin(sunangle+.5))
		//color(0)
		x = lines[i].x
		y = lines[i].y
		x2 = lines[i].x2
		y2 = lines[i].y2
		color(0)
		for j=1,50 do
			dx = -j*cos(sunangle)
			dy = -j*sin(sunangle)
			line(x+dx,y+dy,x2+dx,y2+dy)
		end
	end
end
function round(a)
	
end
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000