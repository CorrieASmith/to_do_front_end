require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

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



  #
  # As a user, I want to see all of the lists that I have created so that I can manage them one at a time.
  # As a user, I want to create new lists of different categories so that I can keep similar tasks together (phone calls, school work, house work, errands to run, bills to pay, etc)
  # As a user, I want to select a single list and see the tasks for it.
  # As a user, I want to add tasks to a list.
