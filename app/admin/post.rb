ActiveAdmin.register Post do
  permit_params :title, :content

  form do |f|
    f.inputs do
      f.input :title
      # TODO: determine if html editor is necessary (as opposed to confusing)
      f.input :content, as: :html_editor
    end

    f.actions
  end
end
