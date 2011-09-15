require 'spec_helper'

describe 'Span(italic)' do
  
  it "removes all attributes and transform <span> to <i>" do
    
    html = <<-HTML
      Test some text with <span style="width:100px;font-style:italic;" onclick="sdfsdsfsd">italic text</span>
    HTML
    
    new_html = WritepubEditor::Base.new(html).to_s
    new_html.should include("<i>italic text</i>")
    
  end
  
  it "can handle nuances of 'font-style'" do

    html = <<-HTML
      Test some text with <span style="width:100px;font-style: underlined italic;" onclick="sdfsdsfsd">italic text</span>
    HTML
    
    new_html = WritepubEditor::Base.new(html).to_s
    new_html.should include("<i>italic text</i>")

  end
  
  it "does not transforms if <span> does not contain 'font-style:italic'" do
    
    html = <<-HTML
      Test some text with <span style="width:100px;height:100px;font-style: underlined;" onclick="sdfsdsfsd">not italic text</span>
    HTML
    
    new_html = WritepubEditor::Base.new(html).to_s
    new_html.should == "Test some text with not italic text"
    
  end
  
  it "removes node if empty" do
    
    html = <<-HTML
      Test some text with <span style="width:100px;font-style:italic;" onclick="sdfsdsfsd">  </span>
    HTML
    
    new_html = WritepubEditor::Base.new(html).to_s
    new_html.should == 'Test some text with'
    
  end
  
end