require 'spec_helper'

describe '<b>' do
  
  it "removes all attributes except href" do
    
    html = <<-HTML
      Test some text with <a href="http://www.google.com" style="width:100px;font-weight:bold;" onclick="sdfsdsfsd">link</a>
    HTML
    
    new_html = WritepubEditor.enforce_rules_on(html)
    new_html.should include('<a href="http://www.google.com">link</a>')
    
  end
  
  it "allows ftp" do
    
    html = <<-HTML
      Test some text with <a href="ftp://www.google.com" style="width:100px;font-weight:bold;" onclick="sdfsdsfsd">link</a>
    HTML
    
    new_html = WritepubEditor.enforce_rules_on(html)
    new_html.should include('Test some text with <a href="ftp://www.google.com">link</a>')
    
  end
  
  it "allows http" do
    
    html = <<-HTML
      Test some text with <a href="http://www.google.com" style="width:100px;font-weight:bold;" onclick="sdfsdsfsd">link</a>
    HTML
    
    new_html = WritepubEditor.enforce_rules_on(html)
    new_html.should include('Test some text with <a href="http://www.google.com">link</a>')
    
  end
  
  it "allows https" do
    
    html = <<-HTML
      Test some text with <a href="https://www.google.com" style="width:100px;font-weight:bold;" onclick="sdfsdsfsd">link</a>
    HTML
    
    new_html = WritepubEditor.enforce_rules_on(html)
    new_html.should include('Test some text with <a href="https://www.google.com">link</a>')
    
  end
  
  it "only allows href to start with 'http' or 'ftp', otherwise it removes link" do
    
    html = <<-HTML
      Test some text with <a href="javascript:alert('hi');" style="width:100px;font-weight:bold;" onclick="sdfsdsfsd">link</a>
    HTML
    
    new_html = WritepubEditor.enforce_rules_on(html)
    new_html.should include('Test some text with link')
    
  end
  
end