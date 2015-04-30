class ApplicationController < Sinatra::Base

  enable :method_override

  register Sinatra::ActiveRecordExtension

  set :database, {adapter: "postgresql", database: "per_see_db"}
  set :views, File.expand_path("../../views", __FILE__)
  set :public_folder, File.expand_path("../../public", __FILE__)

  get '/' do
    erb :index
  end

  get '/csv' do
    content_type 'application/csv'
    attachment "receipt.csv"
    csv_string = CSV.generate do |csv|
      CSV.foreach("/receipt.csv") do |row|
      csv << row
      end
    end
  end

end