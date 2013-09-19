class Sample < ActiveRecord::Base

  validates :name, uniqueness: true, presence: true
  validate :source_url_parses_if_present

  def source_url_parses_if_present
    if source_url
      valid_url = false
      begin
        uri = URI.parse(source_url)
        valid_url = true if uri.host 
      rescue URI::InvalidURIError => e
      end
      errors.add(:source_url, "Does not seem like a valid URL") unless valid_url
    end
  end



end
