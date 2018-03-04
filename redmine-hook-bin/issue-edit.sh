#!/bin/bash

LOGFILE=/tmp/redmine-hook.log

echo controller_issues_edit_before_save $1 >> ${LOGFILE}

exit

