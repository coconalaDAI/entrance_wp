class MypagesController < ApplicationController
  before_action  :authenticate_user!
  def index
    initQ2
    initQ3
  end

  def edit
    initQ2
    initQ3
  end

  private
  def initQ2
    q2 = Question2.find_by(user_id:current_user.id)
    if q2.nil?
          logger.debug 'こっちきてるお'
      @question2 = Question2.new
    else
      logger.debug 'いあ、こっちだお'
      logger.debug q2
      @question2 = q2
      render mypages_edit_path
    end
  end

  def initQ3
    q3 = Question3.find_by(user_id:current_user.id)
    if q3.nil?
      @question3 = Question3.new
    else
      @question3 = q3
    end
  end

end
