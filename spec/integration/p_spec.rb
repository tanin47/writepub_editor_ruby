require 'spec_helper'

describe '<p>' do
  
  it "transform <p>CONTENT</p> into CONTENT<br/><br/> (no next sibling)" do
    
    html = <<-HTML
      Test some text with <b><p><b>bold text</b><i>italic text</i></p></b>
    HTML
    
    new_html = WritepubEditor.enforce_rules_on(html).strip
    new_html.should == "Test some text with <b><b>bold text</b><i>italic text</i><br /><br /></b>"
    
  end
  
  it "transform <p>CONTENT</p> into CONTENT<br /><br /> (yes next sibling)" do
    
    html = <<-HTML
      Test some text with <b><p><span style="font-weight:bold">bold text</span><i>italic text</i></p>wefwefewf</b>
    HTML
    
    new_html = WritepubEditor.enforce_rules_on(html).strip
    new_html.should == 'Test some text with <b><b>bold text</b><i>italic text</i><br /><br />wefwefewf</b>'
    
  end
  
end