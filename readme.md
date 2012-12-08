# Kernel for obtaining referenced-by patents

`referencedby.rb` is a simple Ruby script which will acquire the list of
patent number which are referencing a given patent.

## todo

* Wrap the kernel in a class, initialize with desired patent number,
  hold xpath parsed results in `attr_accessible :patents`.
