require 'rspec'
require 'pg'
require 'patient'
require 'doctor'
require 'specialty'
require 'pry'

DB = PG.connect({:dbname => 'doctor_office_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM doctors *;")
    DB.exec("DELETE FROM specialties *;")
    DB.exec("DELETE FROM patients *;")
  end
end