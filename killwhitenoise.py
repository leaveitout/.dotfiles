#!/usr/bin/env python3
"""
Copyright Sean Bruton
Contact sbruton$$$$á££££tcd.ie. (Take away the currency symbols)
"""
import argparse
import sys
import subprocess


def kill_play():
    cmd = 'pkill -n play'
    subprocess.check_output(cmd, shell=True)
    return 0


if __name__ == '__main__':
    parser = argparse.ArgumentParser(
        description="Kill white noise that is being played with play -n ...")
    args = parser.parse_args()

    sys.exit(kill_play())
