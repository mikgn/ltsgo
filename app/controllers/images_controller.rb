class ImagesController < ApplicationController
  before_action :set_event, only: [:create, :destroy]
  before_action :set_image, only: [:destroy]

  def create
    @new_image = @event.images.build(image_params)
    @new_image.user = current_user

    if @new_image.save
      redirect_to @event
      sweetalert_success t('events.notice.image_added')
    else
      sweetalert_error t('events.notice.image_not_added')
      render 'events/show'
    end
  end

  def destroy
    if user_can_edit?(@image)
      @image.destroy
      sweetalert_success t('events.notice.image_deleted')
    end
    redirect_to @event
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def set_image
    @image = Image.find(params[:id])
  end

  def image_params
    params.fetch(:image, {}).permit(:image)
  end
end
