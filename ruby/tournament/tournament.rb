class Tournament
    class << self

        def tally(input)
            return header if input.strip.empty?
          
            team_stats = initialize_team_stats
            process_matches(input, team_stats)
            sorted_stats = team_stats.sort_by { |team, stats| [-stats[:points], team] }.to_h
          
            build_table(sorted_stats)
        end

        private

        def header
            generate_line("Team", "MP", "W", "D", "L", "P")
        end

        def generate_line(team, mp, w, d, l, p)
            "#{team.ljust(30)} | #{mp.to_s.rjust(2)} | #{w.to_s.rjust(2)} | #{d.to_s.rjust(2)} | #{l.to_s.rjust(2)} | #{p.to_s.rjust(2)}\n"
        end

        def initialize_team_stats
            Hash.new { |hash, key| hash[key] = { MP: 0, win: 0, draw: 0, loss: 0, points: 0 } }
        end

        def process_matches(input, team_stats)
            input.each_line do |line|
                teamA, teamB, result = line.strip.split(';')
                result_teamA = result.to_sym
                result_teamB = nil
            
                case result
                when 'win'
                    result_teamB = :loss
                when 'loss'
                    result_teamB = :win
                when 'draw'
                    result_teamB = :draw
                end
            
                update_stats(team_stats, teamA, MATCH_POINTS[result_teamA], result_teamA)
                update_stats(team_stats, teamB, MATCH_POINTS[result_teamB], result_teamB)
            end
        end

        def update_stats(stats, team, points, result)
            stats[team] ||= { MP: 0, win: 0, draw: 0, loss: 0, points: 0}
            stats[team][:MP] += 1
            stats[team][result] += 1
            stats[team][:points] += points
        end
          
        def build_table(team_stats)
            stats_result = header
            team_stats.each do |team, stats|
                stats_result += generate_line(team, stats[:MP], stats[:win], stats[:draw], stats[:loss], stats[:points])
            end
            stats_result
        end

        MATCH_POINTS = {
            win: 3,
            draw: 1,
            loss: 0
        }
    end
end
