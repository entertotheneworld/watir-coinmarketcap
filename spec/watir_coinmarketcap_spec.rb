require_relative '../lib/watir_coinmarketcap.rb'

describe "coinmarketcap scrapper" do
  it "should return a hash" do
    expect(perform).not_to be_nil
    expect(perform).not_to be_empty
    expect(perform.class).to eq(Hash)
    expect(perform.include?("BTC")).to eq(true)
    expect(perform.include?("ETH")).to eq(true)
  end
end
