require 'spec_helper'

describe '<br>' do
  
  it "<br> -> <br />" do
    WritepubEditor::Preprocessing::Br.process("<br>").should == "<br />"
  end

  it "<br > -> <br  />" do
    WritepubEditor::Preprocessing::Br.process("<br >").should == "<br  />"
  end

  it "<br/> -> <br/>" do
    WritepubEditor::Preprocessing::Br.process("<br/>").should == "<br/>"
  end

  it "<br /> -> <br />" do
    WritepubEditor::Preprocessing::Br.process("<br />").should == "<br />"
  end
  
end