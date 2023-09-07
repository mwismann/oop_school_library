require_relative '../lib/models/student'
require_relative '../lib/models/classroom'

describe Student do
  describe '#Inheritance' do
    it 'should inherit from Person' do
      expect(Student.superclass).to eql(Person)
    end
  end

  before(:each) do
    @student = Student.new(15, nil, 'name')
  end

  # Test the constructor
  describe '#new' do
    it 'takes three parameters and returns a Student object' do
      expect(@student).to be_an_instance_of(Student)
    end
  end

  # Test the getters
  describe '#age' do
    it 'returns the correct age' do
      expect(@student.age).to eql(15)
    end
  end

  describe '#name' do
    it 'returns the correct name' do
      expect(@student.name).to eql('name')
    end
  end

  describe '#id' do
    it 'returns the correct id' do
      expect(@student.id).to be_between(1, 10_000)
    end
  end

  describe '#classroom' do
    it 'returns the correct classroom' do
      expect(@student.classroom).to eql(nil)
    end
  end

  # Test play_hooky method
  describe '#play_hooky' do
    it 'returns the correct string' do
      expect(@student.play_hooky).to eql('¯(ツ)/¯')
    end
  end

  # Test add_classroom method
  describe '#add_classroom' do
    it 'adds a classroom to the classroom array' do
      classroom = Classroom.new('name')

      @student.add_classroom(classroom)
      expect(@student.classroom).to eql(classroom)
    end
  end
end
