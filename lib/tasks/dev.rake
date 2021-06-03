
task sample_data: :environment do
  p "creating sample data"
  starting = Time.now

  Member.delete_all
  Contact.delete_all
  Group.delete_all
  User.delete_all

  5.times do
    number = rand.to_s[2..11] 
    name = Faker::Name.first_name
    User.create(
      email: "#{name}@example.com",
      password: "password",
      username: name.downcase,
      phone_number: "1#{number}",
    )
  end

  
  User.create(
    email: "alice@example.com",
    password: "password",
    username: "alice",
    phone_number: "16128500000",
  )

  users = User.all

  users.each do |u|

    30.times do
      p_number = rand.to_s[2..11]
      w_number =  rand.to_s[2..11]
      o_number =  rand.to_s[2..11]
      c_name = Faker::Name.unique.name
      u.contacts.create(
        name: c_name,
        image: "https://robohash.org/#{rand(9999)}",
        email: "#{c_name}@example.com",
        personal_number: "1#{p_number}",
        work_number: "1#{w_number}",
        facebook_url: "facebook.com",
        instagram_url: "instagram.com",
        preferred_method: ["text", "text (work)", "phone call", "phone call (work)", "email", "facebook", "instagram"].sample,
      )
    end

    3.times do 
      description = Faker::TvShows::RickAndMorty.quote
      u.groups.create(
        name: ["ABC Corp", "Chicago-Booth", "Dougherty & Company", "Friends", "Family", "Relatives", "Work Friends", "Squad"].sample,
        description: description,
      )
    end


    groups = Group.all
    groups.each do |g|
      num_groups = [2,3,4].sample
      num_groups.times do
        g.members.create(
          contact: g.owner.contacts.sample,
        )
      end
    end
  end

  ending = Time.now
  p "It took #{(ending - starting).to_i} seconds to create sample data."
  p "There are now #{User.count} users."
  p "There are now #{Group.count} groups."
  p "There are now #{Contact.count} contacts."
  p "There are now #{Member.count} members."


end