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

end