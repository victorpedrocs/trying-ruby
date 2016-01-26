class CreateUsers < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.string "email", :limit => 50, :null => false
      t.column "password", :string, :limit => 30, :null => false
      t.string "username", :limit => 50, :null => false
      t.timestamps null: false
    end
  end

  def down
    drop_table :users
  end
end
