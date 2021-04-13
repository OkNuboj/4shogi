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
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], 
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], 
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], 
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
]
pow = Array.new(5).map{0}

#その他
winner = 0; turn = 1; tik = 0;
player = 1; enemy1 = 2; enemy2 = 3; enemy3 = 4

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
koma[10] = {role1: "10", id: 10, owner: -1}
koma[11] = {role1: "11", id: 11, owner: -1}
koma[12] = {role1: "12", id: 12, owner: -1}
koma[13] = {role1: "13", id: 13, owner: -1}
koma[14] = {role1: "14", id: 14, owner: -1}
koma[15] = {role1: "15", id: 15, owner: -1}

koma[21] = {role1: "一", id: 21, owner: -1}
koma[22] = {role1: "二", id: 22, owner: -1}
koma[23] = {role1: "三", id: 23, owner: -1}
koma[24] = {role1: "四", id: 24, owner: -1}
koma[25] = {role1: "五", id: 25, owner: -1}
koma[26] = {role1: "六", id: 26, owner: -1}
koma[27] = {role1: "七", id: 27, owner: -1}
koma[28] = {role1: "八", id: 28, owner: -1}
koma[29] = {role1: "九", id: 29, owner: -1}
koma[30] = {role1: "十", id: 30, owner: -1}
koma[31] = {role1: "壱", id: 31, owner: -1}
koma[32] = {role1: "弐", id: 32, owner: -1}
koma[33] = {role1: "参", id: 33, owner: -1}
koma[34] = {role1: "肆", id: 34, owner: -1}
koma[35] = {role1: "伍", id: 35, owner: -1}

koma[40] = {role1: "〇", id: 40, owner: -1}
koma[41] = {role1: "│", id: 41, owner: -1}
koma[42] = {role1: "██", id: 42, owner: -1}

#駒の初期設定
for i in 0..17
    koma[101+i] = {role1: "歩", role2: "と", status: 1, place: [i/9*10+3, i%9+4], id: 101+i, owner: (i/9)*2+1}
    koma[119+i] = {role1: "歩", role2: "と", status: 1, place: [i%9+4, i/9*10+3], id: 119+i, owner: 4-(i/9)*2}
end

for i in 0..3
    koma[201+i] = {role1: "香", role2: "杏", status: 1, place: [1+(i/2)*14, 4+i%2*8], id: 201+i, owner: (i/2)*2+1}
    koma[301+i] = {role1: "桂", role2: "圭", status: 1, place: [1+(i/2)*14, 5+i%2*6], id: 301+i, owner: (i/2)*2+1}
    koma[401+i] = {role1: "銀", role2: "全", status: 1, place: [1+(i/2)*14, 6+i%2*4], id: 401+i, owner: (i/2)*2+1}
    koma[501+i] = {role1: "金", status: 3, place: [1+(i/2)*14, 7+i%2*2], id: 501+i, owner: (i/2)*2+1}

    koma[205+i] = {role1: "香", role2: "杏", status: 1, place: [4+i%2*8, 1+(i/2)*14], id: 205+i, owner: 4-(i/2)*2}
    koma[305+i] = {role1: "桂", role2: "圭", status: 1, place: [5+i%2*6, 1+(i/2)*14], id: 305+i, owner: 4-(i/2)*2}
    koma[405+i] = {role1: "銀", role2: "全", status: 1, place: [6+i%2*4, 1+(i/2)*14], id: 405+i, owner: 4-(i/2)*2}
    koma[505+i] = {role1: "金", status: 3, place: [7+i%2*2, 1+(i/2)*14], id: 505+i, owner: 4-(i/2)*2}
end

