#!/usr/bin/env python3
"""
Copyright Sean Bruton
Contact sbruton$$$$á££££tcd.ie. (Take away the currency symbols)
"""
import argparse
import sys
import subprocess


def cmd_output_to_str_list(output):
    output_str = str(output)
    output_list = output_str.split('\\n')
    # Remove the bytes marker from the first element
    output_list_as_str = [output_list[0][2:]]
    # Trim the last apostrophe
    for idx in range(1, len(output_list) - 1):
        output_list_as_str.append(output_list[idx])

    return output_list_as_str


def get_current_desktop():
    # TODO: Test this for no valid desktop, e.g. ssh connection
    current_desktop = subprocess.check_output(['xdotool get_desktop'],
                                              shell=True)
    return int(current_desktop)


def get_window_ids(name):
    cmd = 'xdotool search --class ' + name
    # TODO: Get the return code if if has no valid windows
    try:
        output = subprocess.check_output(cmd, shell=True)
    except subprocess.CalledProcessError as e:
        raise ValueError("Could not match search pattern: {}".format(name))

    output_str_list = cmd_output_to_str_list(output)

    output_int_list = [int(el) for el in output_str_list]

    return output_int_list


def find_window_id_on_current_desktop(window_ids, desktop_id):
    cmd = 'wmctrl -l'
    output = subprocess.check_output(cmd, shell=True)
    output_str_list = cmd_output_to_str_list(output)

    ids_desktops_list = [el.split()[:2] for el in output_str_list]

    for window in ids_desktops_list:
        if int(window[1]) == desktop_id:
            if int(window[0], 0) in window_ids:
                return int(window[0], 0)

    return 0


def activate_window(name):
    curr_desktop = get_current_desktop()
    window_ids = get_window_ids(name)
    id = find_window_id_on_current_desktop(window_ids, curr_desktop)
    # TODO: Use exceptions
    if id != 0:
        cmd = 'xdotool windowactivate ' + str(id)
        subprocess.check_output(cmd, shell=True)
        return 0

    return 1


if __name__ == '__main__':
    parser = argparse.ArgumentParser(
        description="Activate window on desktop matching a name")
    parser.add_argument("searchname",
                        help="The search name of the window, e.g. chrome",
                        type=str)
    args = parser.parse_args()

    sys.exit(activate_window(args.searchname))
