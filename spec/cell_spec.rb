require 'cell'

describe Cell do
  let(:ship) { double :ship }
  it 'is initialized with status "empty"' do
    expect(subject).to be_empty
  end

  it 'can be filled with a ship' do
    subject.fill(ship)
    expect(subject).not_to be_empty
    expect(subject.content).to eq ship
  end

  it 'can be hit' do
    subject.hit
    expect(subject).to be_hit
  end

  it 'can not be hit twice' do
    subject.hit
    expect { subject.hit }.to raise_error 'Cell has already been hit'
  end
end
