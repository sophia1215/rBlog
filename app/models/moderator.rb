# == Schema Information
#
# Table name: moderators
#
#  id              :integer          not null, primary key
#  fullname        :string
#  username        :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Moderator < ActiveRecord::Base
  has_secure_password

  has_many :posts

  validates :fullname, presence: true
  validates :username, presence: true, format: {with: /@/, message: 'is not valid'}
  validates :password, presence: true
end
