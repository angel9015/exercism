(ns isbn-verifier)

(defn- to-num-list [isbn]
  "convert to a number list; X will be converted to 10"
  (map #(if (= % \X)
          10
          (Integer/parseInt (str %))) isbn))

(defn- calculate-checksum [numbers]
  "calc the checksum; multiply each number by 10 - idx (so the first number) will by multipled by 10 etc
  and get the sum"
  (->> numbers
       (map-indexed (fn [idx el] (* el (- 10 idx))))
       (reduce +)))

(defn isbn? [isbn]
  "first make sure that the isbn is valid: contains 9 digits and a digit or X; also remove
  any dashes but don't allow anything else. Then pass the normalized isbn to to-num-list
  to get an array of numbers and to calculate-checksum to get the actualy checksum. Finally
  make sure that this checksum mod 11 == 0"
  (let [normalized-isbn (re-find #"^\d{9}[X\d]$" (clojure.string/replace isbn "-" ""))]
    (if-not normalized-isbn false (->
                         normalized-isbn
                         to-num-list
                         calculate-checksum
                         (mod 11)
                         zero?) )))
