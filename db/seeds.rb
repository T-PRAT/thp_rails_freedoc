# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Doctor.destroy_all
Patient.destroy_all
Appointment.destroy_all
City.destroy_all
Speciality.destroy_all
JoinTableSpecialityDoctor.destroy_all

5.times { City.create(name: Faker::Address.city) }

Speciality.create(name: "Cardiologist")
Speciality.create(name: "Oncologist")
Speciality.create(name: "Gastroenterologist")
Speciality.create(name: "Pulmonologist")
Speciality.create(name: "Nephrologist")
Speciality.create(name: "Endocrinologist")
Speciality.create(name: "Ophthalmologist")

3.times { Doctor.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, zip_code: Faker::Address.zip, city_id: City.all.sample.id) }
#3.times { JoinTableSpecialityDoctor.create!(doctor: Doctor.all.sample, speciality: Speciality.all.sample) }
10.times do
	patient = Patient.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, city_id: City.all.sample.id)
	Appointment.create(date: Faker::Time.forward(days: 60), doctor: Doctor.all.sample, patient:patient, city_id: City.all.sample.id)
end

Doctor.all.each do |doctor|
	puts "Les patients de #{doctor.first_name} #{doctor.last_name} sont :"
	ps = doctor.patients
	ps.each do |p|
		a = p.appointments
		puts "    " + p.first_name + " " + p.last_name + " le " + a.first.date.to_s
	end
end
