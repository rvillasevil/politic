class Municipio < ApplicationRecord

	belongs_to :provincia, primary_key: 'id_provincia'

def self.search(search)
  if search
    where('nombre LIKE ?', "%#{search}%")
  else
    all
  end
end

end
