require ('spec_helper')

describe('#Patient') do

  describe('.all') do
    it ('returns an empty array of patients') do
      expect(Patient.all).to(eq([]))
    end
  end

  describe('#save') do
    it ('saves a new patient to db') do
      patient = Patient.new({ name: 'Joe', birthdate: '2000-06-06', id: nil, doctor_id: 0 })
      patient.save
      expect(Patient.all).to(eq([patient]))
    end
  end

  describe('.clear') do
    it ('clears all patients from db') do
      patient1 = Patient.new({ name: 'Joe', birthdate: '2000-06-06', id: nil, doctor_id: 0 })
      patient1.save
      patient2 = Patient.new({ name: 'Billy', birthdate: '2000-02-09', id: nil, doctor_id: 0 })
      patient2.save
      Patient.clear
      expect(Patient.all).to(eq([]))
    end
  end

  describe('.find') do
    it ('finds a patient by id') do
      patient1 = Patient.new({ name: 'Joe', birthdate: '2000-06-06', id: nil, doctor_id: 0 })
      patient1.save
      patient2 = Patient.new({ name: 'Billy', birthdate: '2000-02-09', id: nil, doctor_id: 0 })
      patient2.save
      expect(Patient.find(patient1.id)).to(eq(patient1))
    end
  end

  describe('#update') do
    it ('updates a patient\'s name, doctor, or birthdate ') do
      patient1 = Patient.new({ name: 'Joe', birthdate: '2000-06-06', id: nil, doctor_id: 0 })
      patient1.save
      patient1.update({ name: 'Jimmy', doctor_id: 1})
      expect(patient1.doctor_id).to(eq(1))
    end
  end

  describe('#delete') do
    it ('deletes a patient') do
      patient1 = Patient.new({ name: 'Joe', birthdate: '2000-06-06', id: nil, doctor_id: 0 })
      patient1.save
      patient1.delete
      expect(Patient.all).to(eq([]))
    end
  end

  describe('.find_by_doctor') do
    it ('returns an array of patients that belong to a doctor id') do
      @specialty = Specialty.new({name: 'family med', id: nil})
      @specialty.save
      doctor = Doctor.new({name:'Smith', id:nil, specialty_id: @specialty.id})
      doctor.save
      patient1 = Patient.new({ name: 'Joe', birthdate: '2000-06-06', id: nil, doctor_id: 0 })
      patient1.save
      patient1.update({doctor_id: doctor.id})
      patient2 = Patient.new({ name: 'Billy', birthdate: '2000-02-09', id: nil, doctor_id: 0})
      patient2.save
      patient2.update({doctor_id: doctor.id})
      expect(Patient.find_by_doctor(doctor.id)).to(eq([patient1, patient2]))
    end
  end

end