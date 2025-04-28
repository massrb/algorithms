RSpec.describe "Operator test" do
  Address = Struct.new(:street, :city, :zip)
  Person = Struct.new(:name, :email, :address)
  let(:person) { Person.new(name: 'bob', email: 'x@gmail.com') }

  it 'has a safe operator' do
    # safe navigation operator only protects against nil
    expect { x = person&.manager }.to raise_error(NoMethodError)
    x = person&.address&.zip
    # address is nil so anything beyond that 
    # doesn't matter
    y = person&.address&.wrong_field
    expect(x).to eq(nil)
    expect(y).to eq(nil)

  end

end