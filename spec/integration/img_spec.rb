require 'spec_helper'

describe '<img>' do
  
  it "transforms <img> to <img />" do
    
    html = <<-HTML
      Test some text with img <img src="http://www.google.com/">
    HTML
    
    new_html = WritepubEditor.enforce_rules_on(html).strip
    new_html.should == 'Test some text with img <img src="http://www.google.com/" />'
    
  end
  
  it "removes attributes from <img> except 'src'" do
    
    html = <<-HTML
      Test some text with img <img src="http://www.google.com/" style="width:100px;" alt="asdasd" />
    HTML
    
    new_html = WritepubEditor.enforce_rules_on(html).strip
    new_html.should == 'Test some text with img <img src="http://www.google.com/" />'
    
    
  end

end