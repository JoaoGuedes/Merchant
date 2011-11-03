# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

categories = Category.create([
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
