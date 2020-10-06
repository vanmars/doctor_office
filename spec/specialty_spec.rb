require('spec_helper')

describe('#Specialty') do
  describe('.all') do
    it('returns an empty array when there are no specialties') do
      expect(Specialty.all).to(eq([]))
    end
  end

  describe('#save') do
    it('adds a specialty to the specialties table') do
      spec_test = Specialty.new({:name => 'Joseph', :id => nil})
      spec_test.save()
      expect(Specialty.all).to(eq([spec_test]))
    end
  end

  describe('.clear') do
    it('deletes all specialties within the specialties table') do
      spec_test1 = Specialty.new({:name => 'Joseph', :id => nil})
      spec_test1.save()
      spec_test2 = Specialty.new({:name => 'Vanessa', :id => nil})
      spec_test2.save()
      Specialty.clear
      expect(Specialty.all).to(eq([]))
    end
  end

  describe('.find') do
    it('finds a specialty by id') do
      spec_test1 = Specialty.new({:name => 'Joseph', :id => nil})
      spec_test1.save()
      spec_test2 = Specialty.new({:name => 'Vanessa', :id => nil})
      spec_test2.save()
      expect(Specialty.find(spec_test1.id)).to(eq(spec_test1))
    end
  end

  describe('#update') do
    it('updates a specialty by id') do
      spec_test1 = Specialty.new({:name => 'Joseph', :id => nil})
      spec_test1.save()
      spec_test1.update('Billy')
      expect(spec_test1.name).to(eq('Billy'))
    end
  end

  describe('#delete') do
    it('deletes a specialty by id') do
      spec_test1 = Specialty.new({:name => 'Joseph', :id => nil})
      spec_test1.save()
      spec_test1.delete()
      expect(Specialty.all).to(eq([]))
    end
  end

end