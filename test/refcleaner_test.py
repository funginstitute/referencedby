#!/usr/bin/env python

import unittest
import sys
import sqlite3

sys.path.append('.')
sys.path.append('..')

class TestRefClean(unittest.TestCase):

	def setUp(self):
		print "foo"

if __name__ == '__main__':
	unittest.main()
