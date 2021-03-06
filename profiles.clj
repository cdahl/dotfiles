{:user 
 {:dependencies [#_[org.clojars.gjahad/debug-repl "0.3.3"]
                 #_[im.chit/vinyasa "0.2.2"]
                 #_[difform "1.1.2"]]
  :injections [#_(require 'vinyasa.inject)
               #_(require 'alex-and-georges.debug-repl)
               #_(require 'com.georgejahad.difform)
               #_(vinyasa.inject/inject 'clojure.core '>
                                        '[[clojure.repl doc source]
                                          [clojure.pprint pprint pp]
                                          [alex-and-georges.debug-repl debug-repl]
                                          [com.georgejahad.difform difform]])]
  :plugins [[lein-try "0.4.3"] ; try packages
            [cider/cider-nrepl "0.8.2"]
            [lein-ancient "0.5.5"] ; find outdated packages
            [lein-plz "0.3.0" :exclusions [[rewrite-clj] [ancient-clj]]]
            [lein-exec "0.3.4"] ; one-file execution
            [lein-drip "0.1.1-SNAPSHOT"] ; executes faster. Hopefully.
            [refactor-nrepl "0.2.2"] ; helps with refactoring
            [ragtime/ragtime.lein "0.3.7"]]}}
