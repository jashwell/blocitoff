class Item < ActiveRecord::Base
  belongs_to :list

  def days_left
    (DateTime.now.to_date - created_at.to_date).to_i + 7
  end

end
