# == Schema Information
#
# Table name: visitors
#
#  id         :integer          not null, primary key
#  fullname   :string
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Visitor < ActiveRecord::Base
  has_many :notifications, as: :notifiable
  has_many :comments
  has_many :messages
end
