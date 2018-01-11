class Plaza < ApplicationRecord
	belongs_to :user
	default_scope -> { order(created_at: :desc) }
	validates :user_id, presence: true
  validates :name, presence: { message: "Please add a name" }, length: { maximum: 200 }, uniqueness: true
  mount_uploader :foto, PictureUploader
  validates :foto, presence: true
  validate  :picture_size

  has_many :microposts

  private

    # Validates the size of an uploaded picture.
    def picture_size
      if foto.size > 2.megabytes
        errors.add(:foto, "should be less than 2MB")
      end
    end
end
