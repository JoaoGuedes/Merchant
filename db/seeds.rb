# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

Photo.create([
            { :url => 'http://files-cdn.formspring.me/profile/20110331/n4d94c1828d625_medium.jpg' },
            { :url => 'http://a1.twimg.com/profile_images/1146352354/FES_normal.jpg' },
            { :url => 'http://imgc.classistatic.com/cps/kjc/111010/741r1/7970h4_14.jpeg' },
            { :url => 'http://www.documof.com/wp-content/uploads/2011/01/bonehoard-64x64.jpg' },
            { :url => 'http://thumbs.marktplaats.com/kopen/thumbs/3/1d/1162289619.jpg' },
            { :url => 'http://images.deals.woot.com/78c537c9-2c52-4f61-8a98-56117844e6a9.jpg'} ,
             
            { :url => 'http://userserve-ak.last.fm/serve/64s/9834973.jpg' },
            { :url => 'http://rockbaby.ru/media/images/performers/metallica/metallica_(black_album)_64x64.jpg'} ,
            
            { :url => 'http://bestuff.com/images/images_of_stuff/64x64crop/the-beatles-the-white-album-26269.jpg' },
            { :url => 'http://userserve-ak.last.fm/serve/64s/54143641.jpg' },
            { :url => 'http://promo.cffcs.com/AffImages/1/KISS_KISS.jpg' },
            { :url => 'http://userserve-ak.last.fm/serve/64s/4044418.jpg' },
            { :url => 'http://userserve-ak.last.fm/serve/64s/38463061.jpg' }
            ])
            
User.create([
            { :name => 'Joao Pedro', :city => 'Porto', :email => 'joaopedro@gmail.com', :password => 'abcd', :photo_id => '1' },
            { :name => 'Fernando Santos', :city => 'Gondomar', :email => 'fsantos@gmail.com', :password => 'abcd', :photo_id => '2' }
            ])

Category.create([
                              { :name => 'Antiques'},
                              { :name => 'Artwork'},
                              { :name => 'Cards'},
                              { :name => 'Cameras'},
                              { :name => 'Coins'},
                              { :name => 'Comics'},
                              { :name => 'Electronics'},
                              { :name => 'Jewelry'},
                              { :name => 'Memorabilia'},
                              { :name => 'Military'},
                              { :name => 'Postcards'},
                              { :name => 'Posters'},
                              { :name => 'Records'},
                              { :name => 'Sports'},
                              { :name => 'Stamps'},
                              { :name => 'Toys & Games'},
                              { :name => 'Other'},  
                              ])

Collection.create([
          { :title => 'Rock', :description => 'My albums', :visibility => false, :user_id => '1', :category_id => '13' },
          { :title => 'Cartas Magic', :description => 'Colecao 2010', :visibility => false, :user_id => '2', :category_id => '3' }  
  ])
  
Item.create([
          { :title => 'Nirvana - Bleach', :description => '#50/540', :tradeable => false, :sellable => false, :collection_id => '1', :photo_id => '5' },
          { :title => 'Queen', :description => '#54/190', :tradeable => false, :sellable => false, :collection_id => '1', :photo_id => '6' },          
          { :title => 'Pearl Jam - Alive', :description => '#30/540', :tradeable => true, :sellable => false, :collection_id => '1', :photo_id => '7' },
          { :title => 'Metallica - Black album', :description => '#54/190', :tradeable => false, :sellable => false, :collection_id => '1', :photo_id => '8' },           
          { :title => 'Beatles - White Album', :description => '#300/1000', :tradeable => true, :sellable => false, :collection_id => '1', :photo_id => '9' },
          { :title => 'Led Zeppelin - IV', :description => '#54/190', :tradeable => false, :sellable => false, :collection_id => '1', :photo_id => '10' },          
          { :title => 'Kiss - S/T', :description => '#300/1000', :tradeable => true, :sellable => false, :collection_id => '1', :photo_id => '11' },
          { :title => 'QOTSA - Songs for the Deaf', :description => '#54/190', :tradeable => false, :sellable => false, :collection_id => '1', :photo_id => '12' },  
          { :title => 'NOFX - Punk in Drublic', :description => '#54/190', :tradeable => false, :sellable => false, :collection_id => '1', :photo_id => '13' },                
          
          { :title => 'Kijii', :description => '#01/540', :tradeable => false, :sellable => false, :collection_id => '2', :photo_id => '3' },
          { :title => 'White Weenie Quest', :description => '#54/190', :tradeable => false, :sellable => false, :collection_id => '2', :photo_id => '4' }
  ])