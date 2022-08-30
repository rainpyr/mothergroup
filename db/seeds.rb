
# users table
print "Creating users..."

User.destroy_all

u1 = User.create! email: 'eva@ga.co', name: 'Eva', password: 'chicken'
u2 = User.create! email: 'harvey@ga.co', name: 'Harvey', password: 'chicken'
u3 = User.create! email: 'janet@ga.co', name: 'Janet', password: 'chicken'

puts "created #{User.count} users."

# activities table
print "Creating activities..."

Activity.destroy_all

a1 = Activity.create! title: 'Splash Splash!', in_location: 'Melbourne Museum Hall 1', takeplace_time: '14:00 23 August 2022', description: 'Let your kid enjoy a lot of indoor water fun'

a2 = Activity.create! title: 'Draw Your Rainbow', in_location: 'Melbourne Garden', takeplace_time: '15:00 27 August 2022', description: 'Ourdoor painting experience'

a3 = Activity.create! title: 'Footy Naughty', in_location: 'MCG', takeplace_time: '16:00 20 September 2022', description: 'Ourdoor footy experience'

a4 = Activity.create! title: 'Snowman Calls Me', in_location: 'Medibank Icehouse', takeplace_time: '18:00 30 August 2022', description: 'Enjoy your winter with a snowman'

a5 = Activity.create! title: 'Spring Is Here!', in_location: 'Mt Dandenong National Park', takeplace_time: '31 August 2022', description: 'To smeell the early Spring of 2022'

puts "Done! Created #{ Activity.count } activities: "
puts Activity.pluck(:title).join(', ')

u1.activities << a1

u2.activities << a3 << a4

u3.activities << a2 << a5
puts "User #{ u3.name } has activities: #{ u3.activities.pluck(:title).join(', ') }"
puts "Activity '#{ a1.title }' belongs to #{ a1.user.name }"

print "Creating activity categories..."

Category.destroy_all

c1 = Category.create! name: 'Indoor'
c2 = Category.create! name: 'Outdoor'
c3 = Category.create! name: 'Arts'
c4 = Category.create! name: 'Education'
c5 = Category.create! name: 'Sports'
c6 = Category.create! name: 'Festivals'
c7 = Category.create! name: 'Fairs'
c8 = Category.create! name: 'Nature'
c9 = Category.create! name: 'Virtual'

puts "created #{Category.count} categories."

a1.categories << c1 << c3
a2.categories << c3 << c2
a3.categories << c2 << c5 
a4.categories << c1 << c5 << c4
a5.categories << c2 << c8

puts "Activity #{ a3.title } has categories: #{ a3.categories.pluck(:name).join(', ') }"
puts "Category '#{ c1.name }' has #{ c1.activities.pluck(:title).join(', ') }"

print "Creating activity bookings..."

Booking.destroy_all

b1 = Booking.create!
b2 = Booking.create!
b3 = Booking.create!
b4 = Booking.create!
b5 = Booking.create!
b6 = Booking.create!
b7 = Booking.create!

a1.bookings << b1 << b3
a2.bookings << b4 << b2
a3.bookings << b5 << b6
a4.bookings << b7

u1.bookings << b1 << b7
u2.bookings << b4 << b3 << b6
u2.bookings << b2 << b5