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
  # validates :email, format: { with: /@/, message: 'is not valid' }

  VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX, message: "E-mail格式不正確!" },
                    uniqueness: { case_sensitive: false }

  accepts_nested_attributes_for :comments
  accepts_nested_attributes_for :messages

  include Notifiable
end
