#!/usr/bin/env python

# vim: tabstop=4:softtabstop=4:shiftwidth=4:expandtab

import unittest
import sys
import sqlite3
import csv
import re

sys.path.append('.')
sys.path.append('..')

from uspatent import regexp
from uspatent import find_patents

class TestRefClean(unittest.TestCase):

    def setUp(self):
        self.conn = sqlite3.connect(":memory:")
        self.cursor = self.conn.cursor()
        self.cursor.execute("create table cleancites(patent TEXT, referencedby TEXT, date TEXT)")
        reader = csv.reader(open('./fixtures/referencedby.csv', 'r'))
        for row in reader:
            to_db = [unicode(row[0], "utf8"), unicode(row[1], "utf8"), unicode(row[2], "utf8")]
            self.cursor.execute("insert into cleancites (patent, referencedby, date) VALUES (?, ?, ?);", to_db)
        self.conn.commit()

    def test_select(self):
        self.conn.create_function("REGEXP", 2, regexp)
        data = find_patents(self.cursor, '2007') # self.cursor.fetchall()
	assert([(u'2007-087468', u'7843743', u'3/13/08')] == data)


if __name__ == '__main__':
    unittest.main()
