class Menu
  def initialize(app)
    @app = app
  end

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
      @app.send(action)
    else
      puts 'Select a valid option'
      display_menu
    end
  end
end