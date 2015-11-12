ActiveAdmin.register Post do
  permit_params Post.params, post_tags_attributes: PostTag.params << :_destroy

  form do |f|
    f.semantic_errors *f.object.errors.keys

    f.inputs do
      f.input :title
      f.input :abstract
      f.input :content

      f.has_many :post_tags, allow_destroy: true do |post_tag|
        post_tag.input :tag
      end
    end

    f.panel 'Published' do
      f.para 'Check the box below to make the post visible to the public.'
      f.input :published
    end

    f.actions
  end
end
