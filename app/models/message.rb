class Message < ActiveRecord::Base
  attr_accessible :text, :recipient, :sender, :channelMessages
  has_many :senders
  has_many :recipients
  has_many :channelMessages
  
  class << self
    def since(this_time)
      where{ created_at > this_time }
    end
    
    def desc
      order("messages.created_at DESC")
    end
  end
  
  def list_of_recipients
    recipients.map(&:user).map(&:name).join ", "
  end

  def list_of_senders
    senders.map(&:user).map(&:name).join ", "
  end
end
