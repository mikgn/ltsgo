class CommentsController < ApplicationController
  before_action :set_event, only: [:edit, :destroy] # TODO :update
  before_action :set_comment, only: [:destroy] # TODO :update

  def create
    @new_comment = @event.comments.build(comment_params)
    @new_comment.user = current_user

    respond_to do |format|
      if @new_comment.save
        sweetalert_success t('comments.notice.created')
        redirect_to @event
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render 'events/show'}
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # TODO
  #
  #def update
  #  respond_to do |format|
  #    if @comment.update(comment_params)
  #      sweetalert_success t('comments.notice.updated')
  #      redirect_to @comment
  #      format.json { render :show, status: :ok, location: @comment }
  #    else
  #      format.html { render :edit }
  #      format.json { render json: @comment.errors, status: :unprocessable_entity }
  #    end
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
