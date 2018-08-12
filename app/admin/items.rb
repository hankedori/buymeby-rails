ActiveAdmin.register Item do
  belongs_to :vendor
  permit_params :name, :description, :unit, :price, :quantity, :image
  menu false

  form do |f|
    f.inputs do
      f.input :name
      f.input :description
      f.input :price
      f.input :unit
      f.input :quantity
      f.input :image, required: true, as: :file
    end
    f.actions
  end
end
