require './lib/book'
require './lib/list_manager'

class BookController < ListManager
  attr_accessor :books

  def initialize
    super
    @books = []
  end

  def list_all_books
    check_empty_list(@books, 'books')

    @books.each_with_index do |book, index|
      puts "#{index + 1}) Title: #{book.title}, Author: #{book.author}"
    end
  end

  def create_book
    title, author = book_data
    @books << Book.new(title, author)
    puts 'Book created successfully'
  end

  def book_data
    print 'Title: '
    title = gets.chomp

    print 'Author: '
    author = gets.chomp

    [title, author]
  end
end
