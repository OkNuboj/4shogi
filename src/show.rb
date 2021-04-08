module Show
    def self.show(koma, board, turn, player)
        #局数表示
        print "\e[1m#{turn}局目: "
        if player == 1
            print "\e[42m北局\e[0m ( \e[42m▼北局\e[0m / \e[7m◀東局\e[0m / \e[41m▲南局\e[0m / \e[44m▶西局\e[0m )\n"
        elsif player == 2
            print "\e[41m南局\e[0m ( \e[42m▼北局\e[0m / \e[7m◀東局\e[0m / \e[41m▲南局\e[0m / \e[44m▶西局\e[0m )\n"
        end
        
        puts "────────────────────────────────┐"
        for i in 0..15
            for j in 0..16
                if koma[board[i][j]][:owner] == 1
                    print "\e[42m#{koma[board[i][j]][:role1]}\e[0m" #ミドリ
                elsif koma[board[i][j]][:owner] == 2
                    print "\e[7m#{koma[board[i][j]][:role1]}\e[0m" #シロ
                elsif koma[board[i][j]][:owner] == 3
                    print "\e[41m#{koma[board[i][j]][:role1]}\e[0m" #アカ
                elsif koma[board[i][j]][:owner] == 4
                    print "\e[44m#{koma[board[i][j]][:role1]}\e[0m" #アオ
                else
                    print "#{koma[board[i][j]][:role1]}"
                end
            end
            print "\n"
        end
        puts "────────────────────────────────┘"
    end
end