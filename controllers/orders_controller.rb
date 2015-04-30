class OrdersController < ApplicationController

  post '/' do
    order = Order.create(params[:order])
    party = Party.find(order.party_id)
    redirect "/parties/#{party.id}"
  end

  patch '/:id' do
    order = Order.find(params[:id])
    order.update(params[:order])
    party = Party.find(order.party_id)
    redirect "/parties/#{party.id}"
  end

  delete '/' do
    order = Order.find(params[:order][:id])
    Order.delete(params[:order][:id])
    party = Party.find(order.party_id)
    redirect "/parties/#{party.id}"
  end

end
