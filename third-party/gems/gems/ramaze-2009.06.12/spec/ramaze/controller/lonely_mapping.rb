require 'spec/helper'


class SpecHello < Ramaze::Controller
  def index
    'automatically mapped'
  end
end

describe 'Lonely Controller automap' do
  behaves_like :rack_test

  it 'automatically creates an app and maps the controller into it' do
    get('/').body.should == 'automatically mapped'
  end
end
