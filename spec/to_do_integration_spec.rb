require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)
require('spec_helper')

describe('the create new list path', {:type => :feature}) do
  it('allows user to add a new list') do
    visit('/')
    fill_in('name', :with => 'Stuff to do')
    click_button('Add list')
    expect(page).to have_content('Stuff to do')
  end
end

describe('select list and display tasks', {:type => :feature}) do
  it('allows user to select a list and display its tasks') do
    test_list = List.new({:name => 'go to school', :id => nil})
    test_list.save()
    test_task = Task.new(:description => 'buy new eraser', :list_id => test_list.id, :due_date => '2015-3-03')
    test_task.save()
    visit('/')
    click_link(test_list.name())
    expect(page).to have_content(test_task.description())
  end
end

describe('add new tasks to a list', {:type => :feature}) do
  it('allows user to add tasks to a list') do
    test_list = List.new({:name => 'Work stuff', :id => nil})
    test_list.save()
    visit('/')
    click_link(test_list.name())
    fill_in('description', :with => 'finish project')
    fill_in('due date', :with => '2015-9-1')
    click_button('Add Task!')
    expect(page).to have_content('finish project')
  end
end






  # As a user, I want to add tasks to a list.
