require 'spec_helper'

describe '<strong>' do
  
  it "removes all attributes" do
    
    html = <<-HTML
      Test some text with <strong style="width:100px;font-weight:bold;" onclick="sdfsdsfsd">strong</strong>
    HTML
    
    new_html = WritepubEditor.enforce_rules_on(html)
    new_html.should include("<b>strong</b>")
    
  end
  
  it "removes node if empty" do
    
    html = <<-HTML
      Test some text with <strong style="width:100px;font-weight:bold;" onclick="sdfsdsfsd">  </strong>
    HTML
    
    new_html = WritepubEditor.enforce_rules_on(html)
    new_html.should == 'Test some text with'
    
  end
  
end