module FollowsHelper
  def follow_link(user)
    follow = Follow.where(:user => current_user, :following => user)
    if follow.exists?
      button_to("Unfollow", follow_path(follow.first), :method => :delete, :class => 'btn btn-danger mar-top-5', :form => { :class => 'form-inline pull-right' })
    else
      form_for(:follow, :url => follows_path, :method => 'POST', :html => { :class => 'pull-right' }) do |f|
        f.hidden_field(:following_id, :value => user.id.to_s) +
        f.submit('Follow', :class => "btn btn-primary mar-top-5")
      end
    end
  end

  def nav_item(name, path)
    content_tag(:li, link_to(name, path), :class => is_active?(name))
  end

  private

  def is_active?(name)
    case name
    when "Follow" then
      controller_name == 'follows' ? 'active' : ''
    end
  end
end
