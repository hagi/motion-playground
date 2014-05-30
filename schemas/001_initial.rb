schema "001" do
  entity "Task" do
    string :task_description, optional: false
    datetime :task_at
  end
end