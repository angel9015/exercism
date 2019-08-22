(ns sieve)

(defn- do-sieve [numbers primes]
  (cond
    (empty? numbers) primes
    :else (let [current-number (first numbers)
                new-primes (conj primes current-number)
                last-number (last numbers)
                to-sieve (into [] (range current-number last-number current-number))
                sieved (map #(not (contains? to-sieve %1)) numbers)]
            (do-sieve sieved new-primes))))


(defn sieve [number]
  (do-sieve (range 2 number) []))

