require 'book'
require 'rental'
require 'person'
require 'student'

describe Book do
  book = Book.new('The Lord of the Rings', 'J. R. R. Tolkien')
  student = Student.new(23, 'Slytherin', 'John', parent_permission: true)
  context '#initialize' do
    it 'Creates a new book with a title and author' do
      expect(book.title).to eq('The Lord of the Rings')
      expect(book.author).to eq('J. R. R. Tolkien')
    end
  end

  context 'add_rental' do
    it 'Adds a rental to the book' do
      rental = Rental.new('2015-09-01', student, book)
      book.add_rental(rental)
      expect(book.rentals[0]).to eq(rental)
    end
  end
end