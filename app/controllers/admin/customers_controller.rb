class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def show
  end
end
