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

  # def get_topics
  #   if page.has_css?('#topic-list.sidebar')
  #     get_topics_from_list
  #   else
  #     get_topics_from_widget
  #   end
  # end

  def get_topics
    all('#topic-list li').inject({}) do |topics, topic_node|
      title = topic_node.find('.vote-info-box span').plain_text
      topic_data = {
        :title => title,
        :node => topic_node,
        :votes => topic_node.find('.vote-count').plain_text,
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

  def get_topics_from_widget
    all('#topic-list li').inject({}) do |topics, topic_node|
      title = topic_node.find('.vote-info-box').plain_text
      topic_data = {
        :title => title,
        :node => topic_node,
        :votes => topic_node.find('.vote-count').plain_text,
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
      title = topic_node.find('.vote-info-box').plain_text
      topic_data = {
        :title => title,
        :node => topic_node,
        :votes => topic_node.find('.votes-info .vote-count').plain_text,
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
