#!/usr/bin/env python

# vim: tabstop=4:softtabstop=4:shiftwidth=4:expandtab

import unittest
import sys
import sqlite3
import csv
import re

sys.path.append('.')
sys.path.append('..')

def regexp(expr, item):
    reg = re.compile(expr)
    return reg.search(item) is not None

class TestRefClean(unittest.TestCase):

    def setUp(self):
        conn = sqlite3.connect(":memory:")
        cursor = conn.cursor()
        cursor.execute("create table cleancites(patent TEXT, referencedby TEXT, date TEXT)")
        reader = csv.reader(open('./fixtures/referencedby.csv', 'r'))
        for row in reader:
            to_db = [unicode(row[0], "utf8"), unicode(row[1], "utf8"), unicode(row[2], "utf8")]
            cursor.execute("insert into cleancites (patent, referencedby, date) VALUES (?, ?, ?);", to_db)
        conn.commit()
        conn.create_function("REGEXP", 2, regexp)
        #cursor.execute("select * from cleancites where patent REGEXP ?", ['^0\d{7}\Z'])
        cursor.execute("select * from cleancites where patent REGEXP ?", ['2007'])
        data = cursor.fetchall()
        print(data)



    def test_foo(self):
        print "foo"

if __name__ == '__main__':
    unittest.main()
