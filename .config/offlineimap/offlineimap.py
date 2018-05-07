#! /usr/bin/env python
from subprocess import check_output

def get_pass(account, line=1):
    return check_output("pass %s | head -n %d | tail -n 1" % (account, line), shell=True).rstrip().decode("utf-8")

if __name__ == "__main__":
    import sys
    print(get_pass(sys.argv[1]))
