require 'spec_helper'

describe '<a>' do
  
  it "removes all attributes except href" do
    
    html = <<-HTML
      Test some text with <a href="http://www.google.com" style="width:100px;font-weight:bold;" onclick="sdfsdsfsd">link</a>
    HTML
    
    new_html = WritepubEditor::Base.new(html).to_s
    new_html.should include('<a href="http://www.google.com">link</a>')
    
  end
  
  it "allows ftp" do
    
    html = <<-HTML
      Test some text with <a href="ftp://www.google.com" style="width:100px;font-weight:bold;" onclick="sdfsdsfsd">link</a>
    HTML
    
    new_html = WritepubEditor::Base.new(html).to_s
    new_html.should include('Test some text with <a href="ftp://www.google.com">link</a>')
    
  end
  
  it "allows http" do
    
    html = <<-HTML
      Test some text with <a href="http://www.google.com" style="width:100px;font-weight:bold;" onclick="sdfsdsfsd">link</a>
    HTML
    
    new_html = WritepubEditor::Base.new(html).to_s
    new_html.should include('Test some text with <a href="http://www.google.com">link</a>')
    
  end
  
  it "allows https" do
    
    html = <<-HTML
      Test some text with <a href="https://www.google.com" style="width:100px;font-weight:bold;" onclick="sdfsdsfsd">link</a>
    HTML
    
    new_html = WritepubEditor::Base.new(html).to_s
    new_html.should include('Test some text with <a href="https://www.google.com">link</a>')
    
  end
  
  it "only allows href to start with 'http' or 'ftp', otherwise it removes link" do
    
    html = <<-HTML
      Test some text with <a href="javascript:alert('hi');" style="width:100px;font-weight:bold;" onclick="sdfsdsfsd">link</a>
    HTML
    
    new_html = WritepubEditor::Base.new(html).to_s
    new_html.should include('Test some text with link')
    
  end
  
  it "removes node if empty" do
    
    html = <<-HTML
      Test some text with <a href="http://www.google.com" style="width:100px;font-weight:bold;" onclick="sdfsdsfsd">  </a>
    HTML
    
    new_html = WritepubEditor::Base.new(html).to_s
    new_html.should == 'Test some text with'
    
  end
  
end