require './lib/menu_controller'
require './lib/people_controller'
require './lib/books_controller'
require './lib/rentals_controller'

class App
  def initialize
    @people = People.new
    @books = Books.new
    @rentals = Rentals.new
    @menu = Menu.new(self)
  end

  # Menu methods
  def run
    @menu.display_menu
  end

  # Person methods
  def list_all_people
    @people.list_all_people
    run
  end

  def create_student
    @people.create_student
    run
  end

  def create_teacher
    @people.create_teacher
    run
  end

  def create_person
    @people.create_person
  end

  # Book methods
  def list_all_books
    @books.list_all_books
    run
  end

  def create_book
    @books.create_book
    run
  end

  # Rental methods
  def create_rental
    @rentals.create_rental
    run
  end

  def list_rentals_by_person_id
    @rentals.list_rentals_by_person_id
    run
  end
end