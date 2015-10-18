class FileInput < Formtastic::Inputs::FileInput
  def to_html
    input_wrapping do
      label_html <<
        builder.file_field(method, input_html_options) <<
        image_preview_content
    end
  end

  private

  def image_preview_content
    image_preview? ? image_preview_html : ''
  end

  def image_preview?
    options[:image_preview] && @object.send(method).present?
  end

  def image_preview_html
    image = @object.send(method)
    image = image.thumbnail if image.respond_to?(:thumbnail)
    template.image_tag(image.url, :class => 'image-preview')
  end
end
