class Order < ActiveRecord::Base

  def paypal_url
    values = {
      :business => ENV["PAYPAL_USR"],
      :amount => 8.95,
      :shipping => 2,
      :cmd => '_xclick',
      :invoice => id,
      :quantity => self.quantity,
      :item_name => 'Freexpressions cord',
      :return => 'http://www.yahoo.com',
      :cancel_return => 'http://espn.com'
    }
    "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
  end
end
