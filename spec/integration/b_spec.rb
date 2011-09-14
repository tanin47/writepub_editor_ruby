require 'spec_helper'

describe '<b>' do
  
  it "removes all attributes" do
    
    html = <<-HTML
      Test some text with <b style="width:100px;font-weight:bold;" onclick="sdfsdsfsd">bold text</b>
    HTML
    
    new_html = WritepubEditor.enforce_rules_on(html)
    new_html.should include("<b>bold text</b>")
    
  end
  
end