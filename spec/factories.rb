FactoryGirl.define do
	factory :user do
		first_name "First"
		las_name "Last"
		sequence(:email) { |n| "user#{n}@odot.com"}
		password "treehouse1"
		password_confirmation "treehouse1"
	end

	factory :todo_list do
		title "Todo List Title"
		user
	end
end