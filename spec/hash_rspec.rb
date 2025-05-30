
RSpec.describe "Hash test" do
  
  let(:map) { {frog: :green, bear: :brown, cloud: :white, swan: :white } }
  let(:map2) { {cloud: :white, swan: :white, frog: :green, bear: :brown  } }
  let(:map3) {{cloud: :white, swan: :white, frog: :green }}
  it "has equality" do
    # same elements but not in the same order
    expect(map).to eq(map2)
    expect(map == map2).to eq(true)
    expect(map === map2).to eq(true)

    expect(map).to_not eq(map3)
  end

  it 'has order of insertion maintained' do
    # same values but insertion order is preserved
    expect(map.values).to_not eq(map2.values)
    expect(map.values.sort).to eq(map2.values.sort)
  end
end