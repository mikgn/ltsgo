class SubscriptionsController < ApplicationController
  before_action :set_event, only: [:create, :destroy]
  before_action :set_subscription, only: :destroy

  def create
    @new_subscription = @event.subscriptions.build(subscription_params)

    if @subscription.save
      sweetalert_success t('subscriptions.notice.subscribed')
      redirect_to @subscription
    else
      render :new
    end
  end

  def destroy
    @subscription.destroy
    sweetalert_success t('subscriptions.notice.unsubscribed')
    redirect_to subscriptions_url
  end

  private

  def set_subscription
    @subscription = @event.subscriptions.find(params[:id])
  end

  def set_event
    @event = Event.find(params[:id])
  end

  def subscription_params
    params.fetch(:subscription, {}).permit(:user_email, :user_name)
  end
end
