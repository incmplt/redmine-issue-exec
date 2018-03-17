# redmine-issue-exec
# AUTHOR: Yasushi.ABE@InfoCircus.JP

MODNAME='redmine_issue_exec'
RMPATH='/var/lib/redmine'
PREFIX='/opt/redmine'

install:
	-mkdir -p ${RMPATH}/plugins/${MODNAME}
	-cp -a ./redmine_issue_exec/* ${RMPATH}/plugins/${MODNAME}/
	-mkdir -p ${PREFIX}
	-mkdir -p ${PREFIX}/bin
	-cp -a ./redmine-hook-bin/* ${PREFIX}/bin/
	-chmod 0755 ${PREFIX}/bin/*.sh
	-chmod 0755 ${PREFIX}/bin/*.py


