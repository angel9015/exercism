(ns bob
  (:require [clojure.string :as str]))

(defn response-for [s]
  (cond
    (= (str/trim s) "") "Fine. Be that way!"
    (and (= (last s) \?) (not= s (str/lower-case s)) (= s (str/upper-case s))) "Calm down, I know what I'm doing!"
    (and (not= s (str/lower-case s)) (= s (str/upper-case s))) "Whoa, chill out!"
    (= (last s)  \?) "Sure."
    :else "Whatever."))

