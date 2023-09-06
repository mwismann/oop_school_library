require_relative '../lib/models/rental'
require_relative '../lib/models/person'
require_relative '../lib/models/book'

describe Rental do
  before(:each) do
    @person = Person.new(17, 'Jason')
    @book = Book.new('title', 'author')
  end

  # Test the constructor
  describe '#new' do
    it 'takes three parameter and returns a rental object' do
      rental = Rental.new('24/05/2023', @person, @book)
      expect(rental).to be_an_instance_of(Rental)
    end
  end

  # If person has a rental to their name
  describe '#Person' do
    it 'Checks if the persons\' rental array is greater than 0' do
      Rental.new('24/05/2023', @person, @book)
      expect(@person.rentals.length).to be > 0
    end
  end

  # Test if the book has a rental on it's rental array
  describe '#Book' do
    it 'Checks if the books\' rental array is greater than 0' do
      Rental.new('24/05/2023', @person, @book)
      expect(@book.rentals.length).to be > 0
    end
  end
end
