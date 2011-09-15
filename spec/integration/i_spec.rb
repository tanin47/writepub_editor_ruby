require 'spec_helper'

describe '<i>' do
  
  it "removes all attributes" do
    
    html = <<-HTML
      Test some text with <i style="width:100px;font-weight:bold;" onclick="sdfsdsfsd">italic</i>
    HTML
    
    new_html = WritepubEditor.enforce_rules_on(html)
    new_html.should include("<i>italic</i>")
    
  end
  
  
  it "removes node if empty" do
    
    html = <<-HTML
      Test some text with <i style="width:100px;font-weight:bold;" onclick="sdfsdsfsd">  </i>
    HTML
    
    new_html = WritepubEditor.enforce_rules_on(html)
    new_html.should == 'Test some text with'
    
  end
  
end