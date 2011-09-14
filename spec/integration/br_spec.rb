require 'spec_helper'

describe '<br>' do
  
  it "allows <br>, <br >, <br/>, and <br />" do

    html = <<-HTML
      Test some text with br <br>, <br >, <br/>, and <br />
    HTML
    
    new_html = WritepubEditor.enforce_rules_on(html).strip
    new_html.should == "Test some text with br <br />, <br />, <br />, and <br />"
    
  end
  
end