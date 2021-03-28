=begin
四皇将棋
Created at 2021/4/1
Created by Fukai Satoshi

歩:10n 香:20n 圭:30n 銀:40n 金:50n 飛:60n 角:70n
王:80n 玉:81n
=end
require_relative "judge"
require_relative "show"

class Koma
    attr_accessor :con
end
motiA = Array.new(40).map{Koma.new}
motiB = Array.new(40).map{Koma.new}
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
koma[11].con = {role1: "一", id: 11, owner: 0}
koma[12].con = {role1: "二", id: 12, owner: 0}
koma[13].con = {role1: "三", id: 13, owner: 0}
koma[14].con = {role1: "四", id: 14, owner: 0}
koma[15].con = {role1: "五", id: 15, owner: 0}
koma[16].con = {role1: "六", id: 16, owner: 0}
koma[17].con = {role1: "七", id: 17, owner: 0}
koma[18].con = {role1: "八", id: 18, owner: 0}
koma[19].con = {role1: "九", id: 19, owner: 0}
for i in 0..17
    koma[101+i].con = {role1: "歩", role2: "と", nari: 0, place: [i/9*4+3, i%9+1], id: 101+i, owner: i/9+1}
end
for i in 0..3
    koma[501+i].con = {role1: "金", role2: 0, nari: 0, place: [1+(i/2)*8, 4+i%2*2], id: 501+i, owner: i/2+1}
    koma[401+i].con = {role1: "銀", role2: "全", nari: 0, place: [1+(i/2)*8, 3+i%2*4], id: 401+i, owner: i/2+1}
    koma[301+i].con = {role1: "桂", role2: "圭", nari: 0, place: [1+(i/2)*8, 2+i%2*6], id: 301+i, owner: i/2+1}
    koma[201+i].con = {role1: "香", role2: "杏", nari: 0, place: [1+(i/2)*8, 1+i%2*8], id: 201+i, owner: i/2+1}
end
for i in 0..1
    koma[801+i].con = {role1: "王", role2: 0, nari: 0, place: [1+i*8, 5], id: 801+i, owner: i+1}
    koma[601+i].con = {role1: "飛", role2: "龍", nari: 0, place: [2+i*6, 2+i%2*6], id: 601+i, owner: i+1}
    koma[701+i].con = {role1: "角", role2: "馬", nari: 0, place: [2+i*6, 8-i%2*6], id: 701+i, owner: i+1}
end

board = [
    [0, 11, 12, 13, 14, 15, 16, 17, 18, 19],
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

winner = 0
turn = 2
while 1
    print "#{turn/2}局目"
    if turn%2 == 0
        print " - 先手\n"
    else
        print " - 後手\n"
    end
    Show.show(koma, board)
    print "先手持ち駒: "
    i = 0
    while motiA[i].con != nil
        print "#{motiA[i].con[:role1]} "
        i+=1
    end
    print "\n後手持ち駒: "
    i = 0
    while motiB[i].con != nil
        print "#{motiB[i].con[:role1]} "
        i+=1
    end
    print "\n\n"
#-----------------------------------------------------------------
    #合法手チェック
    print "移動する駒の座標を入力 ⇒  "
    chA = gets.split(' ')
    print "移動先の座標を入力 ⇒  "
    chB = gets.split(' ')
    for i in 0..1
        chA[i] = chA[i].to_i
        chB[i] = chB[i].to_i
    end
    koma[board[chA[0]][chA[1]]].con[:nari] = 1
    judge = Judge::Judg.ment(koma[board[chA[0]][chA[1]]].con, chB)
    puts judge
    winner = gets.chomp.to_i
    break if  winner != 0
    turn += 1
    puts "\e[H\e[2J"
end

if winner == 1
    puts "先手が勝利しました"
else
    puts "後手が勝利しました"
end