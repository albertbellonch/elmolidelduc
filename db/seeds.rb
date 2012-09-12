I18n.locale = :en

User.delete_all
puts "Creating users..."
User.create! :login => "admin", :password => "password", :password_confirmation => "password", :email => "admin@admin.net"

puts "Resetting posts and comments..."
Post.delete_all
Comment.delete_all

Page.delete_all
PageContent.delete_all

puts "Creating /cucota dynamic page"
page = Page.create! :key => :cucota
PageContent.create! :page => page, :locale => "es", :url => "cucota"


puts "Creating subscriptors..."
Subscriptor.delete_all
Subscriptor.create! :email => "prueba1@gmail.com"
Subscriptor.create! :email => "prueba2@gmail.com"
Subscriptor.create! :email => "prueba3@gmail.com"


puts "Done!"
