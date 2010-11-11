class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :username
      t.string :password
      t.integer :testerscore
      t.integer :evaluatorscore
      t.integer :requestorscore

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
