class CreateAlbums < ActiveRecord::Migration[6.0]
  disable_ddl_transaction!

  def change
    create_table :albums do |t|
      t.string :name
      t.string :slug

      t.timestamps
    end

    add_index :albums, :slug, unique: true, algorithm: :concurrently
  end
end
