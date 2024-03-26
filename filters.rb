# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program

# Find candidate by ID
def find(id)
  @candidates.each do |candidate|
    if candidate[:id] == id
      return candidate
    end
  end
  nil
end

# Returns true if the candidate has 2 years of experience or more, returns false otherwise
def experienced?(candidate)
  candidate[:years_of_experience] >= 2
end

# Returns a subset of the candidates that are experienced, have 100 or more Github points, know at least Ruby or Python, applied in the last 15 days, are over the age of 17 (18+)
def qualified_candidates(candidates)
  qualified_candidates = []
  candidates.each do |candidate|
    if experienced?(candidate) && enough_points?(candidate) && ruby_or_python?(candidate) && recently_applied?(candidate) && age_18_plus?(candidate)
      qualified_candidates.push(candidate)
    end
  end
  qualified_candidates
end

# Returns true if the candidate has 100 github points or more, returns false otherwise
def enough_points?(candidate)
  candidate[:github_points] >= 100
end

# Returns true if the candidate knows at least Ruby or Python, returns false otherwise
def ruby_or_python?(candidate)
  candidate[:languages].include?('Ruby') || candidate[:languages].include?('Python')
end

# Returns true if the candidate applied in the last 15 days, returns false otherwise
def recently_applied?(candidate)
  (Date.today - candidate[:date_applied]).to_i <= 15
end

# Returns true if the candidate is over the age of 17 (18+), returns false otherwise
def age_18_plus?(candidate)
  candidate[:age] > 17
end

# Sort candidates by years of experience in descending order
# If years of experience are the same, sort by github points in descending order
def ordered_by_qualifications(candidates)
 candidates.sort_by { |candidate| [-candidate[:years_of_experience], -candidate[:github_points]] }
end