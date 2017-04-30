require 'rails_helper'

RSpec.describe User, type: :model do

  it { should have_valid(:first_name).when("John") }
  it { should_not have_valid(:first_name).when(nil, "") }

  it { should have_valid(:last_name).when("Doe") }
  it { should_not have_valid(:last_name).when(nil, "") }

  it { should have_valid(:email).when("jdoe@yahoo.com") }
  it { should_not have_valid(:email).when(nil, "") }

  it { should have_valid(:password).when("password123") }
  it { should_not have_valid(:password).when(nil, "") }

  it { should have_valid(:username).when("jdoe") }
  it { should_not have_valid(:username).when(nil, "") }

end
