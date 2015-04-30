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

  delete '/:id' do
    Party.delete(params[:id])
    redirect "/parties"
  end

  get '/:id/receipt' do
    @party = Party.find(params[:id])
    @orders = Order.where(party_id: params[:id])
    CSV.open("/receipt.csv", "w") do |csv|
      csv << ["Per See Receipt"]
      csv << ["Thank Your for Dining!"]
      csv << [nil,nil]
      csv << [nil,nil]
      csv << [nil,nil]
      csv << ["Menu Item", "Price"]
    end

    CSV.open("/receipt.csv", "a") do |csv|
      @orders.each  do |order|
        csv << [order.food.name, order.food.price]
      end
      end

      all_prices = @orders.map do |order|
        order.food.price
      end

      sum_prices = all_prices.inject{|sum, x| sum + x}

      CSV.open("/receipt.csv", "a") do |csv|
        csv << ["Subtotal", sum_prices]
        csv << ["Taxes", sum_prices * 0.0875]
        csv << ["Total", sum_prices * 1.0875]
        csv << [nil,nil]
        csv << [nil,nil]
        csv << [nil,nil]
        csv << ["Suggested Gratuity (15%)",sum_prices * 1.0875 * 0.15 ]
        csv << ["Suggested Gratuity (20%)",sum_prices * 1.0875 * 0.20 ]
        csv << ["Suggested Gratuity (25%)",sum_prices * 1.0875 * 0.25 ]
    end

    @receipt = CSV.read("/receipt.csv")

    prices = @receipt.map do |row|
      row[1].to_f
    end

    @total = prices.inject {|sum, x| sum + x}
    erb :"receipt/index"

  end

end