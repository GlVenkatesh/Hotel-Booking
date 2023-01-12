class Fix < ApplicationRecord
  belongs_to :room
  belongs_to :user
  
  validates_uniqueness_of :room_id, :scope => [:check_in,:check_out],
  message: "Already this room is booked for this dates choose another dates"

  validate  :date1?,:date2?
  def date1?
    if check_in > check_out
      errors.add(:check_out,"check_out date should be after check_in date") 
    end
  end
  def date2?
    
    if check_in < Date.today
      errors.add(:check_in, "check_in can't be in the past")
    end
  end
end
