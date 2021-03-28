module Show
    def self.show(koma, board)
        puts "────────────────────"
        for i in 0..9
            for j in 0..9
                if koma[board[i][j]].con[:owner] == 1
                    print "\e[31m#{koma[board[i][j]].con[:role1]}\e[0m"
                elsif koma[board[i][j]].con[:owner] == 2
                    print "\e[36m#{koma[board[i][j]].con[:role1]}\e[0m"
                else
                    print "#{koma[board[i][j]].con[:role1]}"
                end
            end
            print "\n"
        end
        puts "────────────────────"
    end
end