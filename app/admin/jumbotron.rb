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

  index do
    selectable_column
    column :id
    column :title
    column :subtitle
    column :quote
    column :time_period_type
    column :image do |jumbotron|
      link_to image_tag(jumbotron.image_url(:thumbnail)), jumbotron.image_url, target: '_blank'
    end
    actions
  end
end
