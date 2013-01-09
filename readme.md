# Kernel for obtaining referenced-by patents

`referencedby.rb` is a simple Ruby application which acquires a list of
patent numbers which are referencing a given patent.

The application's purpose is to:

* Verify accuracy of ongoing updates for referenced by 
  patent table resulting from SQL query.
* Provide a snapshot of a selection of patent web pages displayed
  on both Google and USPTO for providing test data and long term
  monitoring of changes in displayed data.



spec: manual counts to match. separate test fixtures from

### Structure of data

The patent web pages are stored in the `./data` directory, sorted
according to provenance.

* USPTO
* Google


### Reporting results

Consider making output as report? The idea is making it super easy to
check results visually.

## TODO

* Wrap the kernel in a class, initialize with desired patent number,
  hold xpath parsed results in `attr_accessible :patents`.

