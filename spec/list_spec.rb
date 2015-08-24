require('spec_helper')

describe(List) do

  # describe('.all') do
  #   it("starts off with no lists") do
  #     expect(List.all()).to(eq([]))
  #   end
  # end
  #
  # describe('#==') do
  #   it("is the same list if it has the same") do
  #     list1 = List.new({:name => "hiking stuff", :id => nil})
  #     list2 = List.new({:name => "hiking stuff", :id => nil})
  #     expect(list1).to(eq(list2))
  #   end
  # end
  #
  # describe('#save') do
  #   it("saves a list onto the list table") do
  #     test_list = List.new({:name => "hiking gear", :id => nil})
  #     test_list.save()
  #     expect(List.all()).to(eq([test_list]))
  #   end
  # end
  #
  # describe('.find') do
  #   it('returns a list by its id') do
  #     test_list = List.new({:name => "Shopping List", :id => nil})
  #     test_list.save()
  #     test_list2 = List.new({:name => "Homework", :id => nil})
  #     test_list2.save()
  #     expect(List.find(test_list2.id())).to(eq(test_list2))
  #   end
  # end

  describe('#tasks') do
    it("tells which tasks are in it") do
    test_list = List.create({:name => "list"})
    test_task1 = Task.create({:description => "task1", :list_id => test_list.id})
    test_task2 = Task.create({:description => "task2", :list_id => test_list.id})
   expect(test_list.tasks()).to(eq([test_task1, test_task2]))
    end
  end
end
