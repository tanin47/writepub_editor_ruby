module WritepubEditor
  module WritepubTag
    
    class A < Base
      
      def is_match
        @node.name.downcase == "a"
      end
     
      def transform
        
        return if remove_node_if_empty?
        
        @node.name = "a"
        @node.remove_all_attributes(:href)
        
        href = @node.get_attribute("href")
        
        if href.match(/^(https?|ftp)/i) == nil
          @node.extract_inside_out
          @node.remove
        end
        
      end
    end
    
  end
end