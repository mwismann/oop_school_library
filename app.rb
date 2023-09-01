require './lib/person'
require './lib/decorators/capitalize_deco'
require './lib/decorators/trimmer_deco'
require './lib/classroom'
require './lib/student'
require './lib/book'
require './lib/rental'

person = Person.new(22, 'maximilianus')
person.correct_name
capitalized_person = CapitalizeDecorator.new(person)
p capitalized_person.correct_name
capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
p capitalized_trimmed_person.correct_name

classroom_a = Classroom.new('A')
classroom_b = Classroom.new('B')

student = Student.new(22, classroom_a, 'maximilianus')
p classroom_a.students
p student.classroom.label
p student.add_classroom(classroom_b)
p classroom_b.students.map(&:name)

book = Book.new('The Lord of the Rings', 'J. R. R. Tolkien')
rental = Rental.new(Time.now, book, person)
p rental.book.title
book.add_rental(rental)
p book.rentals.map(&:person).map(&:name)
