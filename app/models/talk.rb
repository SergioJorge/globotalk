class Talk < ActiveRecord::Base
  validates :nome, :data, :responsavel, :mais_sobre, presence: true
  validates :mais_sobre, length: {maximum: 140}
  validates :nome, length: {maximum: 25}
  
  def self.order_by_date
    find(:all,
         :conditions => ['talks.data >= ? ', Time.now.to_s.split(" ")[0]],
         :order => 'talks.data ASC')
  end
end
