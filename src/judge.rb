module Judge1
    class Judg
        def self.ment(chA, chB, koma, board)
            case(chA[:id] / 100)
            when 1
                if chA[:status] == 1
                    if chA[:place][0]+1 == chB[0] && chA[:place][1] == chB[1]
                        return 1
                    else
                        return 0
                    end
                else
                    return Judg.kin(chA, chB)
                end
            when 2
                if chA[:status] == 1
                    if chA[:place][0] < chB[0] && chA[:place][1] == chB[1]
                        diff = chB[1] - chA[:place][1] #どのくらい縦移動したか
                        if diff > 1
                            for i in 1..(diff-1)
                                if koma[board[chA[:place][0]][chA[:place][1]+i]][:owner] != 0
                                    ok = 0
                                    break
                                end
                            end
                            if ok == 0
                                return 0
                            else
                                return 1
                            end
                        else
                            if chA[:place][0] == chB[0] && chA[:place][1]+1 == chB[1]
                                return 1
                            end
                        end
                    else
                        return 0
                    end
                else
                    return Judg.kin(chA, chB)
                end
            when 3
                if chA[:status] == 0
                    if chA[:place][0]+2 == chB[0] && chA[:place][1]-1 == chB[1]
                        return 1
                    elsif chA[:place][0]+2 == chB[0] && chA[:place][1]+1 == chB[1]
                        return 1
                    else
                        return 0
                    end
                else
                    return Judg.kin(chA, chB)
                end
            when 4
                if chA[:status] == 0
                    if chA[:place][0]+1 == chB[0] && chA[:place][1]-1 == chB[1]
                        return 1
                    elsif chA[:place][0]+1 == chB[0] && chA[:place][1] == chB[1]
                        return 1
                    elsif chA[:place][0]+1 == chB[0] && chA[:place][1]+1 == chB[1]
                        return 1
                    elsif chA[:place][0]-1 == chB[0] && chA[:place][1]-1 == chB[1]
                        return 1
                    elsif chA[:place][0]-1 == chB[0] && chA[:place][1]+1 == chB[1]
                        return 1
                    end
                else
                    return Judg.kin(chA, chB)
                end
            when 5
                return Judg.kin(chA, chB)
            when 6
                return Spe::Cial.hi(chA, chB, koma, board)
            when 7
                return Spe::Cial.kaku(chA, chB, koma, board)
            when 8
                return Spe::Cial.oh(chA, chB)
            end
        end
        def self.kin(chA, chB)
            if chA[:place][0]+1 == chB[0] && chA[:place][1]-1 == chB[1]
                1
            elsif chA[:place][0]+1 == chB[0] && chA[:place][1] == chB[1]
                1
            elsif chA[:place][0]+1 == chB[0] && chA[:place][1]+1 == chB[1]
                1
            elsif chA[:place][0] == chB[0] && chA[:place][1]-1 == chB[1]
                1
            elsif chA[:place][0] == chB[0] && chA[:place][1]+1 == chB[1]
                1
            elsif chA[:place][0]-1 == chB[0] && chA[:place][1] == chB[1]
                1
            else
                0
            end
        end
    end
end

