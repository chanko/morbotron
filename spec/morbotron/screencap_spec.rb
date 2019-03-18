require 'spec_helper'

RSpec.describe Morbotron::Screencap do
  it 'return an empty array' do
    VCR.use_cassette('empty') do
      results = Morbotron::Screencap.search('asdf')

      expect(results).to be_empty
    end
  end

  it 'returns multiple screencaps' do
    VCR.use_cassette('search') do
      results = Morbotron::Screencap.search('30%')

      expect(results.size).to eq(36)
      expect(results.first).to be_a(Morbotron::Screencap)
    end
  end

  it 'returns correct image url' do
    VCR.use_cassette('search') do
      screencap = Morbotron::Screencap.search('30%').first

      expect(screencap.image_url).to eq('https://morbotron.com/img/S05E11/85034.jpg')
    end
  end

  it 'returns correct caption' do
    VCR.use_cassette('caption') do
      screencap = Morbotron::Screencap.search('That Darn Katz!').first

      expect(screencap.caption).to eq("after they built that\ndarned basketball arena!\nNow everybody likes\nbasketball instead of\nkabuki!")
    end
  end

  it 'returns correct meme url' do
    VCR.use_cassette('meme') do
      screencap = Morbotron::Screencap.search('That Darn Katz!').first

      expect(screencap.meme_url).to eq('https://morbotron.com/meme/S10E06/197197.jpg?b64lines=YWZ0ZXIgdGhleSBidWlsdCB0aGF0CmRhcm5lZCBiYXNrZXRiYWxsIGFyZW5hIQpOb3cgZXZlcnlib2R5IGxpa2VzCmJhc2tldGJhbGwgaW5zdGVhZCBvZgprYWJ1a2kh')
    end
  end

  it 'allows a custom caption for a meme' do
    VCR.use_cassette('meme') do
      screencap = Morbotron::Screencap.search('That Darn Katz!').first

      expect(screencap.meme_url('CUSTOM CAPTION GOES HERE')).to eq('https://morbotron.com/meme/S10E06/197197.jpg?b64lines=Q1VTVE9NIENBUFRJT04gR09FUyBIRVJF')
    end
  end

  it 'allows captions as arrays' do
    VCR.use_cassette('meme') do
      screencap = Morbotron::Screencap.search('That Darn Katz!').first

      expect(screencap.meme_url(['CUSTOM CAPTIONS', 'GO HERE'])).to eq('https://morbotron.com/meme/S10E06/197197.jpg?b64lines=Q1VTVE9NIENBUFRJT05TCkdPIEhFUkU=')
    end
  end

  it 'returns a random screencap' do
    VCR.use_cassette('search') do
      screencap = Morbotron::Screencap.random('That Darn Katz!')

      expect(screencap).to be_a(Morbotron::Screencap)
    end
  end

  it 'returns nil when random returns nothing' do
    VCR.use_cassette('empty') do
      screencap = Morbotron::Screencap.random('asdf')

      expect(screencap).to be_nil
    end
  end
end
