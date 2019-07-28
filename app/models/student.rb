class Student < ApplicationRecord
	has_many :student_courses
	has_many :courses, through: :student_courses

	validates_presence_of :name

	def course_grades
		courses.select("courses.*, student_courses.grade")
	end
end
