(ns clock)

(defn clock->string [[h m]]
  (format "%02d:%02d" h m))

(defn- fix-minutes [m]
  (let [rem-min (rem m 60)]
    (if (< rem-min 0)
      (+ 60 rem-min)
      rem-min)))

(defn- fix-hours [h m]
  (let [quot-min (quot m 60)
        rem-hour (if (< m 0) (- quot-min 1) quot-min)
        tot-hour (+ h rem-hour)
        rem-hour (rem tot-hour 24)]
    (if (< rem-hour 0)
      (+ 24 rem-hour)
      rem-hour)))

(defn clock [hours minutes]
  [(fix-hours hours minutes) (fix-minutes minutes)])

(defn add-time [[h m] time]
  (clock h (+ m time)))
