class Api::ListsController < ApiController
  before_action :authenticated?

  def index
    lists = List.all
    render json: lists, each_serializer: ListSerializer
  end

  def create
    user = User.find_by_id(params[:user_id])
    list = user.lists.new(list_params)
    if list.save
      render json: list
    else
      render json: { errors: list.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    begin
      user = User.find_by_id(params[:user_id])
      list = user.lists.find_by_id(params[:id])
      list.destroy
      render json: {}, status: :no_content
    rescue ActiveRecord::RecordNotFound
      render :json => {}, :status => :not_found
    end
  end

  def update
    user = User.find_by_id(params[:user_id])
    list = user.lists.find_by_id(params[:id])
    if list.update(list_params)
      render json: list
    else
      render json: { errors: list.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private
  def list_params
    params.require(:list).permit(:name, :permission)
  end

end
