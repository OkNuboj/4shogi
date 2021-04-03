=begin
四皇将棋
Created at 2021/4/1
Created by Fukai Satoshi

歩:10n 香:20n 圭:30n 銀:40n 金:50n 飛:60n 角:70n
王:80n 玉:81n
=end

require_relative "show"
require_relative "judge"

#駒
koma = Array.new(1000).map{0}

#持ち駒
moti = [
    [0], 
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], 
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
]
pow1 = 0; pow2 = 0; pow = [0, pow1, pow2]

#その他
winner = 0; player = 1; enemy = 2; turn = 1; tik = 1; nari = "a"

#空き駒、壁駒の初期設定
koma[0] = {role1: "　", id: 0, owner: 0}
koma[1] = {role1: "１", id: 1, owner: -1}
koma[2] = {role1: "２", id: 2, owner: -1}
koma[3] = {role1: "３", id: 3, owner: -1}
koma[4] = {role1: "４", id: 4, owner: -1}
koma[5] = {role1: "５", id: 5, owner: -1}
koma[6] = {role1: "６", id: 6, owner: -1}
koma[7] = {role1: "７", id: 7, owner: -1}
koma[8] = {role1: "８", id: 8, owner: -1}
koma[9] = {role1: "９", id: 9, owner: -1}
koma[10] = {role1: "〇", id: 10, owner: -1}
koma[11] = {role1: "一", id: 11, owner: -1}
koma[12] = {role1: "二", id: 12, owner: -1}
koma[13] = {role1: "三", id: 13, owner: -1}
koma[14] = {role1: "四", id: 14, owner: -1}
koma[15] = {role1: "五", id: 15, owner: -1}
koma[16] = {role1: "六", id: 16, owner: -1}
koma[17] = {role1: "七", id: 17, owner: -1}
koma[18] = {role1: "八", id: 18, owner: -1}
koma[19] = {role1: "九", id: 19, owner: -1}
koma[20] = {role1: "│", id: 19, owner: -1}

#駒の初期設定
for i in 0..17
    koma[101+i] = {role1: "歩", role2: "と", status: 1, place: [i/9*4+3, i%9+1], id: 101+i, owner: i/9+1}
end
for i in 0..3
    koma[201+i] = {role1: "香", role2: "杏", status: 1, place: [1+(i/2)*8, 1+i%2*8], id: 201+i, owner: i/2+1}
    koma[301+i] = {role1: "桂", role2: "圭", status: 1, place: [1+(i/2)*8, 2+i%2*6], id: 301+i, owner: i/2+1}
    koma[401+i] = {role1: "銀", role2: "全", status: 1, place: [1+(i/2)*8, 3+i%2*4], id: 401+i, owner: i/2+1}
    koma[501+i] = {role1: "金", status: 3, place: [1+(i/2)*8, 4+i%2*2], id: 501+i, owner: i/2+1}
end
for i in 0..1
    koma[601+i] = {role1: "飛", role2: "龍", status: 1, place: [2+i*6, 2+i%2*6], id: 601+i, owner: i+1}
    koma[701+i] = {role1: "角", role2: "馬", status: 1, place: [2+i*6, 8-i%2*6], id: 701+i, owner: i+1}
    koma[801+i] = {role1: "王", status: 3, place: [1+i*8, 5], id: 801+i, owner: i+1}
end

#将棋盤の初期設定
board = [
    [10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20], 
    [1, 201, 301, 401, 501, 801, 502, 402, 302, 202, 20], 
    [2, 0, 601, 0, 0, 0, 0, 0, 701, 0, 20], 
    [3, 101, 102, 103, 104, 105, 106, 107, 108, 109, 20], 
    [4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20], 
    [5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20], 
    [6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20], 
    [7, 110, 111, 112, 113, 114, 115, 116, 117, 118, 20], 
    [8, 0, 702, 0, 0, 0, 0, 0, 602, 0, 20], 
    [9, 203, 303, 403, 503, 802, 504, 404, 304, 204, 20]
]

#∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽

