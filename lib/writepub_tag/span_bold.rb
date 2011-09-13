module WritepubTag
  class SpanBold < Base
    
    def self.is_match(node)
      node.name.downcase == "span" \
      && node.has_attribute?("style") \
      && node.get_attribute("style").downcase.match(/font\-weight/) != nil
    end
   
    def self.transform(node)
      node.name = "b"
      node.remove_attribute("style")
    end
  end
end