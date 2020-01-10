#!/usr/local/bin/python3
import argparse
import ffmpeg
import json

arg_parser = argparse.ArgumentParser(description="Harvest footage from the SmartWay traffic cameras in regular time intervals specified by the user.")
interval_arg_group = arg_parser.add_mutually_exclusive_group()
interval_arg_group.add_argument("-is", "--interval_seconds", help="Set the interval (seconds) for the clip durations.")
interval_arg_group.add_argument("-im", "--interval_minutes", help="Set the interval (minutes) for the clip durations.")
interval_arg_group.add_argument("-ih", "--interval_hours", help="Set the interval (hours) for the clip durations.")

args = arg_parser.parse_args()

if args.interval_seconds:
	print("{} seconds".format(args.interval_seconds))
else:
	print("not seconds")


