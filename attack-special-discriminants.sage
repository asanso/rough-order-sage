D = 38747596914671
z = 7187730
k = -16*D
E = EllipticCurve([0,k]) 
print(pari('Vec(ellrank(ellinit([0,%s])),10)'%(k)))
a = -4
x = z^2 +a
y = z*(z^2+ 3/2*a)
P = E([x,y])
print(P)
print(pari.version())