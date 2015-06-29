require 'spec_helper'
RSpec.describe ServiceMonster::Client::Jobs do

  before do
    @client = ServiceMonster::Client.new
  end

  describe '#jobs' do

    before do
      stub_get("jobs").to_return(body: fixture('jobs_list.json'), :headers => {:content_type => "application/json; charset=utf-8", authorization: 'Basic blah'})
      stub_get("jobs?wField=actualDateTimeEnd&wOperator=eq&wValue=2015-06-28T10:00:00").to_return(body: fixture('jobs_filtered.json'), :headers => {:content_type => "application/json; charset=utf-8", authorization: 'Basic blah'})
    end

    it 'should return a list of jobs' do
      @client.jobs
      expect(a_get("jobs")).to have_been_made
    end

    it 'should get filtered list of jobs' do
      @client.jobs(wField: "actualDateTimeEnd", wOperator: "eq", wValue: "2015-06-28T10:00:00")
      expect(a_get("jobs?wField=actualDateTimeEnd&wOperator=eq&wValue=2015-06-28T10:00:00")).to have_been_made
    end
  end

end
