class CreateEligibilities < ActiveRecord::Migration
  def change
    create_table :eligibilities do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
