class Photo < ApplicationRecord

  belongs_to :user
  has_many :likes

  validates :description, presence: true

  has_attached_file :image, styles: { medium: "239x239>" }, default_url: "/images/default.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  def count_likes
    Like.where("photo_id = #{self.id}").count

  #   Like.find(:photo_id: self.if)
  #   counter = 0
  #   for i in 0...Like.all.count do
  #     if Like.all[i].photo_id == self.id then
  #       counter += 1
  #     end
  #   end
  #   return counter
  # end
  end

end
