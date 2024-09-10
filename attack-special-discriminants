
#https://anonymous.4open.science/
#pts =pari('Vec(ellratpoints(ellinit([0,%s]), 10^13))'%(k))
#print("done ",pts)
#l = []
#for p in pts:
#    P = E([p[0],p[1]])
#    l.append(P)
#print(l)
#pari('Vec(ellrank(ellinit([0,%s])))'%(k))

def get_prime(a_bits):
    while True:
        D = next_prime(ZZ.random_element(2^a_bits))
        print(D)
        if D%4 == 3:
            return D

def get_prime2(a_bits):
    a = -4
    while True:
        z = ZZ.random_element(2^a_bits)
        p = (3/4*z^2+a)
        if p in Primes():
            return p,z

def is_shape(D):
    return ((D+4)*4/3).is_square()

def get_z(D):
    return ((D+4)*4/3).sqrt()

def mestre_nagao(p,k, r):
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


def mestre_nagao2(p,k, r):
    sum = 0
    for i in range(r):
        try:
            p = next_prime(p)
            E = EllipticCurve(GF(p),[0,k])
            Np = E.trace_of_frobenius()
            div = Np/(sqrt(p+0.0)+0.0)
            lg = div
            sum = sum + lg
        except (ArithmeticError):
            print("singular")
    return sum
 
attempts = 0
attempts_prime_failed = 0
missed = 0
while True:
    attempts = attempts + 1
    #D,z = get_prime2(30)
    D,z = get_prime2(1024)
    print("D ", D)
    
    if is_shape(D):
        z = get_z(D)
        k = -16*D
        E = EllipticCurve([0,k]) 
        mn = mestre_nagao(2, k,1000)

        #h = factor(pari('Vec(qfbclassno(%s))'%(-D))[0])
        #print(h)
        #if mn <4 and h[0][0]==3:
        #    missed = missed +1
        if mn <4: 
            missed = missed +1
        if mn>=4:
            print("mestre_nagao is ", mn)
            print("mestre_nagao 2 iss ", mestre_nagao2(2, k,1000))
            print("D ",D)
            print("k ",k)
            print("z ",z)
            a = -4
            x = z^2 +a
            y = z*(z^2+ 3/2*a)
            P = E([x,y])

            k1 = -27*k
            E1 = EllipticCurve([0,k1]) 
            
            x1 = (x^3+4*k)/(x^2)
            y1 = ((x^3-8*k)*y)/(x^3)
            P1 = E1([x1,y1])
            R = E1.lift_x(12)
            l = []
            l.append(P1)
            l.append(R)
            M = E1.height_pairing_matrix(points = l)
            det = M.determinant()
            if det == 0:
                print("false positive")
            else:
                print("Determinanrt ", det)
                print("--------------")
                print("attemots ",attempts)
                print("attempts_prime_failed ",attempts_prime_failed)
                print("missed ", missed)
                print("--------------")
                print(pari('Vec(ellrank(ellinit([0,%s])))'%(k)))
                break
    else:
        attempts_prime_failed = attempts_prime_failed +1

 
 
