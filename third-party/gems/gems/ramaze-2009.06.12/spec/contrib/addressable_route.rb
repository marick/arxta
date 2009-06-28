require 'spec/helper'
require 'ramaze/contrib/addressable_route'

class SpecAddressableRoute < Ramaze::Controller
  map '/'

  def order__show(*args)
    [args, request.params].inspect
  end
end

describe 'addressable routing' do
  behaves_like :rack_test

  RAR = Ramaze::AddressableRoute
  RAR.map('/customer/{customer_id}/order/{order_id}', '/order/show')

  Ramaze.middleware! :spec do |m|
    m.use RAR
    m.run Ramaze::AppMap
  end

  it 'should route based on URI template' do
    body = eval(get('/customer/12/order/15').body)
    body.should == [[], {'customer_id' => '12', 'order_id' => '15'}]
  end

  it "should not route URIs that don't match" do
    get('/order/nothing/15')
    last_response.status.should == 404
  end
end
