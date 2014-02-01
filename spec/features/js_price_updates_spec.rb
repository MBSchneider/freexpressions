require 'spec_helper'

describe "Keep correct order pricing." do
  describe "Update price when quantity changes.", :js => true  do
    it "Correctly updates price" do
      visit pages_path

      find('#purchase_link').click_link('Purchase')

      fill_in('order[quantity]', :with => 4)

      find('#quantity_x_price').should have_content('$35.80')
    end
  end

  describe "Bulk order - update price when quantity changes.", :js => true  do
    it "Bulk order - correctly updates price" do
      visit pages_path

      find('#purchase_link').click_link('Purchase')

      fill_in('order[quantity]', :with => 30)

      find('#quantity_x_price').should have_content('$180.00')
    end
  end
end
