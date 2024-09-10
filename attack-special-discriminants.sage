def get_prime(a_bits):
    a = -4
    while True:
        z = ZZ.random_element(2^a_bits)
        p = (3/4*z^2+a)
        if p in Primes():
            return p,z


D,z = get_prime(24)
k = -16*D
E = EllipticCurve([0,k]) 
print("Discriminant ", k)
we = E.root_number()
if we == 1:
    print("rough order assumption violated")
else:
    print("program ended")
