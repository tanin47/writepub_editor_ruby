module WritepubEditor
  module WritepubTag
    
    class SpanBold < Base
      
      def is_match
        @node.name.downcase == "span" \
        && @node.has_attribute?("style") \
        && @node.get_attribute("style").downcase.match(/font\-weight/i) != nil
      end
     
      def transform
        @node.name = "b"
        @node.remove_all_attributes
      end
    end
    
  end
end