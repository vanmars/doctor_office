class Specialty
  attr_accessor :name
  attr_reader :id

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
  end

  def self.all
    returned_specialties = DB.exec('SELECT * FROM specialties;')
    specialties = []
    returned_specialties.each do |specialty|
      name = specialty.fetch('name')
      id = specialty.fetch('id')
      specialties.push(Specialty.new({:name => name, :id => id}))
    end
    specialties
  end
end 