;; Declare namespace according to
;;  your package in a project.
(ns hello
    (:gen-class
     :main true
     :aot [hello.main]))

;; Main function.
(defn -main []
  (println "Hello World")
  ; Optional return value.
  (java.lang.System/exit 0))

;; Only run in scripting mode.
(when (not *compile-files*)
  (hello/-main))
