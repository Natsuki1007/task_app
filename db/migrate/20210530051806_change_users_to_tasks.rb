class ChangeUsersToTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :title
      t.date :start
      t.date :finish

      t.timestamps
    end
  end
end
