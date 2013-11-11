class CreateNodes < ActiveRecord::Migration
  def change
    create_table :nodes do |t|
      t.string :mac_address
      t.string :pub_key
      t.belongs_to :user, index: true

      t.timestamps
    end
    add_index :nodes, :mac_address
    add_index :nodes, :pub_key, unique: true
  end
end
