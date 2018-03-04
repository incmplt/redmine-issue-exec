Redmine-Issue-Execute-hook
====

Overview

Redmine Issue(チケット)を更新したときに、外部のシステムに対してコマンドを実行するための連携用プラグイン。
Redmine Hook の以下のHookで、外部コマンドを実行する仕組み。

* Issue追加(controller_issues_new_after_save)
* Issue更新(controller_issues_edit_before_save)
* Issue一括更新(controller_issues_bulk_edit_before_save)

本プラグインは Redmine 2.4以降でHookの場所がControllerに変更になった後のシステムで実行するためのプラグインである。
Redmine 2.4以前の環境では動作しない。

https://github.com/incmplt/redmine-issue-exec.git

## Description

## Requirement

開発で確認した環境は以下の通り。

* ruby 2.3.4p301 (2017-03-30 revision 58214)
* Rails 4.2.7.1
* Redmine 3.3.3.stable

## Usage

* redmine_issue_exec をインストール
* lib/redmine_issue_exec/hooks.rb の実行コマンドを変更
* Redmineの再起動


## Install

以下の手順により Redmine に redmine_issue_exec プラグインをインストールする。

```bash:install
# /tmp
# git clone https://github.com/incmplt/redmine-issue-exec.git
# cd redmine-issue-exec
# mv ./redmine_issue_exec [PATH_TO_REDMINE_DIRECTORY]/plugins/
# cd [PATH_TO_REDMINE_DIRECTORY]/plugins/
# chown -Rf [REDMINE_USER] ./redmine-issue-exec/
# /etc/init.d/httpd restart
```

Hookのサンプルスクリプトは、以下の手順で配置する。

```bash:sample
# cd redmine-issue-exec
# mkdir -p /opt/redmine/bin
# cp -a ./redmine-hook-bin/* /opt/redmine/bin/
# chmod 0755 /opt/redmine/bin/*.sh
```

Hookが動作してサンプルのスクリプトが実行されると /tmp/redmine-hook.log に実行された内容が記録される。


## Licence

## Author

[incmplt](https://github.com/incmplt)
