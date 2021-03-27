=begin
四皇将棋
Created at 2021/4/1
Created by Fukai Satoshi

歩:10n 香:20n 圭:30n 銀:40n 金:50n 飛:60n 角:70n
王:80n 玉:81n
=end

class Koma
    attr_accessor :con
end
koma = Array.new(1000).map{Koma.new}
koma[0].con = {role1: "　", id: 0, owner: 0}
koma[1].con = {role1: "１", id: 1, owner: 0}
koma[2].con = {role1: "２", id: 2, owner: 0}
koma[3].con = {role1: "３", id: 3, owner: 0}
koma[4].con = {role1: "４", id: 4, owner: 0}
koma[5].con = {role1: "５", id: 5, owner: 0}
koma[6].con = {role1: "６", id: 6, owner: 0}
koma[7].con = {role1: "７", id: 7, owner: 0}
koma[8].con = {role1: "８", id: 8, owner: 0}
koma[9].con = {role1: "９", id: 9, owner: 0}
for i in 0..17
    koma[101+i].con = {role1: "歩", role2: "と", place: [i/9*8+1, i%9+1], id: 101+i, owner: i/9+1}
end
for i in 0..3
    koma[501+i].con = {role1: "金", role2: 0, place: [1+(i/2)*8, 4+i%2*2], id: 501+i, owner: i/2+1}
    koma[401+i].con = {role1: "銀", role2: "全", place: [1+(i/2)*8, 3+i%2*4], id: 401+i, owner: i/2+1}
    koma[301+i].con = {role1: "桂", role2: "圭", place: [1+(i/2)*8, 2+i%2*6], id: 301+i, owner: i/2+1}
    koma[201+i].con = {role1: "香", role2: "杏", place: [1+(i/2)*8, 1+i%2*8], id: 201+i, owner: i/2+1}
end
for i in 0..1
    koma[801+i].con = {role1: "王", role2: 0, place: [1+i*8, 5], id: 801+i, owner: i+1}
    koma[601+i].con = {role1: "飛", role2: "龍", place: [2+i*6, 2+i%2*6], id: 601+i, owner: i+1}
    koma[701+i].con = {role1: "角", role2: "馬", place: [2+i*6, 8-i%2*6], id: 701+i, owner: i+1}
end

board = [
    [0, 1, 2, 3, 4, 5, 6, 7, 8, 9],
    [1, 201, 301, 401, 501, 801, 502, 402, 302, 202], 
    [2, 0, 601, 0, 0, 0, 0, 0, 701, 0], 
    [3, 101, 102, 103, 104, 105, 106, 107, 108, 109], 
    [4, 0, 0, 0, 0, 0, 0, 0, 0, 0], 
    [5, 0, 0, 0, 0, 0, 0, 0, 0, 0], 
    [6, 0, 0, 0, 0, 0, 0, 0, 0, 0], 
    [7, 110, 111, 112, 113, 114, 115, 116, 117, 118], 
    [8, 0, 702, 0, 0, 0, 0, 0, 602, 0], 
    [9, 203, 303, 403, 503, 802, 504, 404, 304, 204]
]

=begin
winner = 0
turn = 1
while 1
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
    break if  winner != 0
    turn += 1
end

if winner == 1
    puts "先手が勝利しました"
else
    puts "後手が勝利しました"
end
=end