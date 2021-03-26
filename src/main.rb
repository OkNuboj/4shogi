=begin
四皇将棋
Created at 2021/4/1
Created by Fukai Satoshi

歩:10n 香:20n 圭:30n 銀:40n 金:50n 飛:60n 角:70n
王:80n 玉:81n
=end

class Koma
    attr_accessor :koma
end

fu = Array.new(18).map{Koma.new}
for i in 0..17
    fu[i].koma = {role1: "歩", role2: "と", place: [i/9+1, i+1], id: 101+i, owner: i/9+1}
end

kin = Array.new(4).map{Koma.new}
gin = Array.new(4).map{Koma.new}
kei = Array.new(4).map{Koma.new}
kyo = Array.new(4).map{Koma.new}
for i in 0..3
    kin[i].koma = {role1: "金", role2: 0, place: [1+(i/2)*8, 4+i%2*2], id: 501+i, owner: i/2+1}
    gin[i].koma = {role1: "銀", role2: "全", place: [1+(i/2)*8, 3+i%2*4], id: 401+i, owner: i/2+1}
    kei[i].koma = {role1: "桂", role2: "圭", place: [1+(i/2)*8, 2+i%2*6], id: 301+i, owner: i/2+1}
    kyo[i].koma = {role1: "香", role2: "杏", place: [1+(i/2)*8, 1+i%2*8], id: 201+i, owner: i/2+1}
end

oh = Array.new(2).map{Koma.new}
hi = Array.new(2).map{Koma.new}
kaku = Array.new(2).map{Koma.new}
for i in 0..1
    oh[i].koma = {role1: "王", role2: 0, place: [1+(i/2)*8, 5], id: 801+i, owner: i/2+1}
    hi[i].koma = {role1: "飛", role2: "龍", place: [2+(i/2)*6, 2+i%2*6], id: 601+i, owner: i/2+1}
    kaku[i].koma = {role1: "角", role2: "馬", place: [2+(i/2)*6, 8-i%2*6], id: 701+i, owner: i/2+1}
end

board = [
    ["　", "　", "　", "　", "　", "　", "　", "　", "　"], 
    ["　", "　", "　", "　", "　", "　", "　", "　", "　"], 
    ["　", "　", "　", "　", "　", "　", "　", "　", "　"], 
    ["　", "　", "　", "　", "　", "　", "　", "　", "　"], 
    ["　", "　", "　", "　", "　", "　", "　", "　", "　"], 
    ["　", "　", "　", "　", "　", "　", "　", "　", "　"], 
    ["　", "　", "　", "　", "　", "　", "　", "　", "　"], 
    ["　", "　", "　", "　", "　", "　", "　", "　", "　"], 
    ["　", "　", "　", "　", "　", "　", "　", "　", "　"]
]

=begin
winner = 0
turn = 1
while 1
    break if  winner != 0
    turn += 1
end

if winner == 1
    puts "先手が勝利しました"
else
    puts "後手が勝利しました"
end
=end