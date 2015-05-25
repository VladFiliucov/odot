require 'spec_helper'

describe "Viewing todo items" do
	let(:user) { todo_list.user }	
	let!(:todo_list) { create(:todo_list) }
	before { sign_in user, password: "treehouse1" }

	it "displays the title of the todo list" do
		visit_todo_list(todo_list)
		within("h2.page-title") do
			expect(page).to have_content(todo_list.title)
		end
	end


	it "displays item content when todo list has items" do
		todo_list.todo_items.create(content: "Milk")
		todo_list.todo_items.create(content: "Eggs")

		visit_todo_list(todo_list)
		expect(page).to have_content("Milk")
		expect(page).to have_content("Eggs")
	end
end