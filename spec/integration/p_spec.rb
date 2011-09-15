require 'spec_helper'

describe '<p>' do
  
  it "transform <p>CONTENT</p> into CONTENT<br/><br/> (no next sibling)" do
    
    html = <<-HTML
      Test some text with <b><p><b>bold text</b><i>italic text</i></p></b>
    HTML
    
    new_html = WritepubEditor::Base.new(html).to_s.strip
    new_html.should == "Test some text with <b><b>bold text</b><i>italic text</i><br /><br /></b>"
    
  end
  
  it "transform <p>CONTENT</p> into CONTENT<br /><br /> (yes next sibling)" do
    
    html = <<-HTML
      Test some text with <b><p><span style="font-weight:bold">bold text</span><i>italic text</i></p>wefwefewf</b>
    HTML
    
    new_html = WritepubEditor::Base.new(html).to_s.strip
    new_html.should == 'Test some text with <b><b>bold text</b><i>italic text</i><br /><br />wefwefewf</b>'
    
  end
  
  
  it "removes node if empty" do
    
    html = <<-HTML
      Test some text with <p style="width:100px;font-weight:bold;" onclick="sdfsdsfsd">  </p>
    HTML
    
    new_html = WritepubEditor::Base.new(html).to_s
    new_html.should == 'Test some text with'
    
  end
  
end