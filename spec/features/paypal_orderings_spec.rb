require 'spec_helper'

describe "Paypal:" do
  describe "Submit order via Paypal:", :js => true do
    it "Order works!" do
      visit new_order_path

      fill_in('order[quantity]', :with => 4)

      click_button 'Place Order'

      save_and_open_page

      page.should have_content("Freexpressions cord")
      page.should have_content("$35.80")
      page.should have_content("Item price: $8.95")
      page.should have_content("Quantity: 4")
    end
  end
end
