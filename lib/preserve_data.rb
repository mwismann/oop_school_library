require 'json'
require_relative 'person'
require_relative 'student'
require_relative 'teacher'

class PreserveData

  def initialize(people, books, rentals)
    @people = people
    @books = books
    @rentals = rentals
  end

  def save_data
    people_data, books_data = serialize_data

    File.write('./lib/data/people.json', JSON.generate(people_data))
    File.write('./lib/data/books.json', JSON.generate(books_data))
  end

  def serialize_data
    people_data = @people.people.map do |person|
      if person.instance_of?(Student)
        { id: person.id, name: person.name, age: person.age, classroom: person.classroom, person_type: person.class }
      else
        { id: person.id, name: person.name, age: person.age, specialization: person.specialization, person_type: person.class  }
      end
    end

    books_data = @books.books.map do |book|
      { title: book.title, author: book.author }
    end

    [people_data, books_data]
  end 
end
