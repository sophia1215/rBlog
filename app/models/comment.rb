# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  message    :text
#  status     :boolean
#  post_id    :integer
#  visitor_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :visitor
  has_many  :notifications, as: :notifiable, dependent: :destroy

  validates	:message, presence: true

  scope :approved, -> { where status: true }

  def self.matching_fullname_or_message params
    joins(:visitor).where("fullname LIKE ? OR message LIKE ?", "%#{params}%", "%#{params}%")
  end
end
