class Organization < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :eligibilities, presence: true
  serialize :eligibilities, Array

  has_many :locations

  def self.filter_organizations(params = {})
    @organizations = Organization.all
    FilterOrganization.new({organizations: @organizations, eligibilities: params[:eligibilities], query_type: params[:query_type]}).call
  end
end
