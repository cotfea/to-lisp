(load "lib/hello.lisp")

(hello)
(hello "Lisp")

(load "lib/common/print.lisp")

(println "~a"
  (merge-pathnames "lib/common" *default-pathname-defaults*)
)

(println "~a"
  (posix-getenv "PATH")
)

(println "~a"
  (sb-posix:getcwd)
)

(sb-ext:run-program "/usr/bin/bash"
  (list "-c" "echo \"Hello World!!!\"")
  :input nil
  :output *standard-output*
)

(println "~a"
  *posix-argv*
)
