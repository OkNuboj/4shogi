=begin
四皇将棋
Created at 2021/4/1
Created by Fukai Satoshi
=end
=begin
require_relative "koma"
require_relative "fu"
require_relative "kyo"
require_relative "kei"
require_relative "gin"
require_relative "kin"
require_relative "hi"
require_relative "kaku"
require_relative "tokin"
require_relative "nkyo"
require_relative "nkei"
require_relative "ngin"
require_relative "ryu"
require_relative "uma"
=end

winner = 0
turn = 1
while 1
    winner = 1
    break if  winner != 0
    turn += 1
end

if winner == 1
    puts "先手が勝利しました"
else
    puts "後手が勝利しました"
end