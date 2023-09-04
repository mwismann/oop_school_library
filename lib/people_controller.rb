require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'list_manager'

class People < ListManager
  attr_accessor :people

  def initialize
    super
    @people = []
  end

  def list_all_people
    check_empty_list(@people, 'people')
    
    @people.each do |person|
      puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
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

  def create_student
    print 'Age: '
    age = gets.chomp

    print 'Name: '
    name = gets.chomp

    @people << Student.new(age, nil, name)
    puts 'New person (Student) created successfully'
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
  end
end