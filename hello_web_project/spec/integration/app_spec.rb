require_relative '../spec_helper'
require 'rack/test'
require_relative '../../app'

RSpec.describe Application do
include Rack::Test::Methods

let(:app) { Application.new }

context 'GET / ' do
    it 'returns a 200 OK code and the message Hello Cassius' do
        response = get('/hello?name=Cassius')

        expect(response.status).to eq(200)
        expect(response.body).to eq "Hello Cassius"
    end
end

context 'GET /names' do
    it 'returns a 200 OK code and the message Julia, Mary, Karim' do
        response = get('/names?names=Julia, Mary, Karim')

        expect(response.status).to eq(200)
        expect(response.body).to eq "Julia, Mary, Karim"
    end
end

context 'POST /posts' do
    it 'returns a 200 code and the message that a post was created' do
        response = post('/posts')

        expect(response.status).to eq(200)
        expect(response.body).to eq "Post was created"
    end
end

context 'POST /sort-names'
    it 'receive a comma separated string as a body parameter, and returns the alphabetised string' do
    response = post('/sort-names?names=Joe,Alice,Zoe,Julia,Kieran')

    expect(response.status).to eq(200)
    expect(response.body).to eq 'Alice,Joe,Julia,Kieran,Zoe'
    end
end