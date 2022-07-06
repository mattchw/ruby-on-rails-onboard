json.page @page
json.offset @offset
json.limit @limit
json.total @count
json.items @wish_list_items do |item|
  json.extract! item, :_id, :user_id
  json.product do
    item_product = item.product
    json.extract! item_product,
                  :_id,
                  :name,
                  :description,
                  :price
  end
end