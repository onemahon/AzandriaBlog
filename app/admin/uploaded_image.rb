ActiveAdmin.register UploadedImage do
  permit_params UploadedImage.params

  form html: { multipart: true} do |f|
    f.inputs do
      f.input :alt_text
      f.input :tags
      f.input :image, image_preview: true, label: 'New Image'
    end

    f.actions
  end

  index as: :grid, columns: 4 do |uploaded_image|
    full_url = uploaded_image.image_url
    link_to image_tag(uploaded_image.image_url(:thumbnail)), full_url, target: '_blank'
  end
end
