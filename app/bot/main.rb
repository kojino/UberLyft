require "facebook/messenger"
include Facebook::Messenger

Facebook::Messenger::Subscriptions.subscribe(access_token: ENV["ACCESS_TOKEN"])
Facebook::Messenger::Thread.set({
  setting_type: 'greeting',
  greeting: {
    text: "I'll find you the best price options for your Uber/Lyft rides."
  },
}, access_token: ENV['ACCESS_TOKEN'])

Facebook::Messenger::Thread.set({
  setting_type: 'call_to_actions',
  thread_state: 'new_thread',
  call_to_actions: [
    {
      payload: 'start'
    }
  ]
}, access_token: ENV['ACCESS_TOKEN'])

Facebook::Messenger::Thread.set({
  setting_type: 'call_to_actions',
  thread_state: 'existing_thread',
  call_to_actions: [
    {
      type: 'postback',
      title: 'Help',
      payload: 'DEVELOPER_DEFINED_PAYLOAD_FOR_HELP'
    },
    {
      type: 'postback',
      title: 'Start a New Order',
      payload: 'DEVELOPER_DEFINED_PAYLOAD_FOR_START_ORDER'
    },
    {
      type: 'web_url',
      title: 'View Website',
      url: 'http://example.com/'
    }
  ]
}, access_token: ENV['ACCESS_TOKEN'])


Bot.on :message do |message|
  fb_uid = message.sender['id']
  user = User.find_or_create_by(fb_uid: fb_uid)
  @messages = []
  @status   = user.status

  case @status

  ## ONBOARING ##
  when 'start'
    message.reply(text: 'Hello, human!')
  end
end
