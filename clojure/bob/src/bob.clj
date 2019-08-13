(ns bob
  (:require [clojure.string :as str]))

(defn- is-empty? [s]
  (= (str/trim s) ""))

(defn- is-question? [s]
  (= (last s) \?))

(defn- is-upcase? [s]
  (and (not-any? #(Character/isLowerCase %) s) (some #(Character/isUpperCase %) s)))
  
(defn response-for [s]
  (cond
    (is-empty? s) "Fine. Be that way!"
    (and (is-question? s) (is-upcase? s)) "Calm down, I know what I'm doing!"
    (is-upcase? s) "Whoa, chill out!"
    (is-question? s) "Sure."
    :else "Whatever."))

