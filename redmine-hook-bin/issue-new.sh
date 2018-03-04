#!/bin/bash

LOGFILE=/tmp/redmine-hook.log

echo controller_issues_new_after_save $1 >> ${LOGFILE}

exit

