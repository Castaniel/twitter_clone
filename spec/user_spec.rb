class Hash 
  def has_all_string_keys? 
    keys.all? { |k| String === k } 
  end 
end 

RSpec.describe Hash do 
  context 'with symbol keys' do 
    subject { { :foo => 7, :bar => 5 } } 
    it { is_expected.not_to have_all_string_keys } 
  end 

  context 'with string keys' do 
    subject { { :foo => 7, 'bar' => 5 } } 
    it { is_expected.not_to have_all_string_keys } # deliberate failure 
  end 
end
