(ns rna-transcription
  (:require [clojure.string :as str]))


(defn to-rna [dna]
  (str/join
   ""
   (map #(case %1
           \G \C
           \C \G
           \T \A
           \A \U
           (throw (AssertionError. "Wrong input.")))
        dna)))
