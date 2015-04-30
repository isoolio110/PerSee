class PartiesController < ApplicationController

  get '/' do
    parties_unsorted = Party.all
    @parties = parties_unsorted.sort_by {|obj| obj.table_no}
    erb :'party/index'
  end

  get '/new' do
    erb :'party/new'
  end

  post '/' do
    Party.create(params[:party])
    redirect "/parties"
  end

  get '/:id' do
    @party = Party.find(params[:id])
    @foods = Food.all
    @orders = Order.where(party_id: params[:id])
    erb :'party/show'
  end

  get '/:id/edit' do
    @party = Party.find(params[:id])
    erb :'party/edit'
  end

  patch '/:id' do
    party = Party.find(params[:id])
    party.update(params[:party])
    redirect "/parties/#{party.id}"
  end

end