require 'faraday'
require_relative '../../app/request/states_names'
require 'vcr'
require 'spec_helper'

describe 'StatesNames' do
  context 'when success '

  let(:states_faraday) { Faraday }
  let(:states_names) { StatesNames.new(states_faraday) }

  it 'response with code 200', :vcr do
    expect(states_names.response.status).to eq 200
  end
end

context 'when failled' do
  before(:each) do
    response = {
      status: 'failled',
      data: []
    }
    stub_request(:get, 'https://servicodados.ibge.govxyz')
      .to_return(status: 404, body: response.to_json)
    it 'return o status', :vcr do
      expect(estado.url.code).to eq '404'
    end
  end
end
