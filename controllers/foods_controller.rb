class FoodsController < ApplicationController

  get '/' do
    foods = Food.all
    @appetizers = foods.where(course: "Appetizer")
    @entrees = foods.where(course: "Entree")
    @desserts = foods.where(course: "Dessert")
    erb :'food/index'
  end

  get '/new' do
    erb :'food/new'
  end

  post '/' do
    food = Food.create(params[:food])
    if food.valid?
      redirect "/foods"
    else
      @errors = food.errors.full_messages
      erb :'food/new'
    end
  end

  get '/:id' do
    @food = Food.find(params[:id])
    erb :'food/show'
  end

  get '/:id/edit' do
    @food = Food.find(params[:id])
    erb :'food/edit'
  end

  patch '/:id' do
    food = Food.find(params[:id])
    food.update(params[:food])
    redirect "/foods"
  end

  delete '/:id' do
    Food.delete(params[:id])
    redirect "/foods"
  end

end
