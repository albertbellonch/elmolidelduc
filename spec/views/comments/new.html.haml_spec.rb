require 'spec_helper'

describe "comments/new.html.haml" do
  before(:each) do
    assign(:comment, stub_model(Comment,
      :name => "MyString",
      :mail => "MyString",
      :body => "MyText",
      :user_id => 1,
      :post_id => 1
    ).as_new_record)
  end

  it "renders new comment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => comments_path, :method => "post" do
      assert_select "input#comment_name", :name => "comment[name]"
      assert_select "input#comment_mail", :name => "comment[mail]"
      assert_select "textarea#comment_body", :name => "comment[body]"
      assert_select "input#comment_user_id", :name => "comment[user_id]"
      assert_select "input#comment_post_id", :name => "comment[post_id]"
    end
  end
end
