class CreateTransactions < ActiveRecord::Migration
  def self.up
    create_table :transactions do |t|
      t.string :account
      t.string :amount
      t.references :entry

      t.timestamps
    end
  end

  def self.down
    drop_table :transactions
  end
end
