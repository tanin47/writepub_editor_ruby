require 'spec_helper'

describe '<iframe> youtube' do
  
  it "removes all other attributes" do
    
    html = <<-HTML
      Test some text with rrrrrrrr<IFRAME style="xccc" onclick="yyyyy" height=390 src="http://www.youtube.com/embed/1Q0UQaKeMuQ" frameBorder=0 width=480 allowfullscreen></IFRAME> easdgwewgweg
    HTML
    
    new_html = WritepubEditor::Base.new(html).to_s
    new_html.should include('http://www.youtube.com/embed/1Q0UQaKeMuQ')
    new_html.should include('<iframe')
    
    
  end
  
  it "does not process if src is not from youtube.com" do
    
    html = <<-HTML
      Test some text with rrrrrrrr<IFRAME style="xccc" onclick="yyyyy" height=390 src="http://www.google.com/embed/1Q0UQaKeMuQ" frameBorder=0 width=480 allowfullscreen></IFRAME> easdgwewgweg
    HTML
    
    new_html = WritepubEditor::Base.new(html).to_s
    new_html.should == 'Test some text with rrrrrrrr easdgwewgweg'
    
  end
  
end