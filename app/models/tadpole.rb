class Tadpole < ActiveRecord::Base
  belongs_to :frog
  delegate :pond, :to => :frig, :allow_nil => true
end
