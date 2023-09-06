require_relative '../lib/models/classroom'
require_relative '../lib/models/student'

describe Classroom do
  before(:each) do
    @classroom = Classroom.new('label')
  end

  # Test the constructor
  describe '#new' do
    it 'takes one parameter and returns a classroom object' do
      expect(@classroom).to be_an_instance_of(Classroom)
    end
  end

  # Test the getters of the label
  describe '#label' do
    it 'returns the correct title of the clasroom' do
      expect(@classroom.label).to eql('label')
    end
  end

  # Test the add_student method
  describe '#add_student' do
    it 'adds a student to the students array' do
      student = Student.new(15, nil, 'Jason')

      @classroom.add_student(student)

      expect(@classroom.students.length).to be > 0
    end
  end
end
