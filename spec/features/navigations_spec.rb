require 'spec_helper'

describe "Navigating: " do
  describe "When I click on link: " do
    it "Top left takes me to home page" do
      visit new_order_path

      find('#home_link').click

      page.should have_content('Simple to use')
    end

    it "Contact nav works" do
      visit new_order_path

      find('.navbar').click_link('Contact')

      page.should have_content('(206) 595-0755')
    end

    it "Video nav works" do
      visit new_order_path

      find('.navbar').click_link('Video')

      page.should have_content('Video Demonstration:')
    end

    it "About nav works" do
      visit new_order_path

      find('.navbar').click_link('About')

      page.should have_content('Merilee Brigham, RN, BSN, IBCLC, RLC')
    end

    it "Purchase nav works" do
      visit pages_path

      find('.navbar').click_link('Purchase')

      page.should have_content('Shipping:')
    end

    it "Jumbotron works" do
      visit pages_path

      click_link 'Buy now!'

      page.should have_content('Shipping:')
    end
  end
end
