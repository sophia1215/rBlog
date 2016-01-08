# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Tag < ActiveRecord::Base
  has_many :posts, through: :post_tags

  validates :name, presence: true

  def in_use?
    PostTag.exists?(tag_id: self.id)
  end

end
