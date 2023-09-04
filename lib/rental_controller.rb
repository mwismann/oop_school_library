require_relative 'rental'
require_relative 'list_manager'

class Rentals < ListManager
  attr_accessor :rentals
  
  def initialize
    super
    @rentals = []
  end

  def create_rental
    puts 'Select a book from the following list by number: '

    check_empty_list(@books, 'books')
    @books.each_with_index do |book, index|
      puts "#{index}) Title: #{book.title}, Author: #{book.author}"
    end
    book_index = gets.chomp.to_i

    puts 'Select a person from the following list by number (Not ID): '

    check_empty_list(@people, 'people')
    @people.each_with_index do |person, index|
      puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    person_index = gets.chomp.to_i

    print 'Date: '
    date = gets.chomp

    @rentals << Rental.new(date, @people[person_index], @books[book_index])
    puts 'Rental created successfully'

  end

  def list_rentals_by_person_id
    print 'ID of the person: '
    id = gets.chomp.to_i

    rentals = @rentals.select do |rental|
      rental.person.id.to_i == id
    end

    if rentals.empty?
      puts 'This person has no rentals'
    else
      puts "Rentals for person with ID #{id}:"
      rentals.each do |rental|
        puts "Date: #{rental.date}, Book: \"#{rental.book.title}\" by #{rental.book.author}"
      end
    end
  end
end