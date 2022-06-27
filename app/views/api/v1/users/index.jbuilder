# show count of users
json.count @res[:count]
json.rows do
    json.array! @res[:rows] do |user|
        json._id user._id
        json.first_name user.first_name
        json.last_name user.last_name
        json.fullname "#{user.first_name} #{user.last_name}"
        json.bio user.bio
        json.age user.age
        json.gender user.gender
        json.address user.address
    end
end