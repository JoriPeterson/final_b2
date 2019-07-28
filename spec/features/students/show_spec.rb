require 'rails_helper'

RSpec.describe "Student Show Page" do
	describe "As a user" do
		before :each do
			@jori = Student.create!(name: "Jori")
			@mod_1 = Course.create!(name: "Module 1")
			@mod_2 = Course.create!(name: "Module 2")
			@student_courses_1 = @jori.student_courses.create!(grade: 2.5, course_id: @mod_1.id)
			@student_courses_2 = @jori.student_courses.create!(grade: 3.0, course_id: @mod_2.id)
		end

		it "I see a students name, courses and grades" do

			visit student_path(@jori)

			expect(page).to have_content(@jori.name)
			expect(page).to have_content(@mod_1.name)
			expect(page).to have_content(@mod_2.name)
			expect(page).to have_content(@student_courses_1.grade)
			expect(page).to have_content(@student_courses_2.grade)
		end
	end
end
