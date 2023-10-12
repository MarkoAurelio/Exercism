class BoutiqueInventory
  attr_reader :item_names, :cheap, :out_of_stock, :total_stock

  def initialize(items)
    @items = items
    
    @item_names = @items.map { |item| item[:name] }.sort
    @cheap = @items.select { |item| item[:price] < 30 }
    @out_of_stock = @items.select { |item| item[:quantity_by_size].empty? }
    @total_stock = @items.map { |item| item[:quantity_by_size].values.sum }.sum
  end

  def stock_for_item(name)
    @items.find { |item| item[:name] == name}[:quantity_by_size]
  end

  private
  attr_reader :items
end
