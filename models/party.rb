class Party < ActiveRecord::Base
  belongs_to(:server)
  has_many(:orders)
  has_many(:foods, :through => :orders)
  def to_s
    "This is a party of " + self.size
    + "at table " + self.table_no
  end
end


