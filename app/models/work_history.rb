class WorkHistory < ActiveRecord::Base

  validates_presence_of :company, :position, :start_date
  validate :start_date_cannot_overlap

  def start_date_cannot_overlap
    overlapping = WorkHistory.where("start_date <= ? AND end_date >= ?", start_date, start_date)
    errors.add(:start_date, "overlaps existing Work History") if overlapping.first
  end

  rails_admin do 
    edit do
      field :company
      field :position
      field :start_date
      field :end_date
      field :address
      field :contact_info
      field :description, :ck_editor
    end
  end

end
