class TestSomething < ActiveRecord::Migration[6.0]
  def change
    create_table :test
    drop_table :test
  end
end
