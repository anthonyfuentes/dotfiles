# eden functions
##################

# grdn: `clj-kondo` against dir
gkond () {
  clj-kondo --lint $1 --config .clj-kondo/config.edn
}

# grdn: `lein cljfmt fix` against fs elements
gfmt () {
  lein cljfmt fix $@
}
