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

  validates	:fullname, presence: true
  validates	:email, format: { with: /@/, message: 'is not valid' }

  accepts_nested_attributes_for :comments
end
