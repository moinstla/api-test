require 'rails_helper'

Quote.destroy_all

describe "update a quote route", type: :request do

  before do

    @quote =  FactoryGirl.create(:quote)
    @quote2 =  FactoryGirl.create(:quote)
    delete "http://localhost:3000/quotes/#{@quote2.id}"
  end

  it 'should return status 200' do
         expect(response.status).to eq 200
     end

     it 'should delete the quote' do
         expect(Quote.all).to eq [@quote]
     end
end
