class Vendor < ApplicationRecord
	 has_and_belongs_to_many :parts

end
