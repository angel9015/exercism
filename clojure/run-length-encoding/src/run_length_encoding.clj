(ns run-length-encoding)

(defn- enc-mapper [l]
  (let [ch (first l)
        cnt (count l)]
    (str (if (> cnt 1) cnt "") ch)))

(defn run-length-encode
  "encodes a string with run-length-encoding"
  [plain-text]
  (->> plain-text (partition-by identity) (map enc-mapper) (clojure.string/join "")))


(defn- dec-reducer [acc el]
  (let [acc-counter (first acc)
        partial-result (second acc)
        el-is-number ()]
    )
  
  )

(defn run-length-decode
  "decodes a run-length-encoded string"
  [cipher-text]
  (->> cipher-text (reduce dec-reducer []) second))
