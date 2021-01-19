# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

image_links = [
  'https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12231413/Labrador-Retriever-MP.jpg',
  'https://cf.ltkcdn.net/dogs/images/orig/235430-2000x1332-australian-shepherd-puppy.jpg',
  'https://www.nutravet.co.uk/sites/default/files/user/cutepuppy_0.jpg',
  'https://www.redmillspet.co.uk/wp-content/uploads/2020/01/pup-1.jpg',
  'https://images2.minutemediacdn.com/image/upload/c_fill,g_auto,h_1248,w_2220/v1584388937/shape/mentalfloss/536413-gettyimages-1077470274.jpg?itok=NoDcW5uz',

  'https://www.langan.com/wp-content/uploads/2019/02/Boston-996x554.jpg',
  'https://www.bu.edu/admissions/files/2018/07/17-2005-AERIALS-101-cropped-e1535295662889-1200x675.jpg',
  'https://cdn10.bostonmagazine.com/wp-content/uploads/sites/2/2020/10/boston-foliage-social.jpg',
  'https://www.amtrak.com/content/dam/projects/dotcom/english/public/images/TextwithImage-Banners/GettyImages-688776752.jpg/_jcr_content/renditions/cq5dam.web.900.550.jpeg',
  'https://assets.hyatt.com/content/dam/hyatt/hyattdam/images/2014/09/21/1447/BOSTO-P156-Foggy-Boston-City.jpg/BOSTO-P156-Foggy-Boston-City.16x9.jpg',

  'https://ca-times.brightspotcdn.com/dims4/default/c0807db/2147483647/strip/true/crop/3500x2327+0+0/resize/1486x988!/quality/90/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2Fa8%2F08%2F76b97c6744868066bd8f4a760dc7%2Fistock-1159091699.jpg',
  'https://www.cbre.us/-/media/cbre/countryunitedstates/corporate-offices/southern%20california/san%20diego/sandiego_module_768x582.png?mh=0&w=768&mw=0&h=582&la=en&hash=ECF208F3F4E098F187440F241E81F59A120F958C',
  'https://digital.ihg.com/is/image/ihg/holiday-inn-express-san-diego-6171688298-2x1?wid=940&hei=470&qlt=85,0&resMode=sharp2&op_usm=1.75,0.9,2,0',
  'https://www.airtransat.com/getmedia/a90f15c4-6ed2-4e22-a8f7-1fcb84d2948f/california-californie-san-diego-aerial-view-vue-aerienne-560x300.aspx?width=560&height=300&ext=.jpg',
  'https://turkishairlines.ssl.cdn.sdlmedia.com/637099212429999981QN.jpg',

  'https://static.amazon.jobs/locations/217/thumbnails/SB_2.jpg?1563572230',
  'https://robbreport.com/wp-content/uploads/2019/05/sbsailingcenter_sbinnview_photobyblakebronstad.jpg.jpg?w=1000',
  'https://santabarbaraca.com/wp-content/uploads/2015/12/santa-barbara-courhouse-update.jpg',
  'https://mspmag.com/downloads/40979/download/SB-SunCountry-SponsoredContent.jpg?cb=769456eafb19c8d0a63f4bfc556fb379&w=1920',
  'https://www.edhat.com/sites/default/files/news_image/yifan-ma-lvbc4xcaxnk-unsplash_0.jpg'
]

image_links.each do |link|
  Image.create!(link: link)
end
