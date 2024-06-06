module ApplicationHelper

  def logodoggies_class(position)
    klass = "logodoggies"
    klass += "-final" if position == 4
    klass += " reached" if current_user.money >= 5*position
    klass += " middle" if position > 0 && current_user.money >= 5*position
    return klass
  end
end
