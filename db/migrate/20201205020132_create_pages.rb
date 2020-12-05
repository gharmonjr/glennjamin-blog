class CreatePages < ActiveRecord::Migration[6.0]
  def change
    create_table :pages do |t|
      t.string :title
      t.boolean :published
      t.string :slug

      t.timestamps
    end
    add_index :pages, :slug, unique: true
  end
end
