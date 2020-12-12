class CreateTweets < ActiveRecord::Migration[6.0]
  def change
    create_table :tweets do |t|
      t.datetime    :start_time,      null: false
      t.string      :title,           null: false
      t.string      :wanted_list
      t.integer     :prefecture_id,   null: false
      t.string      :place,           null: false
      t.references :user
      t.timestamps
    end
  end
end
