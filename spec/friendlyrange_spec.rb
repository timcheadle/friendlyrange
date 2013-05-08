require 'spec_helper'

describe FriendlyRange do
  it 'takes comma separated values' do
    range = FriendlyRange.new('1, 2, 3')
    range.should == [1, 2, 3]

    range = FriendlyRange.new('1,2,3')
    range.should == [1, 2, 3]

    range = FriendlyRange.new('1,2,   3, ')
    range.should == [1, 2, 3]
  end

  it 'takes a range of values' do
    range = FriendlyRange.new('1-4')
    range.should == [1, 2, 3, 4]

    range = FriendlyRange.new('1 - 4')
    range.should == [1, 2, 3, 4]

    range = FriendlyRange.new('  1 -4   ')
    range.should == [1, 2, 3, 4]
  end

  it 'takes a mixed set of CSV and ranges' do
    range = FriendlyRange.new(' 1 -4, 3, 8-9, 3   ')
    range.should == [1, 2, 3, 4, 8, 9]
  end

  it "raises ArgumentError when it can't parse" do
    expect do
      FriendlyRange.new('1-2, omg foo')
    end.to raise_error(ArgumentError)
  end

  it 'to_s converts the range back to a string' do
    range = FriendlyRange.new('1, 2, 3, 4')
    range.to_s.should == '1-4'

    range = FriendlyRange.new('1-2, 6-9, 4, 2')
    range.to_s.should == '1-2, 4, 6-9'
  end
end
