class Ticket < ActiveRecord::Base
  belongs_to :user
  belongs_to :fixer, class_name: "User"

  validates :title, presence: true  #, uniqueness: true
  validates :description, presence: true
end
