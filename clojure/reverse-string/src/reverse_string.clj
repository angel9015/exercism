(ns reverse-string)


(defn- reverse-string-tc [s acc]
  (if (= (count s) 0)
    acc
    (recur (rest s) (cons (first s) acc))))

(defn reverse-string [s]
  (clojure.string/join "" 
  (reverse-string-tc s [])))
