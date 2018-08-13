ActiveAdmin.register Vendor do
  menu priority: 3
  config.batch_actions = true

  filter :name
  filter :email
  filter :uid
  filter :created_at
  filter :status

  permit_params :name, :email, :password, :password_confirmation, :description, :status, :logo

  index do
    selectable_column
    id_column
    column :name
    column :description
    column :uid
    column :email
    column :created_at
    column :place_id
    column :address
    column :latitude
    column :longitude
    column :sign_in_count
    column :last_sign_in_at
    column :status
    actions
  end

  show title: :name do
    panel "Logo" do
      image_tag(vendor.logo_url)
    end
    panel "Product Listings" do
      table_for(vendor.items) do
        column("Item", sortable: :id) do |item|
          link_to "##{item.id}", admin_vendor_item_path(vendor, item)
        end
        column :name
        column("image") do |item|
          image_tag(item.image_file_src, width: '300')
        end
        column :description
        column :unit
        column :price
        column :quantity
        column("created", sortable: :created_at) do |item|
          pretty_format(item.created_at)
        end
        column("actions") do |item|
          link_to "Edit", edit_admin_vendor_item_path(vendor, item)
        end
        tr class: "action_items" do
          td link_to("Add", new_admin_vendor_item_path(vendor),
                     class: :button)
        end
      end
    end

    panel "Operational Hours" do
      table_for(vendor.operational_hours) do
        column :day
        column :open
        column("open_time") do |hours|
          hours.open_time&.strftime('%H:%M')
        end
        column("close_time") do |hours|
          hours.close_time&.strftime('%H:%M')
        end
        column :special_date
        column("actions") do |hours|
          link_to "Edit", edit_admin_vendor_operational_hour_path(vendor, hours)
        end
      end
    end
    active_admin_comments
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :description
      if f.object.new_record?
        f.input :password, input_html: { autocomplete: "new-password" }
        f.input :password_confirmation
      end
      f.input :email
      unless f.object.new_record?
        f.input :status
      end
      f.input :logo, as: :file
    end
    f.actions
  end

  sidebar "Vendor Details", only: :show do
    attributes_table_for vendor, :name, :email, :created_at, :setup_complete
  end

  # sidebar "Vendor Summary", only: :show do
  #   attributes_table_for user do
  #     row("Total Orders") { user.orders.complete.count }
  #     row("Total Value") do
  #       number_to_currency user.orders.complete.sum(:total_price)
  #     end
  #   end
  # end

  # sidebar "Active Admin Demo" do
  #   render("/admin/sidebar_links", model: "users")
  # end
end
