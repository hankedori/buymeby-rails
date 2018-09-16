ActiveAdmin.register User do
  menu priority: 2
  config.batch_actions = true

  filter :name
  filter :email
  filter :uid
  filter :created_at
  filter :status

  permit_params :name, :email, :password, :password_confirmation, :device_token

  index do
    selectable_column
    id_column
    column :name
    column :description
    column :uid
    column :email
    column :created_at
    column :sign_in_count
    column :last_sign_in_at
    column :device_token
    actions
  end

  form do |f|
    f.inputs do
      if f.object.new_record?
        f.input :password, input_html: { autocomplete: "new-password" }
        f.input :password_confirmation
      end
      f.input :email
    end
    f.actions
  end

  sidebar "User Details", only: :show do
    attributes_table_for user, :email, :created_at
  end

  batch_action :push, form: {
    message: :text,
    data: :text
  } do |ids, input|
    User.find(ids).each do |user|
      user.send_push_notif! input[:message], eval(input[:data])
    end
    redirect_to admin_users_path, alert: "The push notification has been queued."
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
