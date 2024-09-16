def get_prime(n_bits):
    """
    get_prime(a)

    INPUT:
    n_bits -- number of bits of the discriminant
     
    OUTPUT:
    p, a prime discriminant D such that p=3 mod 4"""
    while True:
        D = next_prime(ZZ.random_element(2^n_bits))
        if D%4 == 3:
            return D
        
def mestre_nagao_heuristic(p,k, r):
    """
    mestre_nagao_heuristic(p,k, r)

    INPUT:
    n_bits -- number of bits of the discriminant
     
    OUTPUT:
    sum, the  Mestre-Nagao score"""
    sum = 0
    for i in range(r):
        try:
            p = next_prime(p)
            E = EllipticCurve(GF(p),[0,k])
            Np = E.order()
            div = Np/(p+0.0)
            lg = log(div)
            sum = sum + lg
        except (ArithmeticError):
            print("singular")
    return sum

n_bits = 24
D = get_prime(n_bits)
k = -16*D
E = EllipticCurve([0,k]) 
print("Discriminant ", -D)

score = mestre_nagao_heuristic(2, k,1000)
#print(pari('Vec(ellrank(ellinit([0,%s])))'%(k)))
print(mn)
if score >= 4:
    print("found")
