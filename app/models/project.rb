class Project < ActiveRecord::Base
  belongs_to :user
  has_many :compartments
end

def get_children(json_data)
  return if json_data[0].nil?
  title = json_data[0]["title"]
  text = json_data[0]["text_field"]
  get_children(json_data[0]["children"])
end
