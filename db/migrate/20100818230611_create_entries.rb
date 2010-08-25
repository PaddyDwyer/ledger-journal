class CreateEntries < ActiveRecord::Migration
  def self.up
    create_table :entries do |t|
      t.string :date
      t.string :description

      t.timestamps
    end
  end

  def self.down
    drop_table :entries
  end
end
