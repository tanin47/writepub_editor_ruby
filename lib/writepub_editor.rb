require 'nokogiri'
Dir[File.expand_path("../nokogiri/**/*.rb", __FILE__)].each {|f| require f}
require File.expand_path("../writepub_tag", __FILE__)

module WritepubEditor
  include WritepubTag
  
  @preprocessing_rules = [Preprocessing::Br,
                          Preprocessing::Img,
                          Preprocessing::Iframe
                          ]

  @tranformations = [ WritepubTag::A,
                      WritepubTag::B,
                      WritepubTag::Br,
                      WritepubTag::Em,
                      WritepubTag::I,
                      WritepubTag::Img,
                      WritepubTag::P,
                      WritepubTag::Root,
                      WritepubTag::SpanBold,
                      WritepubTag::SpanItalic,
                      WritepubTag::Strong,
                      WritepubTag::Youtube,
                      ]
  
  def text(html)
    
  end
  
  def enforce_rules_on(html)
    
    html = "<root>#{html}</root>"
    
    @preprocessing_rules.each { |tag|
      html = tag.process(html)
    }
    
    doc = Nokogiri::XML( html ) { |config| 
      config.strict
    }
    
    traverse(doc.root)

    return doc.root.to_xhtml(:indent=>0,:encoding=>"UTF-8").sub(/^<root>/,"").sub(/<\/root>$/,"").strip
    
  end
  
  def traverse(node)
    
    children = node.children # get it first, because node might be deleted
    
    transformed = false
    @tranformations.each { |tag|  
      t = tag.new(node)
      
      next if !t.is_match
      t.transform
      
      transformed = true
    }
    
    if transformed == false \
        and node.instance_of?(Nokogiri::XML::Element)
      
      node.extract_inside_out
      node.remove
    end
    
    children.each { |c|
      traverse(c)
    }
  end
  
  extend self
end