module HomeHelper
  def resource
    current_user || User.new
  end
end
