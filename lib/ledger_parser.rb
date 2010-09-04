module LedgerParser 
  def self.parse(file)
    while (line = file.gets)
      case line
      when /^\d/ # Starts with a number so it's the start of an entry
        entry = Entry.new
        end_of_date = line =~ / /
        entry.date = line[0...end_of_date]
        rest_of_line = line[end_of_date..line.length].chomp
        mycorpMatch = /^\s+([*!])/.match(rest_of_line)
        mycorp = mycorpMatch.nil? ? " " : mycorpMatch[1]
        entry.corp = case mycorp
          when "!": "p"
          when "*": "c"
          else      " "
        end
        start_of_desc = /^[ *!]*/.match(rest_of_line)[0].length
        entry.description = rest_of_line[start_of_desc..line.length]
      when /^\s+./
        transaction = entry.transactions.build
        line.sub!(/^\s+/, "")
        to_dollar = line =~ /$/
        transaction.account = line[/^[^\-\$]*/].sub(/\s+$/, "")
        transaction.amount = line[/[\-\$].+/]
      else
        entry.save
      end
    end
  end
end