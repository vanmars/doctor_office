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
      id = specialty.fetch('id').to_i
      specialties.push(Specialty.new({:name => name, :id => id}))
    end
    specialties
  end

  def save
    result = DB.exec("INSERT INTO specialties (name) VALUES ('#{@name}') RETURNING id")
    @id = result.first().fetch('id').to_i
  end

  def ==(specialty_to_compare)
    self.name() == specialty_to_compare.name()
  end

  def self.clear
    DB.exec('DELETE FROM specialties *;')
  end

  def self.find(id)
    specialty = DB.exec("SELECT * FROM specialties WHERE id = #{id};").first
    name = specialty.fetch('name')
    id = specialty.fetch('id').to_i
    Specialty.new({:name => name, :id => id})
  end

  def update(name)
    @name = name
    DB.exec("UPDATE specialties SET name = '#{name}' WHERE id = #{@id};")
  end

  def delete
    DB.exec("DELETE FROM specialties WHERE id = #{@id};")
  end
end