class Project < ActiveRecord::Base
  belongs_to :user
  has_many :compartments
end
