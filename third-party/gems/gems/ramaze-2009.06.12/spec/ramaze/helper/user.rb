require 'spec/helper'

class MockSequelUser
  def profile
    "Arthur Dent, fearful human in outer space!"
  end

  def self.authenticate(hash)
    new if hash.values_at('name', 'password') == %w[arthur 42]
  end
end

class SpecUserHelper < Ramaze::Controller
  map '/'
  helper :user
  trait :user_model => MockSequelUser

  def status
    logged_in? ? 'yes' : 'no'
  end

  def login
    user_login ? 'logged in' : 'failed login'
  end

  def logout
    user_logout
  end

  def profile
    user.profile
  end
end

Arthur = {
  :name => 'arthur',
  :pass => '42',
  :profile => 'Arthur Dent, fearful human in outer space!'
}


class SpecUserHelperCallback < SpecUserHelper
  map '/callback'
  helper :user
  trait :user_callback => lambda{|hash|
    Arthur if hash.values_at('name', 'password') == Arthur.values_at(:name, :pass)
  }

  def profile
    user[:profile]
  end
end

describe Ramaze::Helper::User do
  behaves_like :rack_test

  should 'login' do
    get('/status').body.should == 'no'
    get('/login?name=arthur&password=42').body.should == 'logged in'
    get('/status').body.should == 'yes'
    get('/profile').body.should == MockSequelUser.new.profile
    get('/logout').status.should == 200
  end

  should 'login via the callback' do
    get('/callback/status').body.should == 'no'
    get('/callback/login?name=arthur&password=42').body.should == 'logged in'
    get('/callback/status').body.should == 'yes'
    get('/callback/profile').body.should == MockSequelUser.new.profile
    get('/logout').status.should == 200
  end
end
