require_relative '../lib/models/person'
require_relative '../lib/models/rental'
require_relative '../lib/models/book'

describe Person do
  before(:each) do
    @person = Person.new(15, 'name')
  end

  # Test the constructor
  describe '#new' do
    it 'takes two parameters and returns a Person object' do
      expect(@person).to be_an_instance_of(Person)
    end
  end

  # Test getters
  describe '#age' do
    it 'returns the correct age' do
      expect(@person.age).to eql(15)
    end
  end

  describe '#name' do
    it 'returns the correct name' do
      expect(@person.name).to eql('name')
    end
  end

  describe '#id' do
    it 'returns the correct id' do
      expect(@person.id).to be_between(1, 10_000)
    end
  end

  # Test can_use_services? method
  describe '#can_use_services?' do
    it 'returns true' do
      expect(@person.can_use_services?).to eql(true)
    end
  end

  # Test correct_name method
  describe '#correct_name' do
    it 'returns the correct name' do
      expect(@person.correct_name).to eql('name')
    end
  end

  # Test add_rental method
  describe '#add_rental' do
    it 'adds a rental to the rentals array' do
      rental = Rental.new('2022/05/23', @person, Book.new('title', 'author'))

      @person.add_rental(rental)
      expect(@person.rentals).to include(rental)
    end
  end

  # Test private of_age? method
  describe '#of_age?' do
    it 'returns false' do
      expect(@person.send(:of_age?)).to eql(false)
    end
  end
end
