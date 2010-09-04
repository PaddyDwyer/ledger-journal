module LedgerParser 
  def self.parse(file)
    while (line = file.gets)
      case line
      when /^\d/ # Starts with a number so it's the start of an entry
        entry = Entry.new
        end_of_date = line =~ / /
        entry.date = line[0...end_of_date]
        rest_of_line = line[end_of_date..line.length].chomp
        mycorp = /^\s+([*!])/.match(rest_of_line)[1]
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
        Rails.logger.debug "line #{line}"
        to_dollar = line =~ /$/
        transaction.account = line[/^[^\-\$]*/].sub(/\s+$/, "")
        Rails.logger.debug "account #{transaction.account}&"
        transaction.amount = line[/[\-\$].+/]
        Rails.logger.debug "amount #{transaction.amount}&"
      else
        entry.save
      end
    end
  end
end