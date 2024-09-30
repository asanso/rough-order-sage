def get_prime(n_bits):
    """
    get_prime(a)

    INPUT:
    n_bits -- number of bits of the discriminant
     
    OUTPUT:
    p, a prime discriminant p as described in Subsection 3.1 of the papers"""

    a = -4
    while True:
        z = ZZ.random_element(2^(n_bits/2))
        p = (3/4*z^2+a)
        if p in Primes():
            return p,z

n_bits = 1024
D,z = get_prime(n_bits)
k = -16*D
E = EllipticCurve([0,k]) 
print("Discriminant ", -D)
we = E.root_number()
if we == 1:
    print("ROUGH ORDER ASSUMPTION VIOLATED!!")
    if n_bits <30:
        print(pari('Vec(ellrank(ellinit([0,%s])))'%(k)))
else:
    print("program ended")
