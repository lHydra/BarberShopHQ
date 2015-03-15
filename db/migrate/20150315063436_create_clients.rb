class CreateClients < ActiveRecord::Migration
  def change
  	create_table :client do |t|
  		t.text :name #столбец name с типом text
  		t.text :phone
  		t.text :datestamp
  		t.text :barber
  		t.text :color

  		t.timestamps
  	end
  end
end