for i in 0..1
    koma[601+i] = {role1: "飛", role2: "龍", status: 1, place: [2+i*12, 5+i%2*6], id: 601+i, owner: i*2+1}
    koma[701+i] = {role1: "角", role2: "馬", status: 1, place: [2+i*12, 11-i%2*6], id: 701+i, owner: i*2+1}
    koma[801+i] = {role1: "王", status: 3, place: [1+i*14, 8], id: 801+i, owner: i*2+1}

    koma[603+i] = {role1: "飛", role2: "龍", status: 1, place: [11-i%2*6, 2+i*12], id: 603+i, owner: 4-i*2}
    koma[703+i] = {role1: "角", role2: "馬", status: 1, place: [5+i%2*6, 2+i*12], id: 703+i, owner: 4-i*2}
    koma[803+i] = {role1: "王", status: 3, place: [8, 1+i*14], id: 803+i, owner: 4-i*2}
end

#将棋盤の初期設定
board = [
    [40, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 41], 
    [1, 42, 42, 42, 201, 301, 401, 501, 801, 502, 402, 302, 202, 42, 42, 42, 41], 
    [2, 42, 42, 42, 0, 601, 0, 0, 0, 0, 0, 701, 0, 42, 42, 42, 41], 
    [3, 42, 42, 42, 101, 102, 103, 104, 105, 106, 107, 108, 109, 42, 42, 42, 41], 
    [4, 205, 0, 119, 0, 0, 0, 0, 0, 0, 0, 0, 0, 128, 0, 207, 41], 
    [5, 305, 703, 120, 0, 0, 0, 0, 0, 0, 0, 0, 0, 129, 604, 307, 41], 
    [6, 405, 0, 121, 0, 0, 0, 0, 0, 0, 0, 0, 0, 130, 0, 407, 41], 
    [7, 505, 0, 122, 0, 0, 0, 0, 0, 0, 0, 0, 0, 131, 0, 507, 41], 
    [8, 803, 0, 123, 0, 0, 0, 0, 0, 0, 0, 0, 0, 132, 0, 804, 41], 
    [9, 506, 0, 124, 0, 0, 0, 0, 0, 0, 0, 0, 0, 133, 0, 508, 41], 
    [10, 406, 0, 125, 0, 0, 0, 0, 0, 0, 0, 0, 0, 134, 0, 408, 41], 
    [11, 306, 603, 126, 0, 0, 0, 0, 0, 0, 0, 0, 0, 135, 704, 308, 41], 
    [12, 206, 0, 127, 0, 0, 0, 0, 0, 0, 0, 0, 0, 136, 0, 208, 41], 
    [13, 42, 42, 42, 110, 111, 112, 113, 114, 115, 116, 117, 118, 42, 42, 42, 41], 
    [14, 42, 42, 42, 0, 702, 0, 0, 0, 0, 0, 602, 0, 42, 42, 42, 41], 
    [15, 42, 42, 42, 203, 303, 403, 503, 802, 504, 404, 304, 204, 42, 42, 42, 41]
]

#∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽

