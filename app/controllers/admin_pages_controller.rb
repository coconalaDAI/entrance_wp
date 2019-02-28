class AdminPagesController < ApplicationController
   before_action  :authenticate_admin!
#  layout 'admin'

   protect_from_forgery except: :destroy # destroyアクションを除外

  def index
    @user_datas = Question2.all
  end

  def index2
      @user_datas = Question2.all
  end

  def edit
    @user_data = Question2.find(params[:id])
  end

  def update
    q2 = Question2.find_by(user_id:params[:question2][:user_id])
    q2.update_attributes(question2s_params)
    redirect_to admin_pages_path
  end

  def destroy
    Question2.delete(params[:id])
    redirect_to admin_pages_index_path
  end

  def search
    name = params[:serach_name]
    q = Question2.where(firstName: name).or(Question2.where(lastName: name))
    if name == ""
      @user_datas = Question2.all
    else
      @user_datas = q
    end
    render admin_pages_index_path
  end

  private
  def question2s_params
    params.require(:question2).permit(
      :phone_number, :postal_code, :address, :prefecture,
      :age, :gender, :car_type, :model_year, :color, :licence_type,
      :user_id, :length_of_service, :employee, :job, :skill,
      :is_consul, :is_wrapping, :lastName, :firstName, :mobileOS, :address2,
      :carAddress, :isDriveRecorder
    )
  end
end
