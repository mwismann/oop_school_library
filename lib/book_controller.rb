require_relative 'book'
require_relative 'list_manager'

class Books < ListManager
  attr_accessor :books

  def initialize
    super
    @books = []
  end

  def list_all_books
    check_empty_list(@books, 'books')

    @books.each do |book|
      puts "Title: #{book.title}, Author: #{book.author}"
    end
  end

  def create_book
    print 'Title: '
    title = gets.chomp

    print 'Author: '
    author = gets.chomp

    @books << Book.new(title, author)
    puts 'Book created successfully'
  end
end

