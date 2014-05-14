module FunWithStrings
  def palindrome?
    test = self.gsub(/\W/, "").downcase
    test == test.reverse
  end
  
  def get_words
      #moved downcase to usage point since we need to preserve case on anagram output
     self
        .gsub(/\'/,"")
        .split(/\b/)
        .reject {|x| x=~ /^\W+$/}
  end
  
  def count_words
      histogram = Hash.new(0)
        get_words.each do |word|
          # unless word =~ /^\W+$/
            histogram[word.downcase]+=1
          # end
        end
      return histogram
  end
  def anagram_groups
    get_words.group_by do |word| 
        word.downcase.chars.sort
    end
    .values
  end
end

# make all the above functions available as instance methods on Strings:

class String
  include FunWithStrings
end
