class CreateMonkeyParts < ActiveRecord::Migration[5.2]
  def change
    create_table :monkeyparts do |t|
      t.string :name
    end
  end
end
