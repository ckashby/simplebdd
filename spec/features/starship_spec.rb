require 'rails_helper'

feature 'Starship with Crew Members' do 
	# communicate purpose upfront with SimpleBdd
	scenario "visitor can create starship with crew members" do 
	Given "visitor can view new starship form"
	When "visitor enters info for starship and crew members"
	Then "visitor can see starship listing"
	end

	# define methods for scenario
	def visitor_can_view_new_starship_form do
		visit new_starship_path
		expect(page).to have_content("New Starship")	
	end

	def visitor_enters_info_for_starship_and_crew_members do
		enter_starship_info
		enter_crew_members_info
		click_button "Create Starship"	
	end

	def visitor_can_see_starship_listing do
		expect(page).to have_content("USS Enterprise")
		expect(page).to have_content("James T. Kirk")
	end

	def enter_starship_info do
		fill_in("starship[name]", with: "USS Enterprise")
	end

	def enter_crew_members_info do
		fill_in("starship[crew_members_attributes[0]][name]", with: "James T. Kirk")
		select('Command', :from => "starship[crew_members_attributes[0]][division]")
		fill_in("starship[crew_members_attributes[1]][name]", with: "Spook")
		select('Science', :from => "starship[crew_members_attributes[1]][division]")
		fill_in("starship[crew_members_attributes[2]][name]", with: "Scotty")
		select('Engineering', :from => "starship[crew_members_attributes[2]][division]")		
	end
end