class Message < ActiveRecord::Base
  belongs_to :student
  has_many :attachments

  belongs_to :user

  validates_presence_of :title, :content

  accepts_nested_attributes_for :attachments, :reject_if => :all_blank, :allow_destroy => true
end
