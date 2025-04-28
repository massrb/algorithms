
RSpec.describe "Hash test" do
  
  let(:map) { {frog: :green, bear: :brown, cloud: :white, swan: :white } }
  let(:map2) { {cloud: :white, swan: :white, frog: :green, bear: :brown  } }
  let(:map3) {{cloud: :white, swan: :white, frog: :green }}
  it "has equality" do
    expect(map).to eq(map2)
    expect(map).to_not eq(map3)
    expect(map == map2).to eq(true)
  end

  it 'has order of insertion maintained' do
    expect(map.values).to_not eq(map2.values)
    expect(map.values.sort).to eq(map2.values.sort)
  end
end