module Judge2
    class Judg
        def self.ment(chA, chB, koma, board)
            case(chA[:id] / 100)
            when 1
                if chA[:status] == 1
                    if chA[:place][0]-1 == chB[0] && chA[:place][1] == chB[1]
                        return 1
                    else
                        return 0
                    end
                else
                    return Judg.kin(chA, chB)
                end
            when 2
                if chA[:status] == 1
                    if chA[:place][0] > chB[0] && chA[:place][1] == chB[1]
                        diff = chB[1] - chA[:place][1] #どのくらい縦移動したか
                        if diff < -1
                            for i in (diff+1)..-1
                                if koma[board[chA[:place][0]][chA[:place][1]+i]][:owner] != 0
                                    ok = 0
                                    break
                                end
                            end
                            if ok == 0
                                return 0
                            else
                                return 1
                            end
                        else
                            if chA[:place][0] == chB[0] && chA[:place][1]-1 == chB[1]
                                return 1
                            end
                        end
                    else
                        return 0
                    end
                else
                    return Judg.kin(chA, chB)
                end
            when 3
                if chA[:status] == 0
                    if chA[:place][0]-2 == chB[0] && chA[:place][1]-1 == chB[1]
                        return 1
                    elsif chA[:place][0]-2 == chB[0] && chA[:place][1]+1 == chB[1]
                        return 1
                    else
                        return 0
                    end
                else
                    return Judg.kin(chA, chB)
                end
            when 4
                if chA[:status] == 0
                    if chA[:place][0]-1 == chB[0] && chA[:place][1]-1 == chB[1]
                        return 1
                    elsif chA[:place][0]-1 == chB[0] && chA[:place][1] == chB[1]
                        return 1
                    elsif chA[:place][0]-1 == chB[0] && chA[:place][1]+1 == chB[1]
                        return 1
                    elsif chA[:place][0]+1 == chB[0] && chA[:place][1]-1 == chB[1]
                        return 1
                    elsif chA[:place][0]+1 == chB[0] && chA[:place][1]+1 == chB[1]
                        return 1
                    end
                else
                    return Judg.kin(chA, chB)
                end
            when 5
                return Judg.kin(chA, chB)
            when 6
                return Spe::Cial.hi(chA, chB, koma, board)
            when 7
                return Spe::Cial.kaku(chA, chB, koma, board)
            when 8
                return Spe::Cial.oh(chA, chB)
            end
        end
        def self.kin(chA, chB)
            if chA[:place][0]-1 == chB[0] && chA[:place][1]-1 == chB[1]
                1
            elsif chA[:place][0]-1 == chB[0] && chA[:place][1] == chB[1]
                1
            elsif chA[:place][0]-1 == chB[0] && chA[:place][1]+1 == chB[1]
                1
            elsif chA[:place][0] == chB[0] && chA[:place][1]-1 == chB[1]
                1
            elsif chA[:place][0] == chB[0] && chA[:place][1]+1 == chB[1]
                1
            elsif chA[:place][0]+1 == chB[0] && chA[:place][1] == chB[1]
                1
            else
                0
            end
        end
    end
end

