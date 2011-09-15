require 'spec_helper'

describe '<br>' do
  
  it "<br> -> <br />" do
    WritepubEditor::Preprocessing::Br.process("<br><br>").should == "<br /><br />"
  end

  it "<br > -> <br  />" do
    WritepubEditor::Preprocessing::Br.process("<br ><br >").should == "<br  /><br  />"
  end

  it "<br/> -> <br/>" do
    WritepubEditor::Preprocessing::Br.process("<br/><br/>").should == "<br/><br/>"
  end

  it "<br /> -> <br />" do
    WritepubEditor::Preprocessing::Br.process("<br /><br />").should == "<br /><br />"
  end
  
end