#対局開始
puts "\e[H\e[2J" #画面清掃
while 1
    hoge1 = 0; hoge2 = "a"; hoge3 = 0; hoge4 = 0; hoge5 = 0; judge = 0; nari = "a"

    #∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽
    #画面表示
    Show.show(koma, board, turn, player)

    #持ち駒表示
    print "11　北局持ち駒: "
    if moti[1][0] != 0
        if pow[1] > 1
            for i in 0..pow[1]-1
                print "#{i+1}:#{moti[1][i][:role1]} "
            end
            print "\n"
        elsif pow[1] == 1
            print "0:#{moti[1][0][:role1]} \n"
        end
    else
        print "\n"
    end
    print "12　東局持ち駒: "
    if moti[2][0] != 0
        if pow[2] > 1
            for i in 0..pow[2]-1
                print "#{i+1}:#{moti[2][i][:role1]} "
            end
            print "\n"
        elsif pow[2] == 1
            print "0:#{moti[2][0][:role1]} \n"
        end
    else
        print "\n"
    end
    print "13　南局持ち駒: "
    if moti[3][0] != 0
        if pow[3] > 1
            for i in 0..pow[3]-1
                print "#{i+1}:#{moti[3][i][:role1]} "
            end
            print "\n"
        elsif pow[3] == 1
            print "0:#{moti[3][0][:role1]} \n"
        end
    else
        print "\n"
    end
    print "14　西局持ち駒: "
    if moti[4][0] != 0
        if pow[4] > 1
            for i in 0..pow[4]-1
                print "#{i+1}:#{moti[4][i][:role1]} "
            end
            print "\n\n"
        elsif pow[4] == 1
            print "0:#{moti[4][0][:role1]}\n\n"
        end
    else
        print "\n\n"
    end

    #∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽∽
    #合法手チェック

    while 1
        print "移動する駒の座標を入力 ⇒  "
        ch = gets.to_i
        chA = [ch/100, ch%100]
        if chA[0] < 10
            if koma[board[chA[0]][chA[1]]][:owner] == player
                break
            end
        elsif player == chA[0]-10 && chA[1] <= pow[player]
            hoge3 = 1
            break
        elsif ch == 9999
            p 17
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
        chB = [ch/100, ch%100]
        if hoge3 == 1 #持ち駒を打つ
            if moti[player][chA[1]][:id] / 100 == 1 #二歩
                for i in 1..9
                    if koma[board[i][chB[1]]][:id]/100 == 1 && koma[board[i][chB[1]]][:owner] == player
                        hoge5 = 1
                    end
                end
            end
            if hoge5 == 0
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
            end
            puts "禁則行為です"
            ch = 9999
        end
        if ch == 9999
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
                elsif ch == 9999
                    hoge1 = 1
                    break
                end
                puts "自分の駒を選択してください"
            end
            if hoge1 == 1
                break
            end
        else #自駒を動かす
            if koma[board[chB[0]][chB[1]]][:owner] == 0 || koma[board[chB[0]][chB[1]]][:owner] == enemy1 || koma[board[chB[0]][chB[1]]][:owner] == enemy2 || koma[board[chB[0]][chB[1]]][:owner] == enemy3
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
                        koma[board[chA[0]][chA[1]]][:status] = 2
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
                        koma[board[chA[0]][chA[1]]][:status] = 2
                    end
                end
            end
        end
        #移動先について
        if koma[board[chB[0]][chB[1]]][:owner] == enemy1 || koma[board[chB[0]][chB[1]]][:owner] == enemy2 || koma[board[chB[0]][chB[1]]][:owner] == enemy3 #移動先に敵の駒がいる場合
            if koma[board[chB[0]][chB[1]]][:status] == 2 #成っていた場合戻す
                hoge2 = koma[board[chB[0]][chB[1]]][:role1]
                koma[board[chB[0]][chB[1]]][:role1] = koma[board[chB[0]][chB[1]]][:role2]
                koma[board[chB[0]][chB[1]]][:role2] = hoge2
            end
            koma[board[chB[0]][chB[1]]][:status] = 0 #敵駒のステータスを持ち駒(0)にする
            moti[player][pow[player]] = koma[board[chB[0]][chB[1]]] #持ち駒の配列に入れる
            moti[player][pow[player]][:owner] = player
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
    wl = 0
    print "\n"
    if koma[800+enemy1][:status] == 0
        loser(enemy)
        wl += 1
    end
    if koma[800+enemy2][:status] == 0
        loser(enemy)
        wl += 1
    end
    if koma[800+enemy3][:status] == 0
        loser(enemy)
        wl += 1
    end
    if wl == 3
        winner = player
    end

    enemy1 = enemy2
    enemy2 = enemy3
    enemy3 = player
    tik += 1; turn = (tik)/4+1; player = tik%4+1

    #画面消去
    puts "\e[H\e[2J"

    #継続条件
    break if  winner != 0
end

def loser(enemy)
    if enemy == 1
        loser = "北"
    elsif enemy == 2
        loser = "東"
    elsif enemy == 3
        loser = "南"
    else enemy == 4
        loser = "西"
    end
    print "Loser! #{loser}局\n"
end

if winner == 1
    puts "\n\n\n北局が勝利しました"
elsif winner == 2
    puts "\n\n\n東局が勝利しました"
elsif winner == 3
    puts "\n\n\n南局が勝利しました"
elsif winner == 4
    puts "\n\n\n西局が勝利しました"
end