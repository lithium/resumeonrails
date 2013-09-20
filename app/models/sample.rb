class Sample < ActiveRecord::Base
  has_attached_file :screenshot, :styles => { :small => "150x150>" }

  validates :name, uniqueness: true, presence: true
  validate :source_url_parses_if_present

  def source_url_parses_if_present
    if source_url.to_s != '' # not nil or empty
      valid_url = false
      begin
        uri = URI.parse(source_url)
        valid_url = true if uri.scheme && uri.path 
      rescue URI::InvalidURIError => e
      end
      errors.add(:source_url, "Does not seem like a valid URL") unless valid_url
    end
  end



  rails_admin do 
    edit do
      field :name
      field :platform
      field :source_url
      field :screenshot
      field :description, :ck_editor
    end
  end
end
