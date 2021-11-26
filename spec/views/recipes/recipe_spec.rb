require 'rails_helper'

RSpec.describe 'Recipe page', type: :feature do
  describe 'root page test' do
    before(:all) do
      @user = create(:user)
      @recipe = create(:recipe, user_id: @user.id)
      @food = create(:food, user_id: @user.id)
    end

    before(:each) do
      visit new_user_session_path
      within('#new_user') do
        fill_in 'Email', with: @user.email
        fill_in 'Password', with: @user.password
      end
      click_button 'Log in'
      visit user_recipe_path(@user, @recipe)
    end

    it 'should visit add ingredient form' do
      click_button 'Add Ingredient'
      expect(page).to have_content('New Recipe Food')
    end

  end
end