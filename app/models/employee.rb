class Employee < ApplicationRecord
	has_and_belongs_to_many :projects
	has_many :timesheets
	accepts_nested_attributes_for :timesheets
end
