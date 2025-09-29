use context starter2024
#calculated cost for t-shirts in different instances
(12 * 5) + 3
(12 * 7) + 3

#found perimeeter of rectangle then found the price by multiplying by 0.10
(2 * (420 + 594)) * 0.10

#fixed the error after omitting one of the quotes
"Designs for everyone!"
#combines the two words 
"red" + "blue" 
#1 + "blue" leaves an error since it was given a number and string

#code for stop light 
br=rectangle(50, 150, "solid", "black")
rc=circle(20, "solid", "red")
yc=circle(20, "solid", "yellow")
gc=circle(20,"solid", "green")
ry=above(rc,yc)
stop_colors=above(ry,gc)
stop_sign=overlay-align("center", "middle", stop_colors,br)
below(rectangle(10, 100, "solid", "black"),stop_sign)

#fixed error by rearranging 20 with solid
rectangle(50, 20, "solid", "black")
#fixed error by putting quotations around solid 
circle(30, "solid", "red")

#made Germany's flag
rec_black=rectangle(100, 20, "solid", "black")
rec_red=rectangle(100, 20, "solid", "red")
rec_yellow=rectangle(100, 20, "solid", "yellow")
b_r=above(rec_black,rec_red)
above(b_r,rec_yellow)
