(ns word-count
  (:require [clojure.string :as str]))

(defn reducer [acc word]
  (update acc word #(if (nil? %1) 1 (inc %1))))

(defn word-count [s]
  (let [words (str/split (str/lower-case s) #"[^A-Za-z0-9]+")]
  (reduce reducer {} words)))
