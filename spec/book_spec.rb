require_relative '../lib/models/book'
require_relative '../lib/models/rental'
require_relative '../lib/models/person'

describe Book do
  before(:each) do
    @book = Book.new('title', 'author')
  end

  # Test the constructor
  describe '#new' do
    it 'takes two parameters and returns a Book object' do
      expect(@book).to be_an_instance_of(Book)
    end
  end

  # Test the getters
  describe '#title' do
    it 'returns the correct title' do
      expect(@book.title).to eql('title')
    end
  end

  describe '#author' do
    it 'returns the correct author' do
      expect(@book.author).to eql('author')
    end
  end

  # Test the add_rental method
  describe '#add_rental' do
    it 'adds a rental to the rentals array' do
      rental = Rental.new('2022/05/23', Person.new(15), @book)

      @book.add_rental(rental)
      expect(@book.rentals).to include(rental)
    end
  end
end
