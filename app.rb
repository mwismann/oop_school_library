require './lib/book'
require './lib/person'
require './lib/rental'
require './lib/student'
require './lib/teacher'

class App
  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  # General methods
  def check_empty_list(list, list_name)
    return unless list.empty?

    puts "There's no #{list_name} stored yet"
    display_menu
  end

  # Menu methods
  def display_menu
    menu = {
      1 => 'List all books',
      2 => 'List all people',
      3 => 'Create a person',
      4 => 'Create a book',
      5 => 'Create a rental',
      6 => 'List all rentals for a given person id',
      7 => 'Exit'
    }

    puts "\nSelect an option by entering a number:"

    menu.each do |key, value|
      puts "#{key} - #{value}"
    end

    validate_option
  end

  def validate_option
    option = gets.chomp.to_i

    menu_actions = {
      1 => :list_all_books,
      2 => :list_all_people,
      3 => :create_person,
      4 => :create_book,
      5 => :create_rental,
      6 => :list_rentals_by_person_id,
      7 => :exit
    }

    action = menu_actions[option]

    if action
      send(action)
    else
      puts 'Select a valid option'
      display_menu
    end
  end

  # Person methods
  def list_all_people
    check_empty_list(@people, 'people')

    @people.each do |person|
      puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end

    display_menu
  end

  def create_student
    print 'Age: '
    age = gets.chomp

    print 'Name: '
    name = gets.chomp

    @people << Student.new(age, nil, name)
    puts 'New person (Student) created successfully'

    display_menu
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp

    print 'Name: '
    name = gets.chomp

    print 'Specialization: '
    specialization = gets.chomp

    @people << Teacher.new(age, specialization, name)
    puts 'New person (Teacher) created successfully'

    display_menu
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    input = gets.chomp
    case input
    when '1'
      create_student
    when '2'
      create_teacher
    else
      puts 'Please enter a valid number (1 or 2)'

      create_person
    end
  end

  # Book methods
  def list_all_books
    check_empty_list(@books, 'books')

    @books.each do |book|
      puts "Title: #{book.title}, Author: #{book.author}"
    end

    display_menu
  end

  def create_book
    print 'Title: '
    title = gets.chomp

    print 'Author: '
    author = gets.chomp

    @books << Book.new(title, author)
    puts 'Book created successfully'

    display_menu
  end

  # Rental methods
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

    display_menu
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

    display_menu
  end
end
