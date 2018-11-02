class LRUCache
    attr_reader :cache

    def initialize(num)
      @num = num
      @cache = []
    end

    def count
      # returns number of elements currently in cache
      @cache.length
    end

    def add(el)
      # adds element to cache according to LRU principle
      if @cache.include?(el)
        @cache.delete(el)
        @cache.push(el)
      elsif count >= @size
        @cache.shift
        @cache.push(el)
      else
        @cache.push(el)
      end
    end

    def show
      # shows the items in the cache, with the LRU item first
      @cache
    end

    private
    # helper methods go here!

  end
