def sieve_of_eratosthenes(limit):
    primes = [True] * (limit + 1)
    primes[0] = primes[1] = False

    for i in range(2, int(limit**0.5) + 1):
        if primes[i]:
            for j in range(i * i, limit + 1, i):
                primes[j] = False

    return [num for num in range(2, limit + 1) if primes[num]]


limit = 99999

prime_numbers = sieve_of_eratosthenes(limit)
print("Prime numbers from 1 to {}:".format(limit), prime_numbers)

