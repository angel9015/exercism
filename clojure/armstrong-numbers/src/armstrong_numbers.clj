(ns armstrong-numbers)
(defn armstrong? [num]
  (let [
    digits (str num) 
    exp (count (str num))
    sum #(reduce + %1)
    power_mapper #(-> %1 (Character/digit 10) biginteger (.pow exp))
  ]
  (= (sum (map power_mapper digits)) num)
  )
)
