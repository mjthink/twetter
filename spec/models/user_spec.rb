require 'spec_helper'

describe User do
  context "associations" do
    it { should have_many :follows }
  end

  context "factories" do
    describe "#user" do
      subject { FactoryGirl.build(:user) }

      it { should be_valid }
    end
  end

  context "validations" do
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of :email }
    it { should validate_presence_of :name }
    it { should validate_presence_of :password }
    it { should validate_confirmation_of :password }
    it { should validate_presence_of :username }
    it { should validate_uniqueness_of :username }
  end
end
