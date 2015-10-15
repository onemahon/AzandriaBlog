ActiveAdmin.register Post do
  permit_params Post.params

  form do |f|
    f.inputs do
      f.input :title
      f.input :abstract
      f.input :content
    end

    f.actions
  end
end
