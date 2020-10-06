require('spec_helper')

describe('#Specialty') do
  describe('.all') do
    it('returns an empty array when there are no specialties') do
      expect(Specialty.all).to(eq([]))
    end
  end
end