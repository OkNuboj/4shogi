=begin
四皇将棋
Created at 2021/4/1
Created by Fukai Satoshi
=end

require_relative "koma"
require_relative 'hi'
require_relative "kyo"
require_relative "kei"
require_relative "gin"
require_relative "kin"
require_relative "fu"
require_relative "kaku"
require_relative "oh"

board = [
    [0, 0, 0, 0, 0, 0, 0, 0, 0], 
    [0, 0, 0, 0, 0, 0, 0, 0, 0], 
    [0, 0, 0, 0, 0, 0, 0, 0, 0], 
    [0, 0, 0, 0, 0, 0, 0, 0, 0], 
    [0, 0, 0, 0, 0, 0, 0, 0, 0], 
    [0, 0, 0, 0, 0, 0, 0, 0, 0], 
    [0, 0, 0, 0, 0, 0, 0, 0, 0], 
    [0, 0, 0, 0, 0, 0, 0, 0, 0], 
    [0, 0, 0, 0, 0, 0, 0, 0, 0]
]

puts Hi1.content, Hi2.naricon, Hi1.id, Hi2.place, Hi1.owner

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