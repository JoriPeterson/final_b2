require 'rails_helper'

RSpec.describe Course do
	describe 'Validations' do
		it { should validate_presence_of :name }
	end

	describe 'Relationships' do
		it { should have_many :student_courses }
		it { should have_many(:students).through(:student_courses) }
	end
end
