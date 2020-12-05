class AddSlug < ActiveRecord::Migration[6.0]
  disable_ddl_transaction!

  def change
    add_column :posts, :slug, :string, null: true
    add_index :posts, :slug, unique: true, algorithm: :concurrently
  end
end
