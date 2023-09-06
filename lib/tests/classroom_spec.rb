require 'classroom'

describe Classroom do
  classroom = Classroom.new('A')
  student = Student.new(23, 'A', 'John', parent_permission: true)
  context '#initialize' do
    it 'Creates a new classroom with a label' do
      expect(classroom.label).to eq('A')
    end
  end

  context 'add_student' do
    it 'Adds a student to the classroom' do
      classroom.add_student(student)
      expect(classroom.students[0]).to eq(student)
    end
  end
end