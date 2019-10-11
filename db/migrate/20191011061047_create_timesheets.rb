class CreateTimesheets < ActiveRecord::Migration[5.2]
  def change
    create_table :timesheets do |t|
      t.string :hours
      t.text :comments
      t.references :project, foreign_key: true
      t.references :employee
      t.timestamps
    end
  end
end
