require 'json'
require_relative '../models/person'
require_relative '../models/student'
require_relative '../models/teacher'

class DataManager
  def initialize(people, books, rentals)
    @people = people
    @books = books
    @rentals = rentals
  end

  def save_data
    people_data, books_data, rentals_data = serialize_data

    File.write('./lib/data/people.json', JSON.generate(people_data))
    File.write('./lib/data/books.json', JSON.generate(books_data))
    File.write('./lib/data/rentals.json', JSON.generate(rentals_data))
  end

  def serialize_data
    people_data = @people.people.map do |person|
      if person.instance_of?(Student)
        { id: person.id, name: person.name, age: person.age, classroom: person.classroom, person_type: person.class }
      else
        { id: person.id, name: person.name, age: person.age, specialization: person.specialization,
          person_type: person.class }
      end
    end

    books_data = @books.books.map do |book|
      { title: book.title, author: book.author }
    end

    rentals_data = @rentals.rentals.map do |rental|
      { person_id: rental.person.id, book_title: rental.book.title, book_author: rental.book.author, date: rental.date }
    end

    [people_data, books_data, rentals_data]
  end

  def load_data
    people_data = File.exist?('./lib/data/people.json') ? JSON.parse(File.read('./lib/data/people.json')) : []
    books_data = File.exist?('./lib/data/books.json') ? JSON.parse(File.read('./lib/data/books.json')) : []
    rentals_data = File.exist?('./lib/data/rentals.json') ? JSON.parse(File.read('./lib/data/rentals.json')) : []

    deserialize_data(people_data, books_data, rentals_data)
  end

  def deserialize_data(people_data, books_data, rentals_data)
    people_data_des = people_data.map do |elem|
      if elem['person_type'] == 'Student'
        # Create student object
        student = Student.new(elem['age'], nil, elem['name'])
        student.preserve_id(elem['id'])

        student
      else
        # Create teacher object
        teacher = Teacher.new(elem['age'], elem['specialization'], elem['name'])
        teacher.preserve_id(elem['id'])

        teacher
      end
    end

    books_data_des = books_data.map do |elem|
      Book.new(elem['title'], elem['author'])
    end

    rentals_data_des = rentals_data.map do |rental|
      person = people_data_des.find { |elem| elem.id == rental['person_id'] }
      book = books_data_des.find { |elem| elem.title == rental['book_title'] }

      Rental.new(rental['date'], person, book)
    end

    [people_data_des, books_data_des, rentals_data_des]
  end
end
