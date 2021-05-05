class Role < ApplicationRecord
	has_many :policy_roles
	has_many :policies, through: :policy_roles
end
