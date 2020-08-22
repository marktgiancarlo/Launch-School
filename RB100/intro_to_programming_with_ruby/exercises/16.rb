contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"],
            ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]

contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}
names = contacts.keys
names.each_with_index {|name, idx1|
  [:email, :address, :phone].each_with_index {|val, idx2|
    contacts[name][val] = contact_data[idx1][idx2]
  }
}
p contacts

#fields = [:email, :address, :phone]
#contacts.each_with_index do |(name, hash), idx|
#  fields.each do |field|
#    hash[field] = contact_data[idx].shift
#  end
#end