class OrderMailer < ApplicationMailer
   def welcome_email(order)
    @order = order
    @url  = 'http://example.com/login'
    mail(to: @order.email, subject: 'Order from jungle')
  end
end
