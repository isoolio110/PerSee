require 'bundler'
Bundler.require

require_relative 'connection.rb'
require 'sinatra/activerecord/rake'

namespace :db do

  desc "seed database with foods"
  task :load_food_data do
    require 'csv'
    conn = PG::Connection.open({dbname: 'per_see_db'})
    CSV.foreach('Per_See_Menu.csv', :headers => true) do |row|
    course = row["Course"]
    name = row["Name"]
    description = row["Description"]
    price = row["Price"]
    sql_statement = <<-eos
    INSERT INTO foods
    (course,name,description,price)
    VAlUES
    ($1, $2, $3, $4)
    eos
    conn.exec_params(sql_statement, [course, name, description, price])
    end
    conn.close
  end

  desc "seed database with parties"
    task :load_party_data do
      require_relative 'models/party'
      i = 1
      n = 24
      num_of_people = [2,3,4,5,6,7]
      while i <= n do
        Party.create({name: Faker::Name.last_name,
          size: num_of_people.sample,
          table_no: i, paid: "No"})
        i += 1
      end
  end

end