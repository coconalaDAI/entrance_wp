module ApplicationHelper
  
  def is_mypages_controller?
    return controller.controller_name === 'mypages'
  end

  def convertBoolValueToStr(bool)
    if bool
      return 'はい'
    else
        return 'いいえ'
    end
  end

end
