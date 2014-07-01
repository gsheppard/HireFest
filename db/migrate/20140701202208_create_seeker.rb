class CreateSeeker < ActiveRecord::Migration
  def change
    create_table :seekers do |t|
      t.string :author
      t.boolean :remote
      t.boolean :relocate
      t.string :resume
      t.string :email
    end
  end
end
