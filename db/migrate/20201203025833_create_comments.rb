class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string     :comment,    null: false
      t.string     :wanted_list,null: false
      t.references :tweet,      null: false,foreing_key: true
      t.references :user,       null: false,foreign_key: true
      t.timestamps
    end
  end
end
