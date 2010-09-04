class AddCorpToEntries < ActiveRecord::Migration
  def self.up
    add_column :entries, :corp, :string, :default => "c"
  end

  def self.down
    remove_column :entries, :corp
  end
end
