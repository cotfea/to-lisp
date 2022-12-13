(env "NEWLISPDIR" ((exec (append "dirname" " " (real-path (append (real-path) "/" (main-args 1))))) 0))
(load (real-path (append (env "NEWLISPDIR") "/" "./Hello.lsp")))

(println (hello))

(exit)
