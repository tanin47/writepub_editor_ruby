require 'spec_helper'

describe '<b>' do
  
  it "removes all attributes" do
    
    html = <<-HTML
      Test some text with <b style="width:100px;font-weight:bold;" onclick="sdfsdsfsd">bold text</b>
    HTML
    
    new_html = WritepubEditor::Base.new(html).to_s
    new_html.should include("<b>bold text</b>")
    
  end
  
  it "removes node if empty" do
    
    html = <<-HTML
      Test some text with <b style="width:100px;font-weight:bold;" onclick="sdfsdsfsd">  </b>
    HTML
    
    new_html = WritepubEditor::Base.new(html).to_s
    new_html.should == 'Test some text with'
    
  end
  
end