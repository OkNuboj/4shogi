module Show
    def self.show(koma, board, turn, player)
        #局数表示
        print "\e[1m#{turn}局目: "
        if player == 1
            print "\e[31m先手\e[0m (\e[31m▼先手\e[0m/\e[36m▲後手\e[0m)\n"
        elsif player == 2
            print "\e[36m後手\e[0m (\e[31m▼先手\e[0m/\e[36m▲後手\e[0m)\n"
        end
        
        puts "────────────────────"
        for i in 0..9
            for j in 0..10
                if koma[board[i][j]][:owner] == 1
                    print "\e[31m#{koma[board[i][j]][:role1]}\e[0m"
                elsif koma[board[i][j]][:owner] == 2
                    print "\e[36m#{koma[board[i][j]][:role1]}\e[0m"
                else
                    print "#{koma[board[i][j]][:role1]}"
                end
            end
            print "\n"
        end
        puts "────────────────────"
    end
end