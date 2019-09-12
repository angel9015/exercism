(ns run-length-encoding)

(defn- enc-mapper [l]
  "encode a sequence of same characters"
  (let [ch (first l)
        cnt (count l)]
    (str (if (> cnt 1) cnt "") ch)))

; Partition by identity so that we'll have arrays of characters and pass to enc-mapper
; enc-mapper will return the length of the array (or nothing if length == 1) and the character
(defn run-length-encode
  "encodes a string with run-length-encoding"
  [plain-text]
  (->> plain-text
       (partition-by identity)
       (map enc-mapper)
       (clojure.string/join "")))

(defn- dec-converter [s]
  "decode a sequence of same characters"
  (if (= (count s) 1)
    s
    (let [number (Integer/parseInt (subs s 0 (- (count s) 1)))
          letter (last s)]
      (clojure.string/join (repeat number letter)))))

(defn run-length-decode
  "decodes a run-length-encoded string"
  [cipher-text]
  (->> cipher-text
       (re-seq #"\d*.")
       (map dec-converter)
       (clojure.string/join "")))