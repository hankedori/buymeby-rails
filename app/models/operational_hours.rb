class OperationalHours < ApplicationRecord
  belongs_to :vendor

  def self.collection_from_day_array(array)
    array.map do |day|
      new(
        day: day[:name],
        open: day[:open_time],
        close: day[:close_time]
      )
    end
  end
end
