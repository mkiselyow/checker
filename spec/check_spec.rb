require './check'

RSpec.describe Check do
  describe "initialize method" do
    it "returns response.code when url is valid" do
      check = Check.new('http://www.nokogiri.org/')
      expect(check.instance_variable_get("@res").code).to eq('200')
    end
    it "returns response.code when url is valid" do
      expect{Check.new('http://www.nokogiriiiii.org/')}.to output(/====== INVALID URL ======\n/).to_stdout
    end
  end
end