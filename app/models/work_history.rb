class WorkHistory < ActiveRecord::Base

  default_scope { order("start_date") }

  def name
    "#{position} - #{company}"
  end

  validates_presence_of :company, :position, :start_date
  validate :start_date_cannot_overlap

  def start_date_cannot_overlap
    overlapping = WorkHistory.where("start_date <= ? AND end_date >= ?", start_date, start_date)
    errors.add(:start_date, "overlaps existing Work History") if overlapping.first
  end


  rails_admin do 
    list do
      fields :company,:position,:start_date,:end_date
    end
  end

end
