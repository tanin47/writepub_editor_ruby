require 'spec_helper'

describe '<img>' do
  
  it "<img> -> <img />" do
    WritepubEditor::Preprocessing::Img.process('<img src="xxxx"><img src="xxxx">').should == '<img src="xxxx" /><img src="xxxx" />'
  end

  it "<img > -> <img  />" do
    WritepubEditor::Preprocessing::Img.process('<img src="xxxx" ><img src="xxxx" >').should == '<img src="xxxx"  /><img src="xxxx"  />'
  end

  it "<img/> -> <img/>" do
    WritepubEditor::Preprocessing::Img.process('<img src="xxxx"/><img src="xxxx"/>').should == '<img src="xxxx"/><img src="xxxx"/>'
  end

  it "<img /> -> <img />" do
    WritepubEditor::Preprocessing::Img.process('<img src="xxxx" /><img src="xxxx" />').should == '<img src="xxxx" /><img src="xxxx" />'
  end
  
end