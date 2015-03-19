require "spec_helper"

describe "Logging up"  do
	it "logs the user in and goes to the todo list" do
		User.create(first_name: "Vladislav", las_name: "Filiucov", email: "filiucov@mail.ru", password: "password123", password_confirmation: "password123")
		visit new_user_session_path
		fill_in "Email Address", with: "filiucov@mail.ru"
		fill_in "Password", with: "password123"
		click_button "Log In"

		expect(page).to have_content("Todo list")
		expect(page).to have_content("Thanks for loggin in!")

	end

	it "displays the email adress in the event of a failed login" do
		visit new_user_session_path
		fill_in "Email Address", with: "filiucov@mail.ru"
		fill_in "Password", with: "incorrect"
		click_button "Log In"

		expect(page).to have_content("There was a problem loggin in.")
		expect(page).to have_field("Email Address", with: "filiucov@mail.ru")
	end
end