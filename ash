#!/usr/bin/python3

import configparser
import subprocess
import os
import sys

home_dir = os.environ['HOME']
config_file = home_dir + "/.ssh/aconfig"
arg_len = len(sys.argv)
params = []

config = configparser.ConfigParser()
config.read(config_file)

if arg_len == 1:
	print("Need a hostname")
	sys.exit(1)

if config.has_option(sys.argv[1], 'hostname'):
	host_alias = sys.argv[1]
	hostname = config[sys.argv[1]]['hostname']
	params.append("ssh")
	params.append(hostname)
else:
	print("Hostname didn't found in config")
	sys.exit(1)

if config.has_option(host_alias, 'user'):
	user = config[host_alias]['user']
	params.append("-l")
	params.append(user)

if arg_len == 3:
	params.append("-t")
	params.append("ssh")
	params.append(sys.argv[2])

if config.has_option(host_alias, 'run_after'):
	run_after = config[host_alias]['run_after']
	params.append("-t")
	params.append(run_after)

subprocess.call(params)
