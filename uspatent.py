#!/usr/bin/env python

# vim: tabstop=4:softtabstop=4:shiftwidth=4:expandtab

# This script is a first cut at extracting various types of patents
# from the USPTO databased citations. The citations consist of
# US patent grant numbers, US patent application document number (DN),
# and foreign patents with a variety of letter/number combinations.

# The idea is to search using a specified regex, as shown by the
# find_patents function. 

# This code is currently unfinished, as the need has passed.
# The test code contains more details on how the code is
# invoked.

import sqlite3
import re

def regexp(expr, item):
    reg = re.compile(expr)
    return reg.search(item) is not None

def find_patents(cursor, regexp):
    cursor.execute("select * from cleancites where patent REGEXP ?", [regexp])
    return cursor.fetchall()

# dumb name, need something, anything to get started
def run_script():
    print "running script"

if __name __ == '__main__':
    run_script()
