class Food < ActiveRecord::Base
  validates :course, :name, :price,
  presence: true
  validates :name, uniqueness: true
  has_many(:orders)
  has_many(:parties, :through => :orders)
  def to_s
    self.name + " is a " + self.course
    + " and costs " +self.price
    + " dollars."
  end
end
