class SlackUserNotifier
  def self.notifier
    @notifier ||= Slack::Notifier.new "https://hooks.slack.com/services/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"
  end

  def self.send(text)
    notifier.ping(text)
  end
end
