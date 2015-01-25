require_relative 'method'


describe'tests for convertBits ' do
  it '1' do
    expect(convertBits(1)).to eq([1,0,0,0,0,0,0,0])
  end

  it '2' do
    expect(convertBits(2)).to eq([0,1,0,0,0,0,0,0])
  end

  it '4' do
    expect(convertBits(4)).to eq([0,0,1,0,0,0,0,0])
  end

  it '8' do
    expect(convertBits(8)).to eq([0,0,0,1,0,0,0,0])
  end

  it '16' do
    expect(convertBits(16)).to eq([0,0,0,0,1,0,0,0])
  end

  it '32' do
    expect(convertBits(32)).to eq([0,0,0,0,0,1,0,0])
  end

  it '64' do
    expect(convertBits(64)).to eq([0,0,0,0,0,0,1,0])
  end

  it '128' do
    expect(convertBits(128)).to eq([0,0,0,0,0,0,0,1])
  end

  it '256' do
    expect(convertBits(255)).to eq([1,1,1,1,1,1,1,1])
  end
end




describe'tests for convertBits2 ' do
  it '1' do
    expect(convertBits2(1)).to eq([1,0,0,0,0,0,0,0])
  end

  it '2' do
    expect(convertBits2(2)).to eq([0,1,0,0,0,0,0,0])
  end

  it '4' do
    expect(convertBits2(4)).to eq([0,0,1,0,0,0,0,0])
  end

  it '8' do
    expect(convertBits2(8)).to eq([0,0,0,1,0,0,0,0])
  end

  it '16' do
    expect(convertBits2(16)).to eq([0,0,0,0,1,0,0,0])
  end

  it '32' do
    expect(convertBits2(32)).to eq([0,0,0,0,0,1,0,0])
  end

  it '64' do
    expect(convertBits2(64)).to eq([0,0,0,0,0,0,1,0])
  end

  it '128' do
    expect(convertBits2(128)).to eq([0,0,0,0,0,0,0,1])
  end

   it '256' do
    expect(convertBits2(255)).to eq([1,1,1,1,1,1,1,1])
  end
end
