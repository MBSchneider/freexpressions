class Order < ActiveRecord::Base

  def paypal_url
    values = {
      :amount => 8.95,
      :cmd => '_xclick',
      :invoice => id,
      :quantity => self.quantity,
      :item_name => 'Freexpressions cord'
    }
    if self.quantity >= 25
      values[:discount_amount] = 2.95
      values[:discount_amount2] = 2.95
    end

    if Rails.env.production?
      values[:business] = ENV["PAYPAL_USR_PROD"]
      values[:hosted_button_id] = ENV["PAYPAL_BTNID_PROD"]
      values[:return] = 'http://freexpressions.herokuapp.com/success'
      values[:cancel_return] = 'http://freexpressions.herokuapp.com/cancel'
      puts "Production"
      puts "https://www.paypal.com/cgi-bin/webscr?" + values.to_query
      return "https://www.paypal.com/cgi-bin/webscr?" + values.to_query
    else
      values[:business] = ENV["PAYPAL_USR"]
      values[:return] = 'http://localhost:3000/success'
      values[:cancel_return] = 'http://localhost:3000/cancel'
      return "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
    end
  end
end
