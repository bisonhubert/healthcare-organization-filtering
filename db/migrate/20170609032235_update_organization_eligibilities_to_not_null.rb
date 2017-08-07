class UpdateOrganizationEligibilitiesToNotNull < ActiveRecord::Migration
  def change
    change_column_null :organizations, :eligibilities, false
  end
end
