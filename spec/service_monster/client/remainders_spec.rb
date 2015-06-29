require 'spec_helper'
RSpec.describe ServiceMonster::Client::Reminders do

  before do
    @client = ServiceMonster::Client.new
  end

  describe '#remainders' do

    before do
      stub_get("reminders").to_return(body: fixture('reminders_list.json'), :headers => {:content_type => "application/json; charset=utf-8", authorization: 'Basic blah'})
      stub_get("reminders?wField=startDateTime&wOperator=eq&wValue=2015-05-16T09:00:00").to_return(body: fixture('reminders_filtered.json'), :headers => {:content_type => "application/json; charset=utf-8", authorization: 'Basic blah'})
    end

    it 'should return a list of remainders' do
      @client.reminders
      expect(a_get("reminders")).to have_been_made
    end

    it 'should get filtered reminders' do
      @client.reminders(wField: "startDateTime", wOperator: "eq", wValue: "2015-05-16T09:00:00")
      expect(a_get("reminders?wField=startDateTime&wOperator=eq&wValue=2015-05-16T09:00:00")).to have_been_made
    end
  end

end
