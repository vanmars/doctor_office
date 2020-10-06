class Doctor
  attr_reader :id
  attr_accessor :name, :specialty_id

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
    @specialty_id = attributes.fetch(:specialty_id)
  end

  def ==(other_doctor)
    self.name == other_doctor.name && self.specialty_id == other_doctor.specialty_id
  end

  def self.all
    returned_doctors = DB.exec('SELECT * FROM doctors;')
    doctors = []
    returned_doctors.each do |doctor|
      name = doctor.fetch('name')
      id = doctor.fetch('id').to_i
      specialty_id = doctor.fetch('specialty_id').to_i
      doctors.push(Doctor.new({name: name, id: id, specialty_id: specialty_id}))
    end
    doctors
  end

  def save
    result = DB.exec("INSERT INTO doctors (name, specialty_id) VALUES ('#{@name}', #{@specialty_id}) RETURNING id;")
    @id = result.first.fetch('id').to_i
  end

  def self.clear
    DB.exec('DELETE FROM doctors *;')
  end

  def self.find(id)
    doctor = DB.exec("SELECT * FROM doctors WHERE id = #{id};").first
    if doctor
      name = doctor.fetch('name')
      id = doctor.fetch('id').to_i
      specialty_id = doctor.fetch('specialty_id').to_i
      Doctor.new({name: name, id: id, specialty_id: specialty_id}) 
    else
      nil  
    end
  end

  def update(name, specialty_id)
    @name = name
    @specialty_id = specialty_id
    DB.exec("UPDATE doctors SET name = '#{@name}', specialty_id = #{@specialty_id} WHERE id = #{@id};")
  end

  def delete
    DB.exec("DELETE FROM doctors WHERE id = #{@id};")
  end

  def self.find_by_specialty(specialty_id)
    doctors = []
    returned_doctors = DB.exec("SELECT * FROM doctors WHERE specialty_id = #{specialty_id};")
    returned_doctors.each do |doctor|
      name = doctor.fetch('name')
      id = doctor.fetch('id').to_i
      doctors.push(Doctor.new({name: name, id: id, specialty_id: specialty_id}))
    end
    doctors
  end

  def patients
    Patient.find_by_doctor(@id)
  end
end