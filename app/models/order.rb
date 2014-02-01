class Order < ActiveRecord::Base

  def paypal_url
    values = {
      :amount => 8.95,
      :cmd => '_xclick',
      :invoice => id,
      :quantity => self.quantity,
      :item_name => 'Freexpressions cord',
      :return => 'http://localhost:3000/success',
      :cancel_return => 'http://localhost:3000/cancel'
    }
    if self.quantity >= 25
      values[:discount_amount] = 2.95
      values[:discount_amount2] = 2.95
    end

    if Rails.env.production?
      values[:business] = ENV["PAYPAL_USR_PROD"]
      puts "Production"
      puts "https://www.paypal.com/cgi-bin/webscr?" + values.to_query
      return "https://www.paypal.com/cgi-bin/webscr?" + values.to_query
    else
      values[:business] = ENV["PAYPAL_USR"]
      return "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
    end
  end
end
