# Basic regex in Ruby
# Source: http://ruby-doc.com/docs/ProgrammingRuby/html/intro.html

# A regular expression is a pattern enclosed in two forward slashes:
# /     /

# Here is a basic expression that will match Perl or (|) Python
# /Perl|Python/ 

# You can use parens in a regex expression, so the same expression could be rewritten as:
# /P(erl|ython)/


# Repetition:
# /ab+c/ means to match: a, then one or more instances of b, then c
# /ab*c/ means to match: a, then zero or more instances of b, then c


# Matching a regular expression
# In Ruby we use the =~ operator:

languages = ['Ruby', 'Perl', 'Python', 'Swift']
for language in languages
    if language =~ /Perl|Python/
    puts "Language mentioned: #{language}"
    end
end

