require './lib/menu_controller'
require './lib/people_controller'
require './lib/book_controller'
require './lib/rental_controller'
require './lib/preserve_data'
require 'json'

class App
  def initialize
    @people = PeopleController.new
    @books = BookController.new
    @rentals = RentalController.new
    @preserve = PreserveData.new
    @menu = Menu.new(self)
  end

  def run
    @menu.display_menu
  end

  # People management methods
  def list_all_people
    @people.list_all_people
    run
  end

  def create_person
    @people.create_person
    run
  end

  # Books management methods
  def list_all_books
    @books.list_all_books
    run
  end

  def create_book
    @books.create_book
    run
  end

  def preserve_people
    @preserve.preserve_people(@people.people)
  end

  def exit
    preserve_people
    puts 'Bye!'
  end

  # Rentals management methods
  def create_rental
    @rentals.create_rental(@people, @books)
    run
  end

  def list_rentals_by_person_id
    @rentals.list_rentals_by_person_id
    run
  end
end
