class Patient
  attr_reader :id
  attr_accessor :doctor_id, :name, :birthdate

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
    @doctor_id = attributes.fetch(:doctor_id)
    @birthdate = attributes.fetch(:birthdate)
  end

  def ==(patient_to_compare)
    (self.name == patient_to_compare.name) && (self.doctor_id == patient_to_compare.doctor_id) && (self.birthdate == patient_to_compare.birthdate)
  end

  def self.all
    returned_patients = DB.exec("SELECT * FROM patients;")
    patients = []
    returned_patients.each do |patient|
      name = patient.fetch('name')
      birthdate = patient.fetch('birthdate')
      id = patient.fetch('id').to_i
      doctor_id = patient.fetch('doctor_id').to_i
      patients.push(Patient.new({ name: name, birthdate: birthdate, id: id, doctor_id: doctor_id }))
    end
    patients
  end

  def save
    result = DB.exec("INSERT INTO patients (name, birthdate) VALUES ('#{@name}', '#{@birthdate}') RETURNING id;")
    @id = result.first.fetch('id').to_i
  end

  def self.find(id)
    patient = DB.exec("SELECT * FROM patients WHERE id = #{id};").first
    name = patient.fetch('name')
    doctor_id = patient.fetch('doctor_id').to_i
    birthdate = patient.fetch('birthdate')
    id = patient.fetch('id').to_i
    Patient.new({ name: name, doctor_id: doctor_id, birthdate: birthdate, id: id})
  end

  def update(attributes)
    if attributes.has_key?(:name) && (attributes.fetch(:name) != nil)
      @name = attributes.fetch(:name)
    end
    if attributes.has_key?(:doctor_id) && (attributes.fetch(:doctor_id) != nil)
      @doctor_id = attributes.fetch(:doctor_id)
    end
    if attributes.has_key?(:birthdate) && (attributes.fetch(:birthdate) != nil)
      @birthdate = attributes.fetch(:birthdate)
    end
    DB.exec("UPDATE patients SET name = '#{@name}', doctor_id = #{@doctor_id}, birthdate = '#{@birthdate}' WHERE id= #{@id};")
  end

  def delete
    DB.exec("DELETE FROM patients WHERE id = #{@id}")
  end

  def self.clear
    DB.exec('DELETE FROM patients *;')
  end

  def self.find_by_doctor(doctor_id)
    patients = []
    returned_patients = DB.exec("SELECT * FROM patients WHERE doctor_id = #{doctor_id};")
    returned_patients.each do |patient|
      name = patient.fetch('name')
      id = patient.fetch('id').to_i
      birthdate = patient.fetch('birthdate')
      patients.push(Patient.new({name: name, id: id, doctor_id: doctor_id, birthdate: birthdate}))
    end
    patients
  end

end