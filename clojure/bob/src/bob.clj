(ns bob
  (:require [clojure.string :as str]))

(defn- is-question? [s]
  (= (last s) \?))

(defn- is-upcase? [s]
  (and (not= s (str/lower-case s)) (= s (str/upper-case s))))

(defn response-for [s]
  (cond
    (= (str/trim s) "") "Fine. Be that way!"
    (and (is-question? s) (is-upcase? s)) "Calm down, I know what I'm doing!"
    (is-upcase? s) "Whoa, chill out!"
    (is-question? s) "Sure."
    :else "Whatever."))