#対局開始
puts "\e[H\e[2J" #画面清掃
while 1
    hoge1 = 0; hoge2 = "a"; hoge3 = 0; hoge4 = 0; judge = 0

    #∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽
    #画面表示
    Show.show(koma, board, turn, player)

    #持ち駒表示
    print "11　先手持ち駒: "
    if moti[1][0] != 0
        if pow[1] > 1
            for i in 0..pow[1]-1
                print "#{i}:#{moti[1][i][:role1]} "
            end
            print "\n"
        elsif pow[1] == 1
            print "1:#{moti[1][0][:role1]} \n"
        end
    else
        print "\n"
    end
    print "12　後手持ち駒: "
    if moti[2][0] != 0
        if pow[2] > 1
            for i in 0..pow[2]-1
                print "#{i}:#{moti[2][i][:role2]} "
            end
            print "\n"
        elsif pow[2] == 1
            print "1:#{moti[2][0][:role2]} \n"
        end
    else
        print "\n"
    end

    #∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽
    #合法手チェック

    while 1
        print "移動する駒の座標を入力 ⇒  "
        ch = gets.to_i
        chA = [ch/10, ch%10]
        if chA[0] < 10
            if koma[board[chA[0]][chA[1]]][:owner] == player
                break
            end
        elsif player == chA[0]-10 && chA[1] <= pow[player]
            hoge3 = 1
            break
        elsif ch == 404
            hoge1 = 1
            break
        end
        puts "自分の駒を選択してください"
    end
    if hoge1 == 1
        break
    end

    while 1
        print "移動先の座標を入力 ⇒  "
        ch = gets.to_i
        chB = [ch/10, ch%10]
        if hoge3 == 1 #持ち駒を打つ
            if moti[player][chA[1]][:id] / 100 == 1 || moti[player][chA[1]][:id] / 100 == 2 #打ち歩詰め
                if player == 1
                    if chB[0] != 9
                        if koma[board[chB[0]][chB[1]]][:owner] == 0
                            break
                        end
                    end
                elsif player == 2
                    if chB[0] != 1
                        if koma[board[chB[0]][chB[1]]][:owner] == 0
                            break
                        end
                    end
                end
            else
                if koma[board[chB[0]][chB[1]]][:owner] == 0
                    break
                end
            end
            puts "選択可能な座標を選択してください"
        elsif ch == 404
            puts "選択駒がリセットされました"
            hoge3 = 0
            while 1
                print "移動する駒の座標を入力 ⇒  "
                ch = gets.to_i
                chA = [ch/10, ch%10]
                if chA[0] < 10
                    if koma[board[chA[0]][chA[1]]][:owner] == player
                        break
                    end
                elsif player == chA[0]-10 && chA[1] <= pow[player]
                    hoge3 = 1
                    break
                elsif chA[0] == 40 && chA[1] == 4
                    hoge1 = 1
                    break
                end
                puts "自分の駒を選択してください"
            end
            if hoge1 == 1
                break
            end
        else #自駒を動かす
            if koma[board[chB[0]][chB[1]]][:owner] == 0 || koma[board[chB[0]][chB[1]]][:owner] == enemy
                if player == 1
                    if Judge1::Judg.ment(koma[board[chA[0]][chA[1]]], chB, koma, board) == 1
                        break
                    end
                elsif player == 2
                    if Judge2::Judg.ment(koma[board[chA[0]][chA[1]]], chB, koma, board) == 1
                        break
                    end
                end
            end
            puts "選択可能な座標を選択してください"
        end
    end
    if hoge1 == 1
        break
    end

    #∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽
    #駒移動

    if hoge3 == 1 #持ち駒を打つ
        board[chB[0]][chB[1]] = moti[player][chA[1]][:id]
        koma[board[chB[0]][chB[1]]] = moti[player][chA[1]]
        if moti[player][chA[1]][:id] / 100 == 5 || koma[board[chB[0]][chB[1]]][:id] / 100 == 8
            koma[board[chB[0]][chB[1]]][:status] = 3
        else
            koma[board[chB[0]][chA[1]]][:status] = 1
        end
        koma[board[chB[0]][chB[1]]][:place] = chB
        hoge4 = pow[player] - chA[1]
        if hoge4 > 1
            for i in hoge4..1
                moti[player][chA[1]+i-1] =  moti[player][chA[1]+i]
            end
        elsif hoge4 == 1
            moti[player][chA[1]] =  moti[player][player]
        end
        pow[player] -= 1
    else #自駒を動かす
        #成るかどうか
        if koma[board[chA[0]][chA[1]]][:status] == 1
            if player == 1
                if chB[0] >= 7
                    print "成りますか？ [y/n]"
                    nari = gets.chomp
                    if nari == "y"
                        hoge2 = koma[board[chA[0]][chA[1]]][:role1]
                        koma[board[chA[0]][chA[1]]][:role1] = koma[board[chA[0]][chA[1]]][:role2]
                        koma[board[chA[0]][chA[1]]][:role2] = hoge2
                    end
                end
            elsif player == 2
                if chB[0] <= 3
                    print "成りますか？ [y/n]"
                    nari = gets.chomp
                    if nari == "y"
                        hoge2 = koma[board[chA[0]][chA[1]]][:role1]
                        koma[board[chA[0]][chA[1]]][:role1] = koma[board[chA[0]][chA[1]]][:role2]
                        koma[board[chA[0]][chA[1]]][:role2] = hoge2
                    end
                end
            end
        end
        #移動先について
        if koma[board[chB[0]][chB[1]]][:owner] == enemy #移動先に敵の駒がいる場合
            koma[board[chB[0]][chB[1]]][:owner] == player #敵の駒を持ち駒にする
            if koma[board[chB[0]][chB[1]]][:status] == 2 #成っていた場合戻す
                hoge2 = koma[board[chB[0]][chB[1]]][:role1]
                koma[board[chB[0]][chB[1]]][:role1] = koma[board[chB[0]][chB[1]]][:role2]
                koma[board[chB[0]][chB[1]]][:role2] = hoge2
            end
            koma[board[chB[0]][chB[1]]][:status] = 0 #敵駒のステータスを持ち駒(0)にする
            moti[player][pow[player]] = koma[board[chB[0]][chB[1]]] #持ち駒の配列に入れる
            board[chB[0]][chB[1]] = board[chA[0]][chA[1]] #id交換
            board[chA[0]][chA[1]] = 0
            pow[player] += 1
            koma[board[chB[0]][chB[1]]][:place] = chB #場所情報更新
        else #空きマスに移動する場合
            board[chB[0]][chB[1]] = board[chA[0]][chA[1]] #id交換
            board[chA[0]][chA[1]] = 0
            koma[board[chB[0]][chB[1]]][:place] = chB #場所情報更新
        end
    end
    #∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽

    #王が取られているか確認
    if koma[800+enemy][:status] == 0
        winner = player
    end

    #turn加算
    tik += 1; turn += tik%2; player = 2-tik%2; enemy = 1+tik%2

    #画面消去
    puts "\e[H\e[2J"

    #継続条件
    break if  winner != 0
end

if winner == 1
    puts "先手が勝利しました"
elsif winner == 2
    puts "後手が勝利しました"
end