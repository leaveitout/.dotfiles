#!/usr/bin/env python3
"""
Copyright Sean Bruton
Contact sbruton$$$$á££££tcd.ie. (Take away the currency symbols)
"""
import argparse
import sys
import subprocess


def activate_white_noise():
    cmd = 'play -n synth brownnoise synth pinknoise mix'
    subprocess.check_output(cmd, shell=True)
    return 0


if __name__ == '__main__':
    parser = argparse.ArgumentParser(
        description="Activate white noise.")
    args = parser.parse_args()

    sys.exit(activate_white_noise())
