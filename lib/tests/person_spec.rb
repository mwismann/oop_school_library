require 'person'

describe Person do
  person = Person.new(23, 'Reza')
  book = Book.new('The Lord of the Rings', 'J. R. R. Tolkien')
  context '#initialize' do
    it 'should check if the person instance can be created' do
      expect(person.age).to eq(23)
      expect(person.name).to eq('Reza')
    end
  end

  context '#correct_name' do
    it 'Should return the name' do
      person.correct_name
      expect(person.name).to eq('Reza')
    end
  end

  context '#can_use_service' do
    it 'Should return wether the person is allowed to use service' do
      expect(person.can_use_services?).to be(true)
    end
  end

  context '#add_rental' do
    it 'Should add a rental' do
      rental = Rental.new('2023/02/02', person, book)
      person.add_rental(rental)
      expect(person.rentals[0]).to eq(rental)
    end
  end

  context '#preserve_id' do
    it 'Should preserve the id' do
      person.preserve_id(23)
      expect(person.id).to eq(23)
    end
  end

  context '#of_age?' do
    it 'Should check if the person is of age' do
      expect(person.send(:of_age?)).to be(true)
    end
  end
end