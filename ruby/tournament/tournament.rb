class Tournament
    class << self

        def tally(input)
            @matches = input ? input.split(/\n/) : nil
            generate_results
        end

        def header
            "Team                           | MP |  W |  D |  L |  P"
        end

        def generate_line(match)
            "#{match[0]}            |  1 |  #{match.count('win')} |  #{match.count('draw')} |  #{match.count('loss')} |  #{MATCH_POINTS[match[2].to_sym]}\n"
        end

        def generate_results
            <<~RESULT
                #{header}
            RESULT
        end



        # def generate_results
        #     return header unless @matches
        #     <<~RESULT
        #         #{header}
        #         #{generate_team(@matches[0])}
        #     RESULT
        # end

        # def generate_team(match)
        #     "#{match[0]}            |  1 |  #{match.count('win')} |  #{match.count('draw')} |  #{match.count('loss')} |  #{MATCH_POINTS[match[2]]}"
        # end

        MATCH_POINTS = {
            win: 3,
            draw: 1,
            loss: 0
        }
    end
end

# # Allegoric Alaskans;Blithering Badgers;win



# Team                           | MP |  W |  D |  L |  P
# Devastating Donkeys            |  3 |  2 |  1 |  0 |  7
# Allegoric Alaskans             |  3 |  2 |  0 |  1 |  6
# Blithering Badgers             |  3 |  1 |  0 |  2 |  3
# Courageous Californians        |  3 |  0 |  1 |  2 |  1


# def create_table(data)
#     # Calcula o comprimento de cada coluna
#     column_lengths = data.transpose.map { |column| column.map(&:to_s).max_by(&:length).length }
  
#     # Formata a primeira linha da tabela (cabeçalho)
#     header = data[0].zip(column_lengths).map { |value, length| value.to_s.ljust(length) }.join(" | ")
  
#     # Formata as linhas de dados
#     rows = data[1..-1].map do |row|
#       row.zip(column_lengths).map { |value, length| value.to_s.ljust(length) }.join(" | ")
#     end
  
#     # Une o cabeçalho e as linhas de dados com uma linha horizontal
#     table = [header, "-" * header.length] + rows
  
#     # Retorna a tabela como uma string
#     table.join("\n")
#   end



# # # Win = 3 0
# # # Draw = 1 1
# # # Los = 0 3
