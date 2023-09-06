require './lib/rental'

class RentalController
  attr_accessor :rentals

  def initialize
    @rentals = []
  end

  def create_rental(people, books)
    date, person_i, book_i = rental_data(people, books)
    @rentals << Rental.new(date, people.people[person_i], books.books[book_i])
    puts 'Rental created successfully'
  end

  def rental_data(people, books)
    puts 'Selec a book from the following list by number: '
    books.list_all_books
    book_i = gets.chomp.to_i - 1

    puts 'Select a person from the following list by number (Not ID): '
    people.list_all_people
    person_i = gets.chomp.to_i - 1

    print 'Date: '
    date = gets.chomp

    [date, person_i, book_i]
  end

  def list_rentals_by_person_id
    id, rentals = rentals_by_id

    if rentals.empty?
      puts 'The person has no rentals'
    else
      puts "Rentals for person with ID #{id}:"
      rentals.each_with_index do |rental, index|
        puts "#{index + 1}) Date: #{rental.date}, Book: \"#{rental.book.title}\" by #{rental.book.author}"
      end
    end
  end

  def rentals_by_id
    print 'ID of the person: '
    id = gets.chomp.to_i

    rentals = @rentals.select do |rental|
      rental.person.id.to_i == id
    end

    [id, rentals]
  end
end
