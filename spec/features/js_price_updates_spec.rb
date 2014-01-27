require 'spec_helper'

describe "Keep correct order pricing." do
  describe "Update price when quantity changes.", :js => true  do
    it "Correctly updates price" do
      visit pages_path

      find('#purchase_link').click_link('Purchase')

      fill_in('Quantity', :with => 4)

      find('#quantity_x_price').should have_content('$35.80')
      find('#total_price').should have_content('$37.80')
    end
  end
end
