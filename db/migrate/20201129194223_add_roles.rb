class AddRoles < ActiveRecord::Migration[6.0]
  def change
    Role.where(name: 'Admin', level: 1).first_or_create!
    Role.where(name: 'Author', level: 2).first_or_create!
    Role.where(name: 'User', level: 3).first_or_create!
  end
end
