import random
from sympy import isprime, mod_inverse

# Define the alphabet
alphabet = ' ' + ''.join(chr(i) for i in range(ord('a'), ord('z')+1))

# Function to convert string to int
def str_to_int(s):
    return sum(alphabet.index(c) * (len(alphabet) ** i) for i, c in enumerate(s))

# Function to convert int to string
def int_to_str(n):
    s = ''
    while n > 0:
        s = alphabet[n % len(alphabet)] + s
        n //= len(alphabet)
    return s

# Function to generate keys
"""Key Generation:
- Choose a large prime number p and a primitive root g modulo p.
- Choose a random integer x from {1, ..., p-2}. This is the private key.
- Compute y = g^x mod p. This is the public key.
- The public key is (p, g, y), and the private key is x.
"""
def generate_keys():
    # Choose a large prime p
    p = random.choice([i for i in range(2**16, 2**17) if isprime(i)])
    # Choose a primitive root g
    g = random.choice([i for i in range(2, p) if pow(i, (p-1)//2, p) != 1])
    # Choose a private key x
    x = random.randint(1, p-2)
    # Compute the public key y
    y = pow(g, x, p)
    return (p, g, y), x

# Function to encrypt a plaintext
"""
Encryption:
- To encrypt a message m = plaintext (where m is an integer such that 1 <= m < p), choose a random integer k from {1, ..., p-2}.
- Compute a = g^k mod p and b = m * h^k mod p.
- The ciphertext is (a, b).
"""
def encrypt(plaintext, public_key):
    p, g, y = public_key
    plaintext_int = str_to_int(plaintext)
    # Choose a random k
    k = random.randint(1, p-2)
    a = pow(g, k, p)
    b = (plaintext_int * pow(y, k, p)) % p
    return a, b

# Function to decrypt a ciphertext
"""
Decryption:

- To decrypt a ciphertext (a, b), compute m = b * (a^x)^(-1) mod p.
- The term (a^x)^(-1) mod p can be computed efficiently using the Extended Euclidean Algorithm for modular multiplicative inverse.
"""
def decrypt(ciphertext, private_key, public_key):
    a, b = ciphertext
    p, _, _ = public_key
    x = private_key
    plaintext_int = (b * mod_inverse(pow(a, x, p), p)) % p
    return int_to_str(plaintext_int)

# Test the functions
public_key, private_key = generate_keys()
plaintext = 'hello world'
ciphertext = encrypt(plaintext, public_key)
decrypted = decrypt(ciphertext, private_key, public_key)
print(f'Plaintext: {plaintext}')
print(f'Ciphertext: {ciphertext}')
print(f'Decrypted: {decrypted}')

"""
The security of the ElGamal algorithm relies on the difficulty of the Discrete Logarithm Problem. If an attacker can solve this problem efficiently, they can compute the private key from the public key and decrypt any message encrypted with that public key. However, no efficient algorithm is known for solving the Discrete Logarithm Problem, making ElGamal a secure choice for public-key cryptography, assuming the keys are chosen properly and are of sufficient length.
"""