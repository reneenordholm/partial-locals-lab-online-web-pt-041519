# == Schema Information
#
# Table name: students
#
#  id         :integer          not null, primary key
#  name       :string
#  hometown   :string
#  birthday   :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Student < ActiveRecord::Base
  has_many :classroom_students
  has_many :classrooms, through: :classroom_students


  # Add in search functionality such that users can search 
  # for a student by name and see all matching results on the 
  # students index page. The results should be displayed by 
  # rendering a students/_student.html.erb partial.
  def self.search(name)
    Student.where("name LIKE ?", "%#{name}%")
  end
end
