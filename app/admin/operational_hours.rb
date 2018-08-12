ActiveAdmin.register OperationalHours do
  belongs_to :vendor
  permit_params :day, :open, :open_time, :close_time
  menu false

  form do |f|
    f.inputs do
      f.input :day, as: :select, collection: ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday']
      f.input :open
      f.input :open_time, :as => :time_picker, :step => :minute
      f.input :close_time, :as => :time_picker, :step => :minute
    end
    f.actions
  end
end
