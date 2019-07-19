require 'rails_helper'

RSpec.describe Project, type: :model do
  subject { Project.new(FactoryBot.attributes_for(:project))}
  describe '#validations' do
    it "is valid with valid atributes" do
      expect(subject).to be_valid
    end

    it "requires a title" do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it "requires a unique title" do
      subject.save
      project = Project.new(FactoryBot.attributes_for(:project))
      project.valid?
      expect(project.errors).to have_key(:title)
    end

    it "requires a due date grater than today" do
      subject.due_date = '2019-02-10'
      subject.valid?
      expect(subject.errors).to have_key(:due_date)
    end
  end
end
