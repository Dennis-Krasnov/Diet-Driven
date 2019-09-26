#!/bin/sh

# Runs Flutter tests with optimized code coverage
flutter test --merge-coverage

# Generate lcov HTML page
genhtml coverage/lcov.info -o coverage/html

# Open results in google chrome
# google-chrome-stable coverage/html/index.html

# Experiments
#genhtml lcov.info -o coverage --no-function-coverage -s -p `pwd`
open coverage/html/index.html
