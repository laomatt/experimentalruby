require_relative 'processor'

describe "test process items" do
btp = BatchItemProcessor.new

array=[1,2,3,4,5]

it 'tests the array' do
 expect(btp.process_items(array)).to eq (array)
end

end