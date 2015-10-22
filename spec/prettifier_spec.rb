require_relative '../prettifier'

describe Prettifier do
  before :each do
    @prettifier = Prettifier.new
  end

  describe "#Create" do
    it "should create object instance" do
      expect(@prettifier).to be_an_instance_of Prettifier
    end
  end

  describe "#params" do
    it "should throw error if nothing given" do
      expect { @prettifier.prettify(nil) }.to raise_error TypeError
    end

    it "should throw error if NAN given" do
      expect { @prettifier.prettify('abc') }.to raise_error TypeError
    end

    it "should not throw error if number given" do
      expect { @prettifier.prettify(10) }.to_not raise_error TypeError
    end
  end

  describe "#round results" do
    it "should evaluate 1M" do
      expect(@prettifier.prettify(1000000)).to eq('1M')
    end
    it "should evaluate 12M" do
      expect(@prettifier.prettify(12000012)).to eq('12M')
    end
    it "should evaluate 100M" do
      expect(@prettifier.prettify(100000012)).to eq('100M')
    end
    it "should evaluate 1B" do
      expect(@prettifier.prettify(1000000000)).to eq('1B')
    end
    it "should evaluate 10B" do
      expect(@prettifier.prettify(10000000000)).to eq('10B')
    end
    it "should evaluate 100B" do
      expect(@prettifier.prettify(100000000000)).to eq('100B')
    end
    it "should evaluate 1T" do
      expect(@prettifier.prettify(1000000000000)).to eq('1T')
    end
    it "should evaluate 10T" do
      expect(@prettifier.prettify(10000000000000)).to eq('10T')
    end
    it "should evaluate 100T" do
      expect(@prettifier.prettify(100000000000000)).to eq('100T')
    end
  end

  describe "#1 decimal place results" do
    it "should evaluate 1.2M" do
      expect(@prettifier.prettify(1200000)).to eq('1.2M')
    end
    it "should evaluate 10.2M" do
      expect(@prettifier.prettify(10200000)).to eq('10.2M')
    end
    it "should evaluate 100.2M" do
      expect(@prettifier.prettify(100200000)).to eq('100.2M')
    end
    it "should evaluate 1.2B" do
      expect(@prettifier.prettify(1200000000)).to eq('1.2B')
    end
    it "should evaluate 10.2B" do
      expect(@prettifier.prettify(10200000000)).to eq('10.2B')
    end
    it "should evaluate 100.2B" do
      expect(@prettifier.prettify(100200000000)).to eq('100.2B')
    end
    it "should evaluate 1.2T" do
      expect(@prettifier.prettify(1200000000000)).to eq('1.2T')
    end
    it "should evaluate 10.2T" do
      expect(@prettifier.prettify(10200000000000)).to eq('10.2T')
    end
    it "should evaluate 100.2T" do
      expect(@prettifier.prettify(100200000000000)).to eq('100.2T')
    end
  end

  describe "# given examples" do
    it "should evaluate 1M" do
      expect(@prettifier.prettify(1000000)).to eq('1M')
    end

    it "should evaluate 2.5M" do
      expect(@prettifier.prettify(2500000.34)).to eq('2.5M')
    end

    it "should evaluate 532" do
      expect(@prettifier.prettify(532)).to eq('532')
    end

    it "should evaluate 1.1B" do
      expect(@prettifier.prettify(1123456789)).to eq('1.1B')
    end
  end

  describe "# edge cases" do
    it "should evaluate 0" do
      expect(@prettifier.prettify(0)).to eq('0')
      expect(@prettifier.prettify(-0)).to eq('0')
    end

    it "should evaluate -2.5M" do
      expect(@prettifier.prettify(-2500000.34)).to eq('-2.5M')
    end

    it "should evaluate -532" do
      expect(@prettifier.prettify(-532)).to eq('-532')
    end

    it "should evaluate -1.1B" do
      expect(@prettifier.prettify(-1123456789)).to eq('-1.1B')
    end

    it "should not support scale larger than trillion" do
      expect { @prettifier.prettify(100200000000000000) }.to raise_error ArgumentError
    end
  end

  describe "rounding" do
    it "should round to upper" do
      expect(@prettifier.prettify(1959999)).to eq('2M')
      expect(@prettifier.prettify(1959999999)).to eq('2B')
      expect(@prettifier.prettify(1959999999999)).to eq('2T')
    end
  end
end
