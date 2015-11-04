ActiveAdmin.register Tag do
  permit_params Tag.params

  form do |f|
    f.inputs do
      f.input :name
    end

    f.actions
  end
end
