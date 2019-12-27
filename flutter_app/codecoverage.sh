#!/bin/sh

# Runs Flutter tests with optimized code coverage
flutter test --merge-coverage

# Remove generated files from coverage
lcov --remove coverage/lcov.info '*.g.dart' --output-file coverage/lcov-clean.info

# Generate lcov HTML page
genhtml coverage/lcov-clean.info -o coverage/html

# Open results in google chrome
# google-chrome-stable coverage/html/index.html

# Experiments
#genhtml lcov.info -o coverage --no-function-coverage -s -p `pwd`
open coverage/html/index.html


# Run initial/baseline lcov
# lcov --no-external --capture --initial --directory /usr/local/src/libreoffice --output-file /tmp/libreoffice_base.info
# Run tests
# make -k check
# Run lcov again after tests/checks complete
# lcov --no-external --capture --directory /usr/local/src/libreoffice --output-file /tmp/libreoffice_test.info
# Combine lcov tracefiles
# lcov --add-tracefile /tmp/libreoffice_base.info --add-tracefile /tmp/libreoffice_test.info --output-file /tmp/libreoffice_total.info
# Remove / filter out remaining unwanted stuff from tracefile
# lcov --remove /tmp/libreoffice_total.info '/usr/include/*' '/usr/lib/*' '/usr/local/src/libreoffice/*/UnpackedTarball/*' \
# '/usr/local/src/libreoffice/workdir/*' '/usr/local/src/libreoffice/instdir/*' '/usr/local/src/libreoffice/external/*' \
# -o /tmp/libreoffice_filtered.info
# Create a storage directory
# rm -rf /tmp/libreoffice-lcov/
# mkdir /tmp/libreoffice-lcov/
# Retrieve software version
# cd /usr/local/src/libreoffice
# git log | head
# Create reports
# genhtml --prefix /usr/local/src/libreoffice --ignore-errors source /tmp/libreoffice_filtered.info \
# --legend --title "commit SHA1" --output-directory=/tmp/libreoffice-lcov