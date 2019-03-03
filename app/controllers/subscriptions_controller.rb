class SubscriptionsController < ApplicationController
  def new
  end

  def create
    customer = Stripe::Customer.create(
      email: current_user.email,
      source: params[:stripeToken],
      description: '2 months sub'
    )

    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: 10000,
      currency: 'sek',
      description: '2 months sub'
    )
    
    if charge[:paid]
    current_user.subscriber! if current_user.visitor?
      redirect_to root_path, notice: "Almost unlimited laundry time!!!"
    else
      redirect_to root_path, notice: "Loser"
    end
  end
end
