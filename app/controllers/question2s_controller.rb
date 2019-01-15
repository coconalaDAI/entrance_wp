class Question2sController < ApplicationController
  before_action :authenticate_user!
def index
  q2 = Question2.find_by(user_id:current_user.id)
  if q2.nil?
    @question2 = Question2.new
  else
    @question2 = q2
  end

end

  def create
    Question2.create(question2s_params)
    redirect_to mypages_path,notice: '情報の登録が完了しました。'
  end

  def update
    q2 = Question2.find_by(user_id:params[:question2][:user_id])
    q2.update_attributes(question2s_params)
    logger.debug q2.inspect
    redirect_to mypages_path,notice: '情報の更新が完了しました。'
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
