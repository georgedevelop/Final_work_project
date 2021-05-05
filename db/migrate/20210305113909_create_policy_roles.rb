class CreatePolicyRoles < ActiveRecord::Migration[6.1]
  def change
    create_table :policy_roles do |t|
      t.references :policy, null: false, foreign_key: true
      t.references :role, null: false, foreign_key: true

      t.timestamps
    end
  end
end
