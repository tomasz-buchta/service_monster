require 'spec_helper'

RSpec.describe ServiceMonster::Client::Orders do
  
  before do
    @client = ServiceMonster::Client.new
  end

  describe '#orders' do

    before do
      stub_get("orders").to_return(body: fixture('orders_list.json'), :headers => {:content_type => "application/json; charset=utf-8", authorization: 'Basic blah'})
    end

    it 'should return a list of orders' do
      @client.orders
      expect(a_get("orders")).to have_been_made
    end
  end

  describe '#order' do

    before do
      stub_get("orders/84a49a56-9b71-11e4-87df-cb4dbb25dccc").to_return(body: fixture('order.json'), :headers => {:content_type => "application/json; charset=utf-8", authorization: 'Basic blah'})
    end

    it 'should return the selected order' do
      @client.order('84a49a56-9b71-11e4-87df-cb4dbb25dccc')
      expect(a_get("orders/84a49a56-9b71-11e4-87df-cb4dbb25dccc")).to have_been_made
    end
  end

end
