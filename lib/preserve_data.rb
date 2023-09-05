require 'json'

class PreserveData

  # preserve data of the data array
  def preserve_people(data)
    arr = []
    obj = {}
    data.each do |person|
      obj = {
        'id'=> person.id,
        'name'=> person.name,
        'age'=> person.age,
      }

      if person.is_a?(Student)
        obj['classroom'] = person.classroom
      else
        obj['specialization'] = person.specialization
      end
      arr << obj
    end
    File.open('./lib/people.json', 'w') do |file|
      file.write(arr.to_json)
    end
  end

  def preserve_books(data)
    arr = []
    obj = {}
    data.each do |book|
      obj = {
        'title'=> book.title,
        'author'=> book.author,
      }
      arr << obj
    end
    File.open('./lib/books.json', 'w') do |file|
      file.write(arr.to_json)
    end
  end


end