class Cart < ActiveRecord::Base
 belongs_to :user
 has_many :line_items
 has_many :items, through: :line_items
 belongs_to :order

 def total
   total = 0
   line_items.each {|li| total += (li.quantity * li.item.price)}
   return total
 end

 def add_item(item)
   a_item = Item.find(item)
   new_line = LineItem.find_or_initialize_by(item: a_item, cart_id: self.id)

 end

 def update_inventory
   line_items.each do |li|
     item = Item.find(li.item_id)
     item.inventory -= li.quantity
     item.save
   end
 end

end
