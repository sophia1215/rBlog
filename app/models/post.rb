# == Schema Information
#
# Table name: posts
#
#  id           :integer          not null, primary key
#  title        :string
#  content      :text
#  publish      :boolean
#  moderator_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Post < ActiveRecord::Base
  has_many :comments
  has_many :tags, through: :post_tags

  belongs_to :moderator
end
