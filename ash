#!/usr/bin/python

import argparse
import configparser
import os
import subprocess

from sys import exit

home_dir = os.environ["HOME"]
config_file = home_dir + "/.ssh/aconfig"

# list for ssh params
params = []
params.append("ssh")
params.append("-t")

config = configparser.ConfigParser()
config.read(config_file)

parser = argparse.ArgumentParser(description="ash help")
parser.add_argument("hosts", metavar="HOST", nargs="*",
					help="host or hosts' list")
parser.add_argument("--no-command", "-n", action="store_true",
					help="Doesn't run command after login")
args = parser.parse_args()

if not len(args.hosts) > 2:
	hostname = args.hosts[0]
	if config.has_option(hostname, "hostname"):
		host_address = config[hostname]["hostname"]
		params.append(host_address)
	else:
 		print("Hostname '{0}' didn't found in config '{1}'".format(
			hostname, config_file))
 		exit(1)

	if config.has_option(hostname, "user"):
		user = config[hostname]["user"]
		params.append("-l")
		params.append(user)

	if len(args.hosts) == 2:
		params.append("ssh")
		params.append("-t")
		params.append(args.hosts[1])

	if not args.no_command and config.has_option(hostname, "command"):
		params.append(config[hostname]["command"])

else:
	print("Supported only one or two hosts!")
	exit(1)

# TODO: meybe detach?
subprocess.call(params)
