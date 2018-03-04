module RedmineIssueExec
  class Hooks < Redmine::Hook::ViewListener
    def controller_issues_new_after_save(context={})
      issue_controller = context[:controller]
      issue=context[:issue]
      params = context[:params]
      url = issue_controller.issue_url( issue )
      #system( 'echo def controller_issues_new_after_save > /tmp/redmine-hook.log')
      exec = '/opt/redmine/bin/issue_new.py ' + url
      system( exec )
    end

    def controller_issues_edit_before_save(context={})
      issue_controller = context[:controller]
      issue=context[:issue]
      params = context[:params]
      url = issue_controller.issue_url( issue )
      #system( 'echo controller_issues_edit_before_save > /tmp/redmine-hook.log')
      exec = '/opt/redmine/bin/issue_edit.py ' + url
      system( exec )
    end

    def controller_issues_bulk_edit_before_save(context={})
      issue_controller = context[:controller]
      issue = context[:issue]
      url = issue_controller.issue_url( issue )
      #system( 'echo controller_issues_bulk_edit_before_save > /tmp/redmine-hook.log')
      exec = '/opt/redmine/bin/issue_edit.py ' + url
      system( exec )
    end

  end
end

=begin
http://www.infocircus.jp/tools/redmine-issue-exec

=end
