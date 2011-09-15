require 'spec_helper'

describe '<em>' do
  
  it "removes all attributes and transform <em> to <i>" do
    
    html = <<-HTML
      Test some text with <em style="width:100px;font-weight:bold;" onclick="sdfsdsfsd">bold text</em>
    HTML
    
    new_html = WritepubEditor::Base.new(html).to_s
    new_html.should include("<i>bold text</i>")
    
  end
  
  it "removes node if empty" do
    
    html = <<-HTML
      Test some text with <em style="width:100px;font-weight:bold;" onclick="sdfsdsfsd">  </em>
    HTML
    
    new_html = WritepubEditor::Base.new(html).to_s
    new_html.should == 'Test some text with'
    
  end
  
  
end