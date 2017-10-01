class Reservation < ApplicationRecord
  belongs_to :res_user , class_name: 'User'
  belongs_to :toy_user , class_name: 'User'
  belongs_to :toy , class_name: 'Toy'
end
