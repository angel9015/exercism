(ns matching-brackets)

(def bracket-pairs {\} \{ \] \[ \) \(})
(def opening-brackets (set (vals bracket-pairs)))
(def closing-brackets (set (keys bracket-pairs)))

; The reducer checks each element. The passed list is used as a stack
; If it is an opening bracket it just puts it in the top of the list
; If it is a closing bracket it checks to see if it closes the bracket at the top and if yes it removes it
; from the stack. If the closing bracket does not match it will append the closing bracket to the stack
; Other characters are ignored
(defn- bracket-reducer [[fst & rst :as acc] el]
  (cond
    (opening-brackets el) (cons el acc)
    (closing-brackets el) (if (= fst (get bracket-pairs el)) (rest acc) (cons el acc))
    true acc))

; Reduce the characters into a list; if the length of that list is 0 then the brackets are matching
(defn valid? [brackets]
  (= 0 (count (reduce bracket-reducer '() brackets))))


