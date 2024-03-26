# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program

require 'active_support/all'

# Find candidate by ID
def find(id)
  @candidates.each do |candidate|
    if candidate[:id] == id
      return candidate
    end
  end
  return nil
end

# Returns true if the candidate has 2 years of experience or more, returns false otherwise
def experienced?(candidate)
  return candidate[:years_of_experience] >= 2
end

def qualified_candidates(candidates)
  # Your code Here
end
  
# More methods will go below