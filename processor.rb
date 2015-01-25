class BatchItemProcessor
  def initialize
    @array=[]
    #@id=[]
  end

  def process_items(enum)
    @newarr=[]
    for g in enum
      if !(@array.include?g)
        @newarr<<yield(g)
        @array<<g
      end
    end
    @newarr
  end

  def processed_items
    @array
  end

  def identify(call)
    @id=call
  end

  def should_process?(item)
    !@array.include(item)
  end


  def reset
    #@id=[]
    @array=[]
    @newarr=[]
  end

end

sample=BatchItemProcessor.new

processor = BatchItemProcessor.new
#puts [1,2,3].process_items {|e| e+1}
#puts [3,4,5].process_items([4,5,6]) {|e| e+1}
#puts sample.process_items([8,9,10]) {|e| e+1}

puts processor.process_items([1,2,3,4]) {|item| item}
puts '------------'
puts processor.process_items([3,4,5,6]) {|item| item}

processor.reset
puts '------------'
puts processor.process_items([{'id' => 1}, {'id' => 1, 'name' => 'example'}]) {|item| item}

processor.reset
processor.identify('id')
puts '------------'
puts processor.process_items([{'id' => 1}, {'id' => 1, 'name' => 'example'}, {'id' => 2}]) {|item| item}
