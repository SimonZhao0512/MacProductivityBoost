#!/bin/bash

# Enable debugging mode
set -x

# Automated file management system
# Monitor the Desktop directory for new files

# Change /Users/your_name/Desktop into desired directory
fswatch -0 -i "Created,Updated,IsFile" /Users/your_name/Desktop | \

#if conditions that sends files to different folders
xargs -0 -n 1 -I {} sh -c 'if echo "$1" | grep -iq "notes"; then \
cp "$1" /Users/yuhongzhao/Desktop/program\ language\ learning/; else cp "$1" /Users/yuhongzhao/Desktop/TestSimon/; fi' -- {}




# Disable debugging mode
set +x




