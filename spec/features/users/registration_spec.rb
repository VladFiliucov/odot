require "spec_helper"

describe "Signing up"  do
	it "allows a user to sign up for the site and creates the object in the database" do
		expect(User.count).to eq(0)

		visit "/"
		expect(page).to have_content("Sign Up")
		click_link "Sign Up"

		fill_in "First Name", with: "Vlad"
		fill_in "Las Name", with: "Filiucov"
		fill_in "Email", with: "example@mail.ru"
		fill_in "Password", with: "password12"
		fill_in "Password (again)", with: "password12"
		click_button "Sign Up"

		expect(User.count).to eq(1)
	end

	it "displays a tutorial when the user signs up" do
		visit "/"
		click_link "Sign Up"

		fill_in "First Name", with: "Vlad"
		fill_in "Las Name", with: "Filiucov"
		fill_in "Email", with: "example@mail.ru"
		fill_in "Password", with: "password12"
		fill_in "Password (again)", with: "password12"
		click_button "Sign Up"

		expect(page).to have_content("Odot Tutorial")
		click_on "Odot Tutorial"

		expect(page.all("li.todo-item").size).to eq(7)
	end
end