(ns anagram
  (:require [clojure.string :as str]))

(defn- is-anagram? [word1 word2]
  (let [l-word1 (str/lower-case word1)
        l-word2 (str/lower-case word2)
        s-word1 (sort l-word1)
        s-word2 (sort l-word2)]
    (and (= s-word1 s-word2) (not= l-word1 l-word2))))

(defn anagrams-for [word prospect-list]
  (filter (partial is-anagram? word) prospect-list))
