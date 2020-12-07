class CreateMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :members do |t|
      t.integer    :prefecture,  null: false
      t.string     :place,       null: false
      t.references :tweet,       null: false,foreign_key: true
      t.references :user,        null: false,foreign_key: true
      t.timestamps
    end
  end
end
