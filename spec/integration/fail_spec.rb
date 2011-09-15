require 'spec_helper'

describe 'Failure' do
  
  it "fails if HTML is malformed" do
    
    html = <<-HTML
      Test some text with <strong style="width:100px;font-weight:bold;" onclick="sdfsdsfsd">strong</strog>
    HTML
    
    lambda { WritepubEditor::Base.new(html).to_s }.should raise_error
    
  end
  
  
end