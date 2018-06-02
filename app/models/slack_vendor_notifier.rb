class SlackVendorNotifier
  def self.notifier
    @notifier ||= Slack::Notifier.new "https://hooks.slack.com/services/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"
  end

  def self.send(text)
    notifier.ping(text)
  end
end
