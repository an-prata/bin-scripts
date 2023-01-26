#!/usr/bin/python

import sys
import json
import subprocess

pipe = ""

for line in sys.stdin:
	pipe += line

notifications_json = json.loads(pipe)
notifications_file = open("/tmp/notifications-history.list", "w")

for notification_data in notifications_json["data"][0]:
	sys.stdout.write("\033[1m" + notification_data["appname"]["data"] + "\033[0m: " + notification_data["summary"]["data"] + "\n")
	sys.stdout.write("\t" + notification_data["body"]["data"] + "\n")
	sys.stdout.write("\n\n");

notifications_file.close()

