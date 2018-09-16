# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
if Vendor.all.empty?
  Vendor.create([
    {
      name: 'Union Square Green Market',
      description: 'Lively outdoor market, open Mon, Wed, Fri & Sat, offering produce, cheese, bread, flowers & more.',
      latitude: '40.737116',
      longitude: '-73.990363',
      image_src: 'https://www.grownyc.org/sites/all/themes/grownyc2015/images/GrowNYCbug100.png',
      email: 'union@test.com',
      password: 'password',
      status: 'active'
    },
    {
      name: 'Down to Earth Hudson Yards Farmers Market',
      description: 'Market selling local produce, plants & artisanal food every Saturday from April through December.',
      latitude: '40.755163',
      longitude: '-74.000506',
      image_src: 'https://scontent-iad3-1.xx.fbcdn.net/v/t1.0-9/15826888_1358556664166165_1083826243194307942_n.png?oh=63409cd1f3c09993d7ba91dcc913f627&oe=5AEF23DA',
      email: 'hudson@test.com',
      password: 'password',
      status: 'active'
    },
    {
      name: 'Stiles Farmers Market Inc',
      description: 'Neighborhood grocer offering a wide variety of fresh produce & baked goods at discount prices.',
      latitude: '40.764101',
      longitude: '-73.987126',
      image_src: 'https://www.grownyc.org/sites/all/themes/grownyc2015/images/GrowNYCbug100.png',
      email: 'stiles@test.com',
      password: 'password',
      status: 'active'
    },
    {
      name: 'Down to Earth Market Chelsea',
      description: 'Seasonal open-air market selling produce, pantry items, flowers, meat & baked goods.',
      latitude: '40.745783',
      longitude: '-73.999631',
      image_src: 'https://scontent-iad3-1.xx.fbcdn.net/v/t1.0-9/15826888_1358556664166165_1083826243194307942_n.png?oh=63409cd1f3c09993d7ba91dcc913f627&oe=5AEF23DA',
      email: 'chelsea@test.com',
      password: 'password',
      status: 'active'
    },
    {
      name: 'Greenpoint McCarren Park Greenmarket',
      description: "Year-round, Saturdays only farmer's market featuring various farm & small batch food producers.",
      latitude: '40.719653',
      longitude: '-73.952545',
      image_src: 'https://www.grownyc.org/sites/all/themes/grownyc2015/images/GrowNYCbug100.png',
      email: 'mccarren@test.com',
      password: 'password',
      status: 'active'
    },
    {
      name: 'Whole Foods',
      description: 'Eco-minded chain with natural & organic grocery items, housewares & other products',
      latitude: '40.754712',
      longitude: '-73.984890',
      image_src: 'https://pbs.twimg.com/profile_images/804367481041080320/ljq1T2Qx_400x400.jpg',
      email: 'wholefoods@test.com',
      password: 'password',
      status: 'active'
    },
    {
      name: 'Fairway Market Chelsea',
      description: 'Grab-and-go selection of upscale prepared foods attached to a sprawling gourmet grocery store.',
      latitude: '40.744480',
      longitude: '-73.991270',
      image_src: 'https://d2lnr5mha7bycj.cloudfront.net/warehouse/logo/53/a21060c5-571b-439f-b308-296c8f5a7e93.png',
      email: 'fairway@test.com',
      password: 'password',
      status: 'active'
    },
    {
      name: 'The Food Emporium',
      description: 'Supermarket chain combining groceries with gourmet gifts, imported foods & housewares.',
      latitude: '40.734866',
      longitude: '-73.989660',
      image_src: 'https://www.keyfood.com/wp-content/uploads/2016/06/The-Food-Emporium-logo_in-oval_V3.png',
      email: 'emporium@test.com',
      password: 'password',
      status: 'active'
    },
    {
      name: 'Gristedes',
      description: 'Supermarket chain stocking meats, seafood, produce, dairy & baked goods, deli items & more.',
      latitude: '40.744296',
      longitude: '-73.999450',
      image_src: 'https://1qs8dv1wrhwnyi81e46gliym-wpengine.netdna-ssl.com/wp-content/uploads/2016/09/gristeds-1.png',
      email: 'gristedes@test.com',
      password: 'password',
      status: 'active'
    },
    {
      name: 'H Mart',
      description: 'Asian grocery store chain supplying imported packaged foods & housewares plus ready-to-serve meals.',
      latitude: '40.747771',
      longitude: '-73.987415',
      image_src: 'https://d2lnr5mha7bycj.cloudfront.net/warehouse/logo/119/8516e075-bd96-44f9-b2f8-7e6d129848f5.png',
      email: 'hmart@test.com',
      password: 'password',
      status: 'active'
    },
    {
      name: 'Tan Tin Hung Supermarket',
      description: 'Compact supermarket in a no-frills space known for its selection of Southeast Asian provisions.',
      latitude: '40.718046',
      longitude: '-73.994680',
      image_src: 'https://s3.amazonaws.com/bst-fornyc/Simpson%20Wong%20Tan%20Ting%20Hung.jpg',
      email: 'tan@test.com',
      password: 'password',
      status: 'active'
    }
  ])
end
# AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
