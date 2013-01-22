#!/usr/bin/env python

# vim: tabstop=4:softtabstop=4:shiftwidth=4:expandtab

import sqlite3
import re

def regexp(expr, item):
    reg = re.compile(expr)
    return reg.search(item) is not None

def find_patents(cursor, regexp):
    cursor.execute("select * from cleancites where patent REGEXP ?", [regexp])
    return cursor.fetchall()
