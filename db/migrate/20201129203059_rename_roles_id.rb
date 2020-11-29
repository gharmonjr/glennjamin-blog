class RenameRolesId < ActiveRecord::Migration[6.0]
  def change
    safety_assured { rename_column :users, :roles_id, :role_id }
  end
end
