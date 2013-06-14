require 'spec_helper'

describe Message do
  pending "add some examples to (or delete) #{__FILE__}"
  
  it "should get messages since specified datetime" do
    first_message = Message.create!(text: 'my first message')
    second_message = Message.create!(text: 'my second message')
    since_messages = Message.since(first_message.created_at)
    since_messages.should eq([second_message])
  end
end
