require 'spec_helper'

describe 'span_bold' do
  
  it "removes all attributes and transform <span> to <b>" do
    
    html = <<-HTML
      Test some text with <span style="width:100px;font-weight:bold;" onclick="sdfsdsfsd">bold text</span>
    HTML
    
    new_html = WritepubEditor::Base.new(html).to_s
    new_html.should include("<b>bold text</b>")
    
  end
  
  it "does not transforms if <span> does not contain 'font-weight'" do
    
    html = <<-HTML
      Test some text with <span style="width:100px;height:100px;" onclick="sdfsdsfsd">not bold text</span>
    HTML
    
    new_html = WritepubEditor::Base.new(html).to_s
    new_html.should == "Test some text with not bold text"
    
  end
  
  it "removes node if empty" do
    
    html = <<-HTML
      Test some text with <span style="width:100px;font-weight:bold;" onclick="sdfsdsfsd">  </span>
    HTML
    
    new_html = WritepubEditor::Base.new(html).to_s
    new_html.should == 'Test some text with'
    
  end
  
end