def get_prime(a_bits):
    a = -4
    while True:
        z = ZZ.random_element(2^a_bits)
        p = (3/4*z^2+a)
        if p in Primes():
            return p,z

a_bits = 24
D,z = get_prime(a_bits)
k = -16*D
E = EllipticCurve([0,k]) 
print("Discriminant ", -D)
we = E.root_number()
if we == 1:
    print("ROUGH ORDER ASSUMPTION VIOLATED!!")
    if a_bits <30:
        print(pari('Vec(ellrank(ellinit([0,%s])))'%(k)))
else:
    print("program ended")
