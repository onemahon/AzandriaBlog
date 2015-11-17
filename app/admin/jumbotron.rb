ActiveAdmin.register Jumbotron do
  permit_params Jumbotron.params

  form html: { multipart: true} do |f|
    f.inputs do
      f.input :title
      f.input :subtitle
      f.input :time_period_type, as: :select, collection: Jumbotron::TIME_PERIOD_TYPES::ALL, include_blank: false
      f.input :image_description
      f.input :image, image_preview: true, label: 'New Image'

      f.input :quote
      f.input :quote_text_title
      f.input :quote_text_author
      f.input :quote_text_full
    end

    f.actions
  end
end
