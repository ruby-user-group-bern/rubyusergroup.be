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

  def get_topics
    if page.has_css?('#topic_list')
      get_topics_from_widget
    else
      get_topics_from_list
    end
  end

  def get_topics_from_widget
    all('#topic_list li').inject({}) do |topics, topic_node|
      title = topic_node.find('h3').plain_text
      topic_data = {
        :title => title,
        :node => topic_node,
        :votes => topic_node.find('.vote_count').plain_text,
      }

      def topic_data.add_vote
        begin
          self[:node].find('.vote_link').click
          true
        rescue
          false
        end
      end

      topics[title] = topic_data
      topics
    end
  end

  def get_topics_from_list
    all('#topics .topic').inject({}) do |topics, topic_node|
      title = topic_node.find(:xpath, './/h2/text()').plain_text
      topic_data = {
        :title => title,
        :node => topic_node,
        :votes => topic_node.find('.votes-info .item-count').plain_text,
      }

      def topic_data.add_vote
        begin
          self[:node].find('.vote_link').click
          true
        rescue
          false
        end
      end

      topics[title] = topic_data
      topics
    end
  end


end

World(UiHelpers)
