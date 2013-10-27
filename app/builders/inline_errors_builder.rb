class InlineErrorsBuilder < ActionView::Helpers::FormBuilder
  def errors_for(meth, options = {})
    @template.content_tag :p, @object.errors[meth].join('<br>').html_safe, :class => 'help-block' if has_errors?(meth)
  end

  def validation_class(meth, *klasses)
    klasses << 'has-error' if has_errors?(meth)
    klasses.compact.join(' ').html_safe
  end

  private

  def has_errors?(meth)
    @object.present? ? @object.errors[meth].present? : false
  end
end
