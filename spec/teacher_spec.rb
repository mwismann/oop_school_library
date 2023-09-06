require_relative '../lib/models/teacher'

describe Teacher do
  describe '#Inheritance' do
    it 'should inherit from Person' do
      expect(Teacher.superclass).to eql(Person)
    end
  end

  before(:each) do
    @teacher = Teacher.new(35, 'N/A', 'name')
  end

  # Test the constructor
  describe '#new' do
    it 'takes three parameters and returns a Teacher object' do
      expect(@teacher).to be_an_instance_of(Teacher)
    end
  end

  # Test the getters
  describe '#age' do
    it 'returns the correct age' do
      expect(@teacher.age).to eql(35)
    end
  end

  describe '#name' do
    it 'returns the correct name' do
      expect(@teacher.name).to eql('name')
    end
  end

  describe '#id' do
    it 'returns the correct id' do
      expect(@teacher.id).to be_between(1, 10_000)
    end
  end

  # Test can_use_services? method
  describe '#can_use_services?' do
    it 'returns true' do
      expect(@teacher.can_use_services?).to eql(true)
    end
  end
end
