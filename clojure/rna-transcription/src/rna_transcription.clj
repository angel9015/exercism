(ns rna-transcription
  (:require [clojure.string :as str]))

(def dna->rna {\G \C \C \G \T \A \A \U})

(defn to-rna [dna]
  {:pre  [(every? #(contains? (set (keys dna->rna)) %1) dna)]}
  (->> dna
       (map dna->rna)
       (str/join "")))