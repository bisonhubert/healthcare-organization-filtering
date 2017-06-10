class Organization < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :eligibilities, presence: true
  serialize :eligibilities, Array

  has_many :locations
end
