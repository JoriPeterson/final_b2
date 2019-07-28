require 'rails_helper'

RSpec.describe Student do
	describe 'Validations' do
		it { should validate_presence_of :name }
	end

	describe 'Relationships' do
		it { should have_many :student_courses }
		it { should have_many(:courses).through(:student_courses) }
	end

	describe 'Instance Methods' do
		it '#course_grades' do
			jori = Student.create!(name: "Jori")
			mod_1 = Course.create!(name: "Module 1")
			student_courses_1 = jori.student_courses.create!(grade: 2.5, course_id: mod_1.id)

			expect(jori.course_grades).to eq([mod_1])
		end
	end
end
