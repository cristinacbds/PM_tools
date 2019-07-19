require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(FactoryBot.attributes_for(:user))}

  describe '#validations' do
    it 'should be valid' do 
      expect(subject).to be_valid
    end

    it 'first name should be present' do
      subject.first_name = nil
      expect(subject).to_not be_valid
    end

    it 'last name should be present' do
      subject.last_name = nil
      expect(subject).to_not be_valid
    end

    it 'email should have correct format' do
      subject.email = 'lalalalada'
      expect(subject).to_not be_valid
    end

    it 'password should be present' do
      subject.password_digest = nil
      expect(subject).to_not be_valid
    end

    it 'password should have at least 8 characters' do
      subject.password_digest = '123'
      subject.valid?
      expect(subject.errors).to have_key(:password_digest)
    end

    it 'email should be unique' do
      subject.save
      user = User.new(FactoryBot.attributes_for(:user))
      user.valid?
      expect(user.errors).to have_key(:email)
    end

    it 'email should be present' do
      subject.email = nil
      expect(subject).to_not be_valid
    end

    it 'email should be case insensitive' do
      actual = subject.email
      expect(actual).to match(/LALALA@example.com/i)
    end

    it 'email should be save lower case' do
      subject.email = "LALALA@example.com"
      subject.save
      after = subject.email
      expect(after).to eq('lalala@example.com')
    end
  end
end