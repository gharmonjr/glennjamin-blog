class AddUserToRoleReference < ActiveRecord::Migration[6.0]
  def change
    safety_assured { add_foreign_key :users, :roles }
  end
end
