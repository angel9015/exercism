(ns run-length-encoding)

(defn- enc-mapper [l]
  (let [ch (first l)
        cnt (count l)]
    (str (if (> cnt 1) cnt "") ch)))

; Partition by identity so that we'll have arrays of characters and pass to enc-mapper
; enc-mapper will return the length of the array (or nothing if length == 1) and the character
(defn run-length-encode
  "encodes a string with run-length-encoding"
  [plain-text]
  (->> plain-text (partition-by identity) (map enc-mapper) (clojure.string/join "")))

; The el-is-number? and el-as-number should be simplified somehow but I'm not very
; familiar with the clojure stdlib
; Notice that if the current element is a number we update the acc-counter element of the accuulator
; If the current element is a letter we use the acc-counter value to repeat that letter as many times
(defn- dec-reducer [acc el]
  (let [acc-counter (first acc)
        partial-result (second acc)
        el-is-number? (and (>= (int el) (int \0)) (<= (int el) (int \9)))
        el-as-number (- (int el) 48)]
    (if el-is-number?
      [(+ (* 10 acc-counter) el-as-number) partial-result]
      [0 (str partial-result (apply str (repeat (if (= 0 acc-counter) 1 acc-counter) (str el))))])))

; Just pass the cipher-text to the dec-reducer. The accumulator is a vector that has
; the repeat counter and the partial result. Notice that the repeat counter will be updated
; properly if we have two numbers (for example 11)
(defn run-length-decode
  "decodes a run-length-encoded string"
  [cipher-text]
  (->> cipher-text (reduce dec-reducer [0 ""]) second))
