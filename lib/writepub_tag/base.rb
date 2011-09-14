module WritepubEditor
  module WritepubTag
    class Base
      
      def initialize(node)
        @node = node
      end
      
      def is_match
        raise 'Not implemented'
      end
      
      def transform
        raise 'Not implemented'
      end
      
    end
  end
end