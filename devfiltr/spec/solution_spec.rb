require_relative '../lib/solution'
describe Calculator do
  it "adds 1 and 2" do
    subject.add(1, 2).should == 3
  end
        
  it "subtracts 2 from 9" do
    subject.subtract(9, 2).should == 7
  end

  it "multiplies 4 by 3" do
    subject.multiply(4, 3).should == 12
  end
  
  it "divides 10 by 5" do
    subject.divide(10, 5).should == 2
  end
        
end
