class Comment < ApplicationRecord
	# encoding: UTF-8
	belongs_to :user, required: false
	belongs_to :micropost, required: false

	validates :contenido, presence: true, length: { maximum: 1000 }

end
