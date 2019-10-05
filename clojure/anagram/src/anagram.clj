(ns anagram
  (:require [clojure.set :as set]))

(defn- is-anagram? [word1 word2]
  (let [l-word1 (clojure.string/lower-case word1)
        l-word2 (clojure.string/lower-case word2)
        s-word1 (sort (seq l-word1))
        s-word2 (sort (seq l-word2))]
    (and (= s-word1 s-word2) (not= l-word1 l-word2))))

(defn anagrams-for [word prospect-list]
  (filter #(is-anagram? %1 word) prospect-list))
