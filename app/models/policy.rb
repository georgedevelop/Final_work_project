class Policy < ApplicationRecord
	has_many :policy_roles
	has_many :users, through: :policy_users
	has_many :roles, through: :policy_roles
end
