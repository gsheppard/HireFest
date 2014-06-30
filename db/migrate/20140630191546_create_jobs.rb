class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :author
      t.string :location
      t.text :text
      t.date :date_posted
    end
  end
end
