require 'nokogiri'
require File.expand_path("../writepub_tag", __FILE__)

module WritepubEditor
  include WritepubTag

  @rules = [WritepubTag::SpanBold]
  
  def text(html)
    
  end
  
  def enforce_rules(html)
    
    html = "<root>#{html}</root>"

    doc = Nokogiri::XML(html) { |config| 
      config.strict 
    }
    
    traverse(doc.root)

    return doc.root.inner_html
    
  end
  
  def traverse(node)
    
    transformed = false
    @rules.each { |tag|  
      next if !tag.is_match(node)
      
      tag.transform(node)
      transformed = true
    }
    
    node.children.each { |c|
      traverse(c)
    }
  end
  
  extend self
end