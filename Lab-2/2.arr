use context starter2024
c= circle(30, "solid", "blue")
t= triangle(50, "outline", "red")
r= rectangle(40, 20, "solid", "green")
rp= rectangle(40, 20, "solid", "purple")
ry= rectangle(40, 20, "solid", "yellow")
rr= rectangle(100, 20, "solid", "red")
rsp=rectangle(2,100, "solid", "white")

#code for stop sign
polygon=regular-polygon(100, 8, "solid", "red")
stop_sign=text("STOP", 50, "white")
stop=overlay(stop_sign,polygon)
stop_outline=regular-polygon(105,8,"solid", "white")


string-to-upper("hello cs2000!")
above(c,ry)
above(r,rp)
rotate(45,rr)
rotate(60,rr)
overlay(stop,stop_outline)