class JoinTableSpecialityDoctor < ApplicationRecord
	belongs_to :speciality
	belongs_to :doctor
end
