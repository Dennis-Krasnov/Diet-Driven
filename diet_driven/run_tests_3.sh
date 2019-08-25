#!/bin/sh

flutter test --merge-coverage
genhtml coverage/lcov.info -o coverage/html

#genhtml lcov.info -o coverage --no-function-coverage -s -p `pwd`
#open coverage/html/index.html

google-chrome-stable coverage/html/index.html
