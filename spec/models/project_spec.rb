require 'rails_helper'

RSpec.describe Project, type: :model do
  it "is valid with valid atributes" do
    expect(Project.new(title: "Hello", due_date: '2020-07-10')).to be_valid
  end

  it "requires a title" do
    project = Project.new(title: nil, due_date: '2020-07-10')
    expect(project).to_not be_valid
  end

  it "requires a unique title" do
    project_to_fail = Project.new(title: "Hello", due_date: '2020-07-10')
    project_to_fail.save
    project = Project.new(title: "Hello", due_date: '2020-07-10')
    project.valid?
    expect(project.errors).to have_key(:title)
  end

  it "requires a due date grater than today" do
    project = Project.new(title: "Hello", due_date: '2019-07-10')
    project.valid?
    expect(project.errors).to have_key(:due_date)
  end
end
