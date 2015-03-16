class CreateContacts < ActiveRecord::Migration
  def change
  	  	create_table :contacts do |t| #создаем таблицу barber
  		t.text :email #создаем столбец name с типом text
  		t.text :text
  		t.timestamps
 	end
  end
end
