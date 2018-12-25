class Projectuser < ActiveRecord::Migration[5.2]
  def change

	create_table :project_users do |t|
		t.belongs_to :user, index: true
		t.belongs_to :project, index: true
		end
	end
end