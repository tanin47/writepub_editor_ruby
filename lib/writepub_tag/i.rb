module WritepubEditor
  module WritepubTag
    
    class I < Base
      
      def is_match
        @node.name.downcase == "i"
      end
     
      def transform
        @node.name = "i"
        @node.remove_all_attributes
      end
    end
    
  end
end