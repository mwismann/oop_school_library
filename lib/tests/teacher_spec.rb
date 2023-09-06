require 'teacher'

describe Teacher do
  teacher = Teacher.new(23, 'Math')
  context '#initialize' do
    it 'Creates a new teacher with a name, age and specialization' do
      expect(teacher.name).to eq('Unknown')
      expect(teacher.age).to eq(23)
      expect(teacher.specialization).to eq('Math')
    end
  end

  context '#can_use_services?' do
    it 'Returns true' do
      expect(teacher.can_use_services?).to be(true)
    end
  end
end