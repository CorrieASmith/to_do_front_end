ENV['RACK_ENV'] = 'development'
require('sinatra/activerecord')
require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/list/')
require('./lib/task/')
require('pg')


get '/' do
  @lists = List.all()
  @tasks = Task.all()
  erb(:index)
end

get('/list/:id') do
  @list = List.find(params.fetch('id').to_i())
  erb(:list)
end

post('/lists/new') do
  name = params.fetch('name')
  list = List.new({:name => name, :id => nil})
  list.save()
  redirect('/')
end

post('/task/new') do
  description = params.fetch('description')
  due_date = params.fetch('due date')
  id = params.fetch('list id').to_i()
  @list = List.find(id)
  task = Task.new({:description => description, :due_date => due_date, :list_id => id})
  task.save()
  redirect('/list/' + id.to_s())
end

get('/tasks/:id/edit') do
  @task = Task.find(params.fetch("id").to_i())
  erb(:task_edit)
end

patch("/tasks/:id") do
  description = params.fetch("description")
  @task = Task.find(params.fetch("id").to_i())
  @task.update({:description => description})
  @tasks = Task.all()
  @lists = List.all()
  erb(:index)
end