module Spe
    class Cial
        def self.oh(chA, chB)
            if chA[:place][0]-1 == chB[0] && chA[:place][1]-1 == chB[1]
                1
            elsif chA[:place][0]-1 == chB[0] && chA[:place][1] == chB[1]
                1
            elsif chA[:place][0]-1 == chB[0] && chA[:place][1]+1 == chB[1]
                1
            elsif chA[:place][0] == chB[0] && chA[:place][1]-1 == chB[1]
                1
            elsif chA[:place][0] == chB[0] && chA[:place][1]+1 == chB[1]
                1
            elsif chA[:place][0]+1 == chB[0] && chA[:place][1]-1 == chB[1]
                1
            elsif chA[:place][0]+1 == chB[0] && chA[:place][1] == chB[1]
                1
            elsif chA[:place][0]+1 == chB[0] && chA[:place][1]+1 == chB[1]
                1
            else
                0
            end
        end
        def self.hi(chA, chB, koma, board)
            ok = 1
            if chA[:status] == 1
                if chA[:place][0] == chB[0] #もし横座標が変わらなかったら（縦移動）
                    diff = chB[1] - chA[:place][1] #どのくらい縦移動したか
                    if diff > 1
                        for i in 1..(diff-1)
                            if koma[board[chA[:place][0]][chA[:place][1]+i]][:owner] != 0
                                ok = 0
                                break
                            end
                        end
                        if ok == 0
                            0
                        else
                            1
                        end
                    elsif diff < -1
                        for i in (diff+1)..-1
                            if koma[board[chA[:place][0]][chA[:place][1]+i]][:owner] != 0
                                ok = 0
                                break
                            end
                        end
                        if ok == 0
                            0
                        else
                            1
                        end
                    else
                        if chA[:place][0] == chB[0] && chA[:place][1]-1 == chB[1]
                            1
                        elsif chA[:place][0] == chB[0] && chA[:place][1]+1 == chB[1]
                            1
                        end
                    end
                elsif chA[:place][1] == chB[1] #もし縦座標が変わらなかったら（横移動）
                    diff = chB[0] - chA[:place][0] #どのくらい横移動したか
                    if diff > 1
                        for i in 1..(diff-1)
                            if koma[board[chA[:place][0]+i][chA[:place][1]]][:owner] != 0
                                ok = 0
                                break
                            end
                        end
                        if ok == 0
                            0
                        else
                            1
                        end
                    elsif diff < -1
                        for i in (diff+1)..-1
                            if koma[board[chA[:place][0]+i][chA[:place][1]]][:owner] != 0
                                ok = 0
                                break
                            end
                        end
                        if ok == 0
                            0
                        else
                            1
                        end
                    else
                        if chA[:place][0]-1 == chB[0] && chA[:place][1] == chB[1]
                            1
                        elsif chA[:place][0]+1 == chB[0] && chA[:place][1] == chB[1]
                            1
                        end
                    end
                else
                    0
                end
            elsif chA[:status] == 2
                if chA[:place][0] == chB[0] #もし横座標が変わらなかったら（縦移動）
                    diff = chB[1] - chA[:place][1] #どのくらい縦移動したか
                    if diff > 1
                        for i in 1..(diff-1)
                            if koma[board[chA[:place][0]][chA[:place][1]+i]][:owner] != 0
                                ok = 0
                                break
                            end
                        end
                        if ok == 0
                            0
                        else
                            1
                        end
                    elsif diff < -1
                        for i in (diff+1)..-1
                            if koma[board[chA[:place][0]][chA[:place][1]+i]][:owner] != 0
                                ok = 0
                                break
                            end
                        end
                        if ok == 0
                            0
                        else
                            1
                        end
                    else
                        if chA[:place][0] == chB[0] && chA[:place][1]-1 == chB[1]
                            1
                        elsif chA[:place][0] == chB[0] && chA[:place][1]+1 == chB[1]
                            1
                        end
                    end
                elsif chA[:place][1] == chB[1] #もし縦座標が変わらなかったら（横移動）
                    diff = chB[0] - chA[:place][0] #どのくらい横移動したか
                    if diff > 1
                        for i in 1..(diff-1)
                            if koma[board[chA[:place][0]+i][chA[:place][1]]][:owner] != 0
                                ok = 0
                                break
                            end
                        end
                        if ok == 0
                            0
                        else
                            1
                        end
                    elsif diff < -1
                        for i in (diff+1)..-1
                            if koma[board[chA[:place][0]+i][chA[:place][1]]][:owner] != 0
                                ok = 0
                                break
                            end
                        end
                        if ok == 0
                            0
                        else
                            1
                        end
                    else
                        if chA[:place][0]-1 == chB[0] && chA[:place][1] == chB[1]
                            1
                        elsif chA[:place][0]+1 == chB[0] && chA[:place][1] == chB[1]
                            1
                        end
                    end
                else
                    Cial.oh(chA, chB)
                end
            end
        end
        def self.kaku(chA, chB, koma, board)
            diff0 = chB[0] - chA[:place][0]
            diff1 = chB[1] - chA[:place][1]
            diff2 = diff1*-1
            ok = 1
            if diff0 == diff1 || diff0 == diff2
                if chA[:status] == 1
                    if diff0 > 0 && diff1 > 0
                        for i in 1..diff0
                            if koma[board[chA[:place][0]+i][chA[:place][1]]][:owner] != 0
                                ok = 0
                                break
                            end
                        end
                        if ok == 0
                            0
                        else
                            1
                        end
                    elsif diff0 > 0 && diff1 < 0
                        for i in 1..diff0
                            if koma[board[chA[:place][0]+i][chA[:place][1]]][:owner] != 0
                                ok = 0
                                break
                            end
                        end
                        if ok == 0
                            0
                        else
                            1
                        end
                    elsif diff0 < 0 && diff1 > 0
                        for i in 1..diff1
                            if koma[board[chA[:place][0]][chA[:place][1]+i]][:owner] != 0
                                ok = 0
                                break
                            end
                        end
                        if ok == 0
                            0
                        else
                            1
                        end
                    elsif diff0 < 0 && diff1 < 0
                        for i in diff1..-1
                            if koma[board[chA[:place][0]][chA[:place][1]+i]][:owner] != 0
                                ok = 0
                                break
                            end
                        end
                        if ok == 0
                            0
                        else
                            1
                        end
                    else
                        0
                    end
                elsif chA[:status] == 2
                    if diff0 > 0 && diff1 > 0
                        for i in 1..diff0
                            if koma[board[chA[:place][0]+i][chA[:place][1]]][:owner] != 0
                                ok = 0
                                break
                            end
                        end
                        if ok == 0
                            0
                        else
                            1
                        end
                    elsif diff0 > 0 && diff1 < 0
                        for i in 1..diff0
                            if koma[board[chA[:place][0]+i][chA[:place][1]]][:owner] != 0
                                ok = 0
                                break
                            end
                        end
                        if ok == 0
                            0
                        else
                            1
                        end
                    elsif diff0 < 0 && diff1 > 0
                        for i in 1..diff1
                            if koma[board[chA[:place][0]][chA[:place][1]+i]][:owner] != 0
                                ok = 0
                                break
                            end
                        end
                        if ok == 0
                            0
                        else
                            1
                        end
                    elsif diff0 < 0 && diff1 < 0
                        for i in diff1..-1
                            if koma[board[chA[:place][0]][chA[:place][1]+i]][:owner] != 0
                                ok = 0
                                break
                            end
                        end
                        if ok == 0
                            0
                        else
                            1
                        end
                    else
                        Cial.oh(chA, chB)
                    end
                end
            else
                0
            end
        end
    end
end