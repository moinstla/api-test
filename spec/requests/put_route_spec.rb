require 'rails_helper'


describe "PUT update/:id" do
  before do
    quote = FactoryGirl.create(:quote)
    put "/quotes/#{quote.id}", params: {
      :author => "new author",
      :content => "content"
    }
  end

  it 'should return status 200' do
         expect(response.status).to eq 200
     end


  it do
    expect(Quote.first.author).to eq "new author"
  end

end
