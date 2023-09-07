require './lib/controllers/menu_controller'
require './lib/controllers/people_controller'
require './lib/controllers/book_controller'
require './lib/controllers/rental_controller'
require './lib/helpers/data_manager'

class App
  def initialize
    @people = PeopleController.new
    @books = BookController.new
    @rentals = RentalController.new
    @preserve = DataManager.new(@people, @books, @rentals)
    @menu = Menu.new(self)
    load_data
  end

  def start
    @menu.display_menu
  end

  def save_data
    @preserve.save_data
  end

  def load_data
    people_data, books_data, rentals_data = @preserve.load_data
    @people.people = people_data
    @books.books = books_data
    @rentals.rentals = rentals_data
  end

  def exit
    save_data
    puts 'Bye!'
  end

  # People management methods
  def list_all_people
    @people.list_all_people
    start
  end

  def create_person
    @people.create_person
    start
  end

  # Books management methods
  def list_all_books
    @books.list_all_books
    start
  end

  def create_book
    @books.create_book
    start
  end

  # Rentals management methods
  def create_rental
    @rentals.create_rental(@people, @books)
    start
  end

  def list_rentals_by_person_id
    @rentals.list_rentals_by_person_id
    start
  end
end
