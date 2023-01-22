(defn get-divisors [n]
  (range 2 (inc (Math/floor (Math/sqrt n))))
)

(defn divides? [x n]
  (= (mod x n)0)
)

(defn no-dividors? [n]
   (= (count (filter (partial divides? n )(get-divisors n)))0)
)
(defn is-prime? [n]
  (if (= n 1)
    false
    (if (= n 2)
      true
      (no-dividors? n)
    )
  )
)
(defn prime-seq [from to]
  (filter is-prime?(range from (inc to)))
)
(defn print-top-primes [from to]
  (doseq [x (take 10 (reverse (prime-seq from to)))]
    (println x)
  )
  (str "Total = " (reduce + (take 10 (reverse (prime-seq from to)))))
)

(println (get-divisors 10))
(println (divides? 10 2))
(println (divides? 10 3))
(println (no-dividors? 7))
(println (is-prime? 11))
(println (prime-seq 50 100))
(println (print-top-primes 7 11))
