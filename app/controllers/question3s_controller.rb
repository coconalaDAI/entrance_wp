class Question3sController < ApplicationController
  before_action :authenticate_user!
  def index
    q3 = Question3.find_by(user_id:current_user.id)
    if q3.nil?
      @question3 = Question3.new
    else
      @question3 = q3
    end
  end

  def create
    Question3.create(question3s_params)
    redirect_to mypages_path,notice: 'Lv3のアンケートの回答が完了しました。'
  end

  def update
    q3 = Question3.find_by(user_id:params[:question3][:user_id])
    q3.update_attributes(question3s_params)
    redirect_to mypages_path,notice: 'Lv3の回答内容の更新が完了しました。'
  end

  private
  def question3s_params
    params.require(:question3).permit(
      :length_of_service, :employee, :job, :skill,
      :is_consul, :is_wrapping, :user_id
    )
  end
end
