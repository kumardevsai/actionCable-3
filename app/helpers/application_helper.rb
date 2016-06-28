module ApplicationHelper
  def my_button_tag(content_or_options = nil, options = nil, &block)
    if content_or_options.is_a? Hash
      options = content_or_options
    else
      options ||= {}
    end

    options = { 'name' => 'button', 'type' => 'button' }.merge!(options.stringify_keys)

    if block_given?
      content_tag :button, options, &block
    else
      content_tag :button, content_or_options || 'Button', options
    end
  end
end
