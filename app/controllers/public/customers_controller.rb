class Public::CustomersController < ApplicationController
  def show
    @customer = Customer.find(current_customer)
  end
end
