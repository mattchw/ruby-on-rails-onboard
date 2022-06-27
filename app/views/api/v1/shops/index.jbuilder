# show count of shops
json.count @count
json.rows do
    json.array! @shops do |shop|
        json._id shop._id
        json.name shop.name
        json.description shop.description
        json.user shop.user
    end
end