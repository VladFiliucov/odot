require "spec_helper"

describe "Logging Out" do
	it "allows a signed in user to sign out" do
		user = create(:user)
		visit "/todo_lists"
		expect(page).to have_content("Sign Up")
		fill_in "Email", with: user.email
		fill_in "Password", with: user.password
		click_button "Sign In"

		expect(page).to have_content("Log Out")
		click_link "Log Out"
		expect(page).to_not have_content("Log Out")
		expect(page).to have_content("Sign In")
	end
end