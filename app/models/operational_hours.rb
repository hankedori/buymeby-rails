class OperationalHours < ApplicationRecord
  belongs_to :vendor

  def self.collection_from_day_array(array)
    array.map do |day|
      new(
        day: day[:day],
        open: day[:open],
        open_time: day[:open_time],
        close_time: day[:close_time]
      )
    end
  end
end
