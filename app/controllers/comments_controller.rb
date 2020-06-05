class CommentsController < ApplicationController
  before_action :set_event, only: [:edit, :destroy] # TODO :update
  before_action :set_comment, only: [:destroy] # TODO :update

  def create
    @new_comment = @event.comments.build(comment_params)
    @new_comment.user = current_user

    if @new_comment.save
      sweetalert_success t('comments.notice.created')
      redirect_to @event
    else
      render 'events/show'
    end
  end

  # TODO
  #
  #def update
  #  if @comment.update(comment_params)
  #    sweetalert_success t('comments.notice.updated')
  #    redirect_to @comment
  #  else
  #    render :edit
  #  end
  #end

  def destroy
    if user_can_edit_comment?(@comment)
      sweetalert_success t('comments.notice.deleted')
      @comment.destroy!
      redirect_to @event
    else
      redirect_to @event
    end
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def set_comment
    @comment = @event.comments.find(params[:id])
  end

  def comment_params
    params.require(comment).permit(:body, :user_name)
  end
end
