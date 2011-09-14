require 'spec_helper'

describe 'Other' do
  
  it "removes unknown tags" do
     
    html = <<-HTML
      Test some text with <h1>Header</h1>
      <script>
        alert('test');
      </script>
      <div>something</div>
      
    HTML
    
    new_html = WritepubEditor.enforce_rules_on(html)
    new_html.should_not include("<h1>")
    new_html.should_not include("<script>")
    new_html.should_not include("<div>")
    
    new_html.should_not include("</h1>")
    new_html.should_not include("</script>")
    new_html.should_not include("</div>")
    
    new_html.should include("Header")
    new_html.should include("alert('test');")
    new_html.should include("something")
    
  end
  
end