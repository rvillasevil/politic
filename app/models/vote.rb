class Vote < ApplicationRecord
# encoding: UTF-8
	belongs_to :user, required: false
	belongs_to :micropost, required: false
end
