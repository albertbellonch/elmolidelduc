class Info < ActionMailer::Base
  default :from => "notifier@itnig.net"

  def new_info(name, email, phone, message)
    @name = name
    @email = email
    @phone = phone
    @message = message

    mail :to => "elmolidelduc@gmail.com", :subject => "Nou missatge de #{@email}"
  end
end
