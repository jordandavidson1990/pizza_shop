require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('./models/pizza_order') #if needed whole folder modles/*
also_reload('./models/*') # reloads whole folder again

# index - all the pizzas
get '/pizza-orders' do
  @orders = PizzaOrder.all() # creating all the orders here and accessing it in our view
  erb(:index)
end

post '/pizza-orders/:id/delete' do
  @order = PizzaOrder.find(params[:id])
  @order.delete()
  erb(:destroy)
end

# create a pizza
get '/pizza-orders/new' do  # needs to be above the placeholder
  erb(:new)
end

# show - show one pizza
get '/pizza-orders/:id' do  # id is a placeholder
  @order = PizzaOrder.find(params[:id]) #
  erb(:show)
end

# create - make a pizza order
post '/pizza-orders' do
  @order = PizzaOrder.new(params)
  @order.save()
  erb(:create)
end

get '/pizza-orders/:id/edit' do
  @order = PizzaOrder.find(params[:id])
  erb(:edit)
end

post '/pizza-orders/:id/edit' do
  @order = PizzaOrder.new(params)
  @order.update
  erb(:update)
end
