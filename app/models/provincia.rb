class Provincia < ApplicationRecord
	has_many :municipios, as: :id_provincia
end
