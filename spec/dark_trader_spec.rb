require_relative '../lib/dark_trader'

describe "the dark trader method" do
  it "should return an array" do
    expect(dark_trader.class).to eq(Array)
  end 

  it "should return an array with at least 2 elements" do
    expect(dark_trader.length).to be > 1
  end

  it "should return an array of hashes" do
    expect(dark_trader[0].class).to eq(Hash)
    expect(dark_trader[1].class).to eq(Hash)
    expect(dark_trader[2].class).to eq(Hash)
  end
end