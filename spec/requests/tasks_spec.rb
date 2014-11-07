require 'rails_helper'

describe "Tasks", :type => :request do
  let(:name) {"paint fence"}
  let(:task) {Task.create!(name:name)}
  describe "GET /tasks", js:true do
    before(:each) {
      Task.create!(name:name)
      visit tasks_path
    }
    it "displays tasks" do
      expect(page).to have_content name
    end

    it "support javascript" do
      click_link 'test js'
      expect(page).to have_content "js works"
    end
  end

  describe 'POST /tasks' do
    it 'create task' do
      visit tasks_path
      fill_in "New Task", with: name
      click_button "Add"
      expect(page).to have_content(name)
    end
  end

end
