class Pond < ActiveRecord::Base
  has_many :frogs 
  has_many :tadpoles, :trough :frogs
end
