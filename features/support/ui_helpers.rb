module UiHelpers

  def flash_messages
    messages = {}
    all('.flash').each do |message|
      type = message['class'].gsub('flash', '').strip
      messages[type] ||= []
      messages[type] << message.text
    end
    messages
  end

end

World(UiHelpers)
