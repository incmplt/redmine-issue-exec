Redmine-Issue-Execute-hook
====

Redmine Issue(チケット)を更新したときに、外部のシステムに対してコマンドを実行するための連携用プラグイン。
Redmine Hook の以下のHookで、外部コマンドを実行する仕組み。

* Issue追加(controller_issues_new_after_save)
* Issue更新(controller_issues_edit_before_save)
* Issue一括更新(controller_issues_bulk_edit_before_save)

本プラグインは Redmine 2.4以降でHookの場所がControllerに変更になった後のシステムで実行するためのプラグインである。

Redmine 2.4以前の環境では動作しない。

https://github.com/incmplt/redmine-issue-exec.git

## Description

ことの経緯は Redmine 2.4以降、Hookの場所がControllerに移動され、「日本語の」プラグインサイトでは、2.3までの情報しかなかったことから、このプラグインを開発することになった。

本来なら Redmine Hook Pluginで、処理を直接書くのが正しいやりかたと思われるが、仕様の変更やRedmineのバージョンアップなどで動作不良を起こすリスクを最低限にしたかったため、本プラグインでIssueの変更だけを検出し、実際の処理は外部に委託する方式にしている。

本プラグインを使用した「想定した理想的なストーリー」は、次のようなもの。

* redmine_issue_exec でIssue(チケット)の変更を検出
* 変更のあったIssueのURLを引数としてsystem関数で外部プログラムを呼び出し
* 外部プログラムは Redmine APIを使用して Issueの情報を取得
* 必要な処理を実施


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

Hookが動作してサンプルのスクリプトが実行されると /tmp/redmine-hook.log に実行されたIssueのURLが記録される。
URlがわかるので、Redmine APIを経由してIssueのデータを取得して外部システムに渡す形式で処理を拡張する。

```bash:log
# cat /tmp/redmine-hook.log
controller_issues_edit_after_save http://localhost/redmine/issues/74
controller_issues_edit_after_save http://localhost/redmine/issues/74
controller_issues_edit_after_save http://localhost/redmine/issues/85
controller_issues_new_after_save http://localhost/redmine/issues/92
```



## Licence

## Author

[incmplt](https://github.com/incmplt)
