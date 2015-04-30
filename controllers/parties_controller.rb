class PartiesController < ApplicationController

  get '/' do
    parties_unsorted = Party.all
    @parties = parties_unsorted.sort_by {|obj| obj.table_no}
    erb :'party/index'
  end

  get '/new' do
    erb :'party/new'
  end

end