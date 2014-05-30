describe 'Task' do

  before do
    class << self
      include CDQ
    end
    cdq.setup
  end

  after do
    cdq.reset!
  end

  it 'should be a Task entity' do
    Task.entity_description.name.should == 'Task'
  end

  it "can be created" do
    Task.create(task_description: 'foo', task_at: Time.now)
    Task.create(task_description: 'bar', task_at: Time.now + 10)

    Task.count.should == 2
  end
end
