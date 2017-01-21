default[:run_notifier][:hipchat] = {}
# Disable hipchat
default[:run_notifier][:hipchat][:enabled] = false
default[:run_notifier][:slack] = {}

# Enable slack
default[:run_notifier][:slack][:enabled] = true
default[:run_notifier][:slack][:webhook_url] = "https://hooks.slack.com/services/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"
default[:run_notifier][:slack][:channel] = "#general"
