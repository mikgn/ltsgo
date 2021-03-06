class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_event, only: :show
  before_action :set_current_user_event, only:  [:edit, :update, :destroy]

  def index
    @events = Event.order_by_closest
  end

  def show
    @new_comment = @event.comments.build(params[:comment])
    @new_subscription = @event.subscriptions.build(params[:subscription])
    @new_image = @event.images.build(params[:image])
  end

  def new
    @event = current_user.events.build
  end

  def edit
  end

  def create
    @event = current_user.events.build(event_params)

    if @event.save
      redirect_to @event
      sweetalert_success t('events.notice.created')
    else
      render :new
    end
  end

  def update
    if @event.update(event_params)
      redirect_to @event
      sweetalert_success t('events.notice.updated')
    else
      render :edit
    end
  end

  def destroy
    @event.destroy
    redirect_to events_url
    sweetalert_success t('events.notice.deleted')
  end

  private

  def set_current_user_event
    @event = current_user.events.find(params[:id])
  end

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :description, :address, :datetime)
  end
end
