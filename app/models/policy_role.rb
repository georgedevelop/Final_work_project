class PolicyRole < ApplicationRecord
  belongs_to :policy
  belongs_to :role
end
