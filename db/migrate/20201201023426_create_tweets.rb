class CreateTweets < ActiveRecord::Migration[6.0]
  def change
    create_table :tweets do |t|
      t.datetime    :start_time,  null: false
      t.string      :title,       null: false
      t.references :user
      t.timestamps
    end
  end
end
