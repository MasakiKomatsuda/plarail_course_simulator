10.times do
  User.create!(
      name: Faker::Name.unique.name,
      email: Faker::Internet.unique.email,
      password: '12345678',
      password_confirmation: '12345678',
      avatar: Faker::Avatar.unique.image
  )
end

20.times do |index|
  Course.create!(
      user: User.offset(rand(User.count)).first,
      title: "タイトル#{index}",
      description: "説明#{index}",
      image: Faker::LoremFlickr.image
  )
end
