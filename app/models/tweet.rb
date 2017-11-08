class Tweet < ApplicationRecord
  before_save {message.downcase!}
  validates_presence_of :message
end
