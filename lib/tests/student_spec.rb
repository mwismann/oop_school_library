require 'student'
require 'classroom'

describe Student do
  student = Student.new(23, 'A', 'John')
  context '#initialize' do
    it 'Creates a new student with a name, age, classroom and parent permission' do
      expect(student.name).to eq('John')
      expect(student.age).to eq(23)
      expect(student.classroom).to eq('A')
      expect(student.parent_permission).to be(true)
    end
  end

  context '#add_classroom' do
    it 'Adds a classroom to the student' do
      classroom = Classroom.new('B')
      student.add_classroom(classroom)
      expect(classroom.students[0]).to eq(student)
    end
  end

  context '#play_hooky' do
    it 'Returns the correct message' do
      expect(student.play_hooky).to eq('¯(ツ)/¯')
    end
  end
end