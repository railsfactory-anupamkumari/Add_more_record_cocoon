class CreateEmployeesProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :employees_projects do |t|
      t.references :employee, foreign_key: true
      t.references :project, foreign_key: true
    end
  end
end
