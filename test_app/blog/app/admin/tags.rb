ActiveAdmin.register Tag do
  include ActiveAdmin::AjaxFilter

  permit_params :id, :name, :subcategory_id
  config.sort_order = 'id_asc'

  form do |f|
    f.semantic_errors(*f.object.errors.attribute_names)

    f.inputs do
      f.input :name
      f.input :subcategory, as: :ajax_select, data: {
        search_fields: ['category.name'],
        ordering: 'name ASC',
        url: '/admin/subcategories/filter',
        limit: Subcategory::AJAX_LIMIT
      }
    end

    f.actions
  end
end
