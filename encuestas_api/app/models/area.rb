class Area < ApplicationRecord
  has_many :dependencys, :class_name => "Area", :foreign_key => "parent_id"
  belongs_to :parent, :class_name => "Area"

  validates_presence_of :name, :result

end
