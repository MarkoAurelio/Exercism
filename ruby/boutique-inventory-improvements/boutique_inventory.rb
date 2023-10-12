class BoutiqueInventory
  require 'ostruct'
  attr_reader :items, :item_names, :total_stock

  def initialize(items)
    @items = items.map { |item| OpenStruct.new(item) } 
    @item_names = @items.map(&:name).sort
    @total_stock = @items.map(&:quantity_by_size).map(&:values).flatten.sum
  end
end
