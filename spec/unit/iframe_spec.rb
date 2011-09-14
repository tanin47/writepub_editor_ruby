require 'spec_helper'

describe '<iframe>' do
  
  it "fixes attributes with no quotes" do
    
    html = '<iframe style="xccc" onclick="yyyyy" height=390 src="http://www.youtube.com/embed/1Q0UQaKeMuQ" frameBorder=0 width=480></iframe>'
    
    WritepubEditor::Preprocessing::Iframe.process(html).should == '<iframe style="xccc" onclick="yyyyy" height="390" src="http://www.youtube.com/embed/1Q0UQaKeMuQ" frameBorder="0" width="480"></iframe>'
  end

  it "fixes attributes with single quotes" do
    
    html = '<iframe style="xccc" onclick="yyyyy" height=\'390\' src="http://www.youtube.com/embed/1Q0UQaKeMuQ" frameBorder=\'0\' width=\'480\'></iframe>'
    
    WritepubEditor::Preprocessing::Iframe.process(html).should == '<iframe style="xccc" onclick="yyyyy" height="390" src="http://www.youtube.com/embed/1Q0UQaKeMuQ" frameBorder="0" width="480"></iframe>'
  end
  
  it "fixes no-value attributes" do
    
    html = '<iframe allowfullscreen dosomething></iframe>'
    WritepubEditor::Preprocessing::Iframe.process(html).should == '<iframe allowfullscreen="" dosomething=""></iframe>'
    
  end
  
  it "solves combination correctly" do
    
    html = '<iframe allowfullscreen height=390 dosomething width=\'200\'></iframe>'
    WritepubEditor::Preprocessing::Iframe.process(html).should == '<iframe allowfullscreen="" height="390" dosomething="" width="200"></iframe>'
    
  end

end