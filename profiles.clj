{:user 
 {:dependencies [[org.clojars.gjahad/debug-repl "0.3.3"]
                 [im.chit/vinyasa "0.2.2"]
                 [difform "1.1.2"]]
  :injections [(require 'vinyasa.inject)
               (require 'alex-and-georges.debug-repl)
               (require 'com.georgejahad.difform)
               #_(vinyasa.inject/inject 'clojure.core '>
                                      '[[clojure.repl doc source]
                                        [clojure.pprint pprint pp]
                                        [alex-and-georges.debug-repl debug-repl]
                                        [com.georgejahad.difform difform]])]
  :plugins [[lein-try "0.4.3"]
            [cider/cider-nrepl "0.8.1"]
            [lein-ancient "0.5.5"]
            [lein-plz "0.3.0" :exclusions [[rewrite-clj] [ancient-clj]]]
            [lein-exec "0.3.4"]
            [lein-drip "0.1.1-SNAPSHOT"]
            [ragtime/ragtime.lein "0.3.7"]]}}
