require 'spec_helper'

describe "todo_lists/index" do
  before(:each) do
    assign(:todo_lists, [
      stub_model(TodoList,
        :title => "Title"
        ),
      stub_model(TodoList,
        :title => "Title"
        )
      ])	
end

  it "renders a list of todo_lists" do
    render
    assert_select "ul.todo-lists li div", :text => "Title".to_s, :count => 2
  end
end