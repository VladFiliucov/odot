require "spec_helper"

describe "Signing up"  do
	it "allows a user to sign up for the site and creates the object in the database" do
		expect(User.count).to eq(0)

		visit "/"
		expect(page).to have_content("Sign Up")
		within("header") { click_link "Sign Up" }

		fill_in "First Name", with: "Vlad"
		fill_in "Las Name", with: "Filiucov"
		fill_in "Email", with: "example@mail.ru"
		fill_in "Password", with: "password12"
		fill_in "Password (again)", with: "password12"
		click_button "Sign Up"

		expect(User.count).to eq(1)
	end
end