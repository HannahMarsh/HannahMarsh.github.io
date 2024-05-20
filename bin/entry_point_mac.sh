#!/bin/bash

CONFIG_FILE=_config.yml

/bin/bash -c "rm -f Gemfile.lock && exec jekyll serve --watch --port=8080 --host=0.0.0.0 --livereload --verbose --trace --force_polling"&

while true; do

  fswatch -o $CONFIG_FILE | read

  echo "Change detected to $CONFIG_FILE, restarting Jekyll"

  jekyll_pid=$(pgrep -f jekyll)
  kill -KILL $jekyll_pid

  /bin/bash -c "rm -f Gemfile.lock && exec jekyll serve --watch --port=8080 --host=0.0.0.0 --livereload --verbose --trace --force_polling"&

done
