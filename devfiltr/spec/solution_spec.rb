require_relative '../lib/solution'
describe Calculator do 
  it 'adds' do
  c = Calculator.new
   c.add(1,2).should == 3 
   end 
end
