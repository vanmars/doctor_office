require ('spec_helper')

describe ('#Doctor') do

  before(:each) do
    @specialty = Specialty.new({name: 'family med', id: nil})
    @specialty.save
  end

  describe('.all') do
    it('returns empty array of doctors') do
      expect(Doctor.all).to(eq([]))
    end
  end

  describe('#save') do
    it('saves a doctor') do
      doctor = Doctor.new({name: 'Joe', id: nil, specialty_id: @specialty.id})
      doctor.save
      expect(Doctor.all).to(eq([doctor]))
    end
  end

  describe('.clear') do
    it('clears all doctors from database') do
      doctor = Doctor.new({name: 'Joe', id: nil, specialty_id: @specialty.id})
      doctor.save
      doctor2 = Doctor.new({name: 'Vanessa', id: nil, specialty_id: @specialty.id})
      doctor2.save
      Doctor.clear
      expect(Doctor.all).to(eq([]))
    end
  end

  describe('.find') do
    it('finds a specific doctor by id') do
      doctor = Doctor.new({name: 'Joe', id: nil, specialty_id: @specialty.id})
      doctor.save
      doctor2 = Doctor.new({name: 'Vanessa', id: nil, specialty_id: @specialty.id})
      doctor2.save
      expect(Doctor.find(doctor.id)).to(eq(doctor))
    end
  end

  describe('#update') do
    it('updates a doctors name and specialty by id') do
      doctor = Doctor.new({name: 'Joe', id: nil, specialty_id: @specialty.id})
      doctor.save
      specialty2 = Specialty.new({name: 'internal med', id: nil})
      specialty2.save
      doctor.update('Vanessa', specialty2.id)
      expect(doctor.name).to(eq('Vanessa'))
      expect(doctor.specialty_id).to(eq(specialty2.id))
    end
  end

  describe('#delete') do
    it('removes a doctor from the db') do
      doctor = Doctor.new({name: 'Joe', id: nil, specialty_id: @specialty.id})
      doctor.save
      doctor2 = Doctor.new({name: 'Vanessa', id: nil, specialty_id: @specialty.id})
      doctor2.save
      doctor.delete
      expect(Doctor.all).to(eq([doctor2]))
    end
  end

  describe('.find_by_specialty') do
  it('finds all the doctors for a given speicalty') do
    doctor = Doctor.new({name: 'Joe', id: nil, specialty_id: @specialty.id})
    doctor.save
    doctor2 = Doctor.new({name: 'Vanessa', id: nil, specialty_id: @specialty.id})
    doctor2.save
    expect(Doctor.find_by_specialty(@specialty.id)).to(eq([doctor, doctor2]))
  end
end

end