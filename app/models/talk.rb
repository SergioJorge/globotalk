class Talk < ActiveRecord::Base
  validates :nome, :data, :responsavel, :assunto, :mais_sobre, presence: true
  validates :mais_sobre, length: {maximum: 140}
  
  def self.order_by_date
    find(:all,
         :conditions => ['talks.data >= ? ', Time.now],
         :order => 'talks.data DESC')
  end
end
