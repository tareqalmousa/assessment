class CreateUrls < ActiveRecord::Migration[5.1]
  def change
    create_table :urls do |t|
      t.text :originalurl
      t.string :newurl

      t.timestamps
    end
  end
end
