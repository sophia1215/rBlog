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
  has_many :notifications, as: :notifiable, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :messages, dependent: :destroy
end
