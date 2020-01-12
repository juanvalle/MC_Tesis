elements = c(1:10)

elem1 = c(1, 2.8, 4.6, 4.6, 6.4, 6.4, 8.2, 8.2, 10, 10)
bound1_1 = c(0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01)
bound1_2 = c(0.02, 0.51, 0.02, 0.02, 0.02, 0.02, 0.02, 0.02, 0.02, 0.02)
bound1_3 = c(0.27, 0.76, 0.03, 0.03, 0.03, 0.03, 0.27, 0.27, 0.03, 0.03)

elem2 = c(1, 2.5, 4, 4, 5.5, 7, 7, 8.5, 10, 10)
bound2_1 = c(0.01, 0.11, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01)
bound2_2 = c(0.02, 0.44, 0.02, 0.02, 0.02, 0.02, 0.02, 0.57, 0.02, 0.02)
bound2_3 = c(0.03, 0.78, 0.35, 0.35, 0.24, 0.24, 0.24, 0.90, 0.03, 0.03)

elem3 = c(1, 2.29, 3.58, 4.87, 6.16, 6.16, 7.45, 8.74, 10, 10)
bound3_1 = c(0.01, 0.09, 0.18, 0.01, 0.01, 0.01, 0.01, 0.09, 0.01, 0.01)
bound3_2 = c(0.02, 0.55, 0.36, 0.02, 0.02, 0.02, 0.02, 0.45, 0.02, 0.02)
bound3_3 = c(0.03, 0.82, 0.73, 0.03, 0.11, 0.11, 0.47, 0.90, 0.03, 0.03)

elem4 = c(1, 2.125, 3.25, 4.375, 5.5, 6.625, 7.75, 8.875, 10, 10)
bound4_1 = c(0.01, 0.19, 0.19, 0.01, 0.01, 0.01, 0.06, 0.13, 0.01, 0.01)
bound4_2 = c(0.02, 0.31, 0.50, 0.07, 0.07, 0.02, 0.50, 0.31, 0.02, 0.02)
bound4_3 = c(0.08, 0.75, 0.69, 0.20, 0.26, 0.15, 0.75, 0.88, 0.03, 0.03)

elem5 = c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
bound5_1 = c(0.01, 0.12, 0.18, 0.18, 0.06, 0.06, 0.06, 0.18, 0.24, 0.01)
bound5_2 = c(0.02, 0.59, 0.71, 0.47, 0.07, 0.18, 0.18, 0.71, 0.35, 0.02)
bound5_3 = c(0.03, 0.71, 0.89, 0.53, 0.13, 0.29, 0.35, 0.99, 0.88, 0.03)

c1_1 = rep(0, 10)
c1_2 = rep(0, 10)
c1_3 = rep(0, 10)
c1_4 = rep(0, 10)
c1_5 = rep(0, 10)
c2_1 = rep(0, 10)
c2_2 = rep(0, 10)
c2_3 = rep(0, 10)
c2_4 = rep(0, 10)
c2_5 = rep(0, 10)
c3_1 = rep(0, 10)
c3_2 = rep(0, 10)
c3_3 = rep(0, 10)
c3_4 = rep(0, 10)
c3_5 = rep(0, 10)

for(i in elements) {
  c1_1[i] = get_side(i, elem1[i], bound1_1[i])
  c1_2[i] = get_side(i, elem2[i], bound2_1[i])
  c1_3[i] = get_side(i, elem3[i], bound3_1[i])
  c1_4[i] = get_side(i, elem4[i], bound4_1[i])
  c1_5[i] = get_side(i, elem5[i], bound5_1[i])
  
  c2_1[i] = get_side(i, elem1[i], bound1_2[i])
  c2_2[i] = get_side(i, elem2[i], bound2_2[i])
  c2_3[i] = get_side(i, elem3[i], bound3_2[i])
  c2_4[i] = get_side(i, elem4[i], bound4_2[i])
  c2_5[i] = get_side(i, elem5[i], bound5_2[i])
  
  c3_1[i] = get_side(i, elem1[i], bound1_3[i])
  c3_2[i] = get_side(i, elem2[i], bound2_3[i])
  c3_3[i] = get_side(i, elem3[i], bound3_3[i])
  c3_4[i] = get_side(i, elem4[i], bound4_3[i])
  c3_5[i] = get_side(i, elem5[i], bound5_3[i])
}

bound1 = (c1_1 + c1_2 + c1_3 + c1_4 + c1_5) / 5
bound2 = (c2_1 + c2_2 + c2_3 + c2_4 + c2_5) / 5
bound3 = (c3_1 + c3_2 + c3_3 + c3_4 + c3_5) / 5

#bound1 = bound1 + 0.05
#bound2 = bound2 + 0.10
#bound3 = bound3 + 0.125

plot(elements, bound1, xlab="Element", 
     ylab="Probability",
     xlim = range(1, 10),
     ylim=range(0 , 1), type="n")

bound1rev = rev(bound1)
bound1fin = (bound1rev + bound1)/2
bound2rev = rev(bound2)
bound2fin = (bound2rev + bound2)/2
bound3rev = rev(bound3)
bound3fin = (bound3rev + bound3)/2

lines(elements, bound1fin, col="blue")
lines(elements, bound2fin, col="black")
lines(elements, bound3fin, col="red")
grid()

boundw = c(0.6, 0.2, 0.4, 0.1, 0.3, 0.6, 0.8, 0.3, 0.6, 0.2)

#lines(elements, boundw, col="blue")

deg2rad = function(deg) deg * (pi/180)
rad2deg = function(rad) rad * (180/pi)

get_side = function(a, x, y) {
  alpha = atan(y/x)
  beta = deg2rad(90 - rad2deg(alpha))
  
  c = a*((sin(alpha))/(sin(beta)))
  
  return(c)
}

normalize <- function(x) {
  return ((x - min(x)) / (max(x) - min(x)))
} 
