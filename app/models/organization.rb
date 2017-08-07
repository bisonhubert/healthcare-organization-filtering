class Organization < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true

  has_many :locations
  has_and_belongs_to_many :eligibilities

  def self.filter_organizations(params = {})
    @organizations = Organization.all
    FilterOrganizations.new({organizations: @organizations, eligibilities: params[:eligibilities], query_type: params[:query_type]}).call
  end
end
