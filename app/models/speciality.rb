class Speciality < ApplicationRecord
	has_many :doctors, through: :join_table_speciality_doctors
end
