module ApplicationHelper
  def notices
    content_tag :div, :class => 'alert-float' do
      html = ''
      [:alert, :error, :notice, :success].each do |type|
        html += content_tag(:div, notice_text(type), :class => notice_class(type)) if notice?(type)
      end
      html.html_safe
    end
  end

  private

  def notice?(type)
    flash[type].present?
  end

  def notice_class(type)
    case type
    when :error then 'alert text-danger'
    when :success then 'alert text-success'
    else
      'alert text-warning'
    end
  end

  def notice_text(type)
    html = content_tag :button, "Dismiss Alert", :class => 'close', 'data-dismiss' => 'alert', 'aria-hidden' => true
    html += content_tag :strong, flash[type]
    html.html_safe
  end
end
