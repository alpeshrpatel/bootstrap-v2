#!/bin/bash

# http://hacktux.com/bash/control/c
cleanup()
# example cleanup function
{
  kill $WATCH_PID $SERVE_PID
  return $?
}

control_c()
# run if user hits control-c
{
  echo -en "\n*** Exiting ***\n"
  cleanup
  exit $?
}

# trap keyboard interrupt (control-c)
trap control_c SIGINT

make watch &
WATCH_PID=$!
cd docs
python -m SimpleHTTPServer &
SERVE_PID=$!
cd ..

sleep 2
echo -e "\n*** ctrl-c to exit ***\n"
open "http://localhost:8000"

while true; do sleep 1; done
