(ns sieve)

(defn not-in [col el] (not (some #(= el %1) col)))

(defn- do-sieve [numbers primes]
  (cond
    (empty? numbers) primes
    :else (let [current-number (first numbers)
                new-primes (conj primes current-number)
                last-number (last numbers)
                to-sieve (range current-number (+ 1 last-number) current-number)
                sieved (filter #(not-in to-sieve %1) numbers)]
            (recur sieved new-primes))))


(defn sieve [number]
  (do-sieve (range 2 (+ 1 number)) []))

