require 'rails_helper'

RSpec.describe "Course Index Page" do
	describe "As a user" do
		before :each do
			@jori = Student.create!(name: "Jori")
			@charter = Student.create!(name: "Charter")
			@monique = Student.create!(name: "Monique")
			@mod_1 = Course.create!(name: "Module 1")
			@mod_2 = Course.create!(name: "Module 2")
			@jori_course_1 = @jori.student_courses.create!(grade: 2.5, course_id: @mod_1.id)
			@jori_course_2 = @jori.student_courses.create!(grade: 3.0, course_id: @mod_2.id)
			@charter_course_1 = @charter.student_courses.create!(grade: 3.5, course_id: @mod_1.id)
			@charter_course_2 = @charter.student_courses.create!(grade: 4.0, course_id: @mod_2.id)
			@monique_course_1 = @monique.student_courses.create!(grade: 3.0, course_id: @mod_1.id)
			@monique_course_2 = @monique.student_courses.create!(grade: 2.0, course_id: @mod_2.id)
		end

		it "I see each course name and its students listed from highest grade to lowest" do

			visit courses_path

			within "#course-#{@mod_1.id}" do
				expect(page).to have_content(@mod_1.name)
				expect(page).to have_content("Student: #{@charter.name}, Grade: #{@charter_course_1.grade}\nStudent: #{@monique.name}, Grade: #{@monique_course_1.grade}\nStudent: #{@jori.name}, Grade: #{@jori_course_1.grade}")
			end

			within "#course-#{@mod_2.id}" do
				expect(page).to have_content(@mod_2.name)
				expect(page).to have_content("Student: #{@charter.name}, Grade: #{@charter_course_2.grade}\nStudent: #{@jori.name}, Grade: #{@jori_course_2.grade}\nStudent: #{@monique.name}, Grade: #{@monique_course_2.grade}")
			end
		end
	end
end
