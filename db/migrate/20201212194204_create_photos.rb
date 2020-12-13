class CreatePhotos < ActiveRecord::Migration[6.0]
  disable_ddl_transaction!

  def change
    create_table :photos do |t|
      t.string :name
      t.string :desc
      t.string :settings
      t.string :slug
      t.references :album, null: false, foreign_key: true

      t.timestamps
    end

    add_index :photos, :slug, unique: true, algorithm: :concurrently
  end
end
