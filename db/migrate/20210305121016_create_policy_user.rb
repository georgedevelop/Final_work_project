class CreatePolicyUser < ActiveRecord::Migration[6.1]
  def change
    create_table :policy_users do |t|
      t.references :user, null: false, foreign_key: true
      t.references :policy, null: false, foreign_key: true

      t.timestamps
    end
  end
end
