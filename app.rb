require('sinatra')
require('sinatra/reloader')
require('./lib/doctor')
require('./lib/patient')
require('./lib/specialty')
require('pry')
also_reload('lib/**/*.rb')
require("pg")

DB = PG.connect({:dbname => "doctor_office"})

get('/') do
  @specialties = Specialty.all
  erb(:specialties)
end

get('/specialties') do
  @specialties = Specialty.all
  erb(:specialties)
end

get('/specialties/new') do
  erb(:new_specialty)
end

post('/specialties') do
  name = params[:specialty_name]
  specialty = Specialty.new({name: name, id: nil})
  specialty.save
  @specialties = Specialty.all
  erb(:specialties)
end

get('/specialties/:id') do
  @specialty = Specialty.find(params[:id].to_i)
  erb(:specialty)
end