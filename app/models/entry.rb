class Entry < ActiveRecord::Base
  has_many :transactions, :dependent => :destroy
  accepts_nested_attributes_for :transactions, :allow_destroy => true
  
  def render_text(max_length)
    text = "#{date} #{description}\n"
    text += transactions.map do |transaction|
      length = transaction.account.length
      transaction_text = "    #{transaction.account}"
      (max_length - length).times { transaction_text += " " }
      transaction_text += " #{transaction.amount}\n"
    end.reduce{ |x, y| x + y}
  end
  
  def deep_copy()
    copy = self.clone
    copy.transactions = transactions.map do |transaction|
      transaction.clone
    end
    logger.debug copy.transactions
    return copy
  end
end
