module Judge1
    class Judg
        def self.ment(mover, target, koma, board)
            diff = 0; out = 1
            case(mover[:id] / 100)
            when 1
                if mover[:status] == 1
                    if mover[:place][0]+1 == target[0] && mover[:place][1] == target[1]
                        return 1
                    else
                        return 0
                    end
                else
                    return Judg.kin(mover, target)
                end
            when 2
                if mover[:status] == 1
                    if mover[:place][1] == target[1] && mover[:place][0] < target[0]
                        diff = target[0] - mover[:place][0] #どのくらい横移動したか
                        if diff > 1
                            for i in 1..(diff-1)
                                if koma[board[mover[:place][0]+i][mover[:place][1]]][:owner] != 0
                                    ok = 0
                                    break
                                end
                            end
                            if ok == 0
                                0
                            else
                                1
                            end
                        elsif diff == 1
                            if mover[:place][0]+1 == target[0] && mover[:place][1] == target[1]
                                1
                            end
                        end
                    else
                        0
                    end
                else
                    return Judg.kin(mover, target)
                end
            when 3
                if mover[:status] == 1
                    if mover[:place][0]+2 == target[0] && mover[:place][1]+1 == target[1]
                        return 1
                    elsif mover[:place][0]+2 == target[0] && mover[:place][1]-1 == target[1]
                        return 1
                    else
                        return 0
                    end
                else
                    return Judg.kin(mover, target)
                end
            when 4
                if mover[:status] == 1
                    if mover[:place][0]+1 == target[0] && mover[:place][1]-1 == target[1]
                        return 1
                    elsif mover[:place][0]+1 == target[0] && mover[:place][1] == target[1]
                        return 1
                    elsif mover[:place][0]+1 == target[0] && mover[:place][1]+1 == target[1]
                        return 1
                    elsif mover[:place][0]-1 == target[0] && mover[:place][1]-1 == target[1]
                        return 1
                    elsif mover[:place][0]-1 == target[0] && mover[:place][1]+1 == target[1]
                        return 1
                    end
                else
                    return Judg.kin(mover, target)
                end
            when 5
                return Judg.kin(mover, target)
            when 6
                return Spe::Cial.hi(mover, target, koma, board)
            when 7
                return Spe::Cial.kaku(mover, target, koma, board)
            when 8
                return Spe::Cial.oh(mover, target)
            end
        end
        def self.kin(mover, target)
            if mover[:place][0]+1 == target[0] && mover[:place][1]-1 == target[1]
                1
            elsif mover[:place][0]+1 == target[0] && mover[:place][1] == target[1]
                1
            elsif mover[:place][0]+1 == target[0] && mover[:place][1]+1 == target[1]
                1
            elsif mover[:place][0] == target[0] && mover[:place][1]-1 == target[1]
                1
            elsif mover[:place][0] == target[0] && mover[:place][1]+1 == target[1]
                1
            elsif mover[:place][0]-1 == target[0] && mover[:place][1] == target[1]
                1
            else
                0
            end
        end
    end
end

module Judge2
    class Judg
        def self.ment(mover, target, koma, board)
            diff = 0
            case(mover[:id] / 100)
            when 1
                if mover[:status] == 1
                    if mover[:place][0]-1 == target[0] && mover[:place][1] == target[1]
                        return 1
                    else
                        return 0
                    end
                else
                    return Judg.kin(mover, target)
                end
            when 2
                if mover[:status] == 1
                    if mover[:place][1] == target[1] && mover[:place][0] > target[0]
                        diff =  target[0] - mover[:place][0] #どのくらい横移動したか
                        if diff < -1
                            for i in (diff+1)..-1
                                if koma[board[mover[:place][0]+i][mover[:place][1]]][:owner] != 0
                                    ok = 0
                                    break
                                end
                            end
                            if ok == 0
                                0
                            else
                                1
                            end
                        elsif diff == -1
                            if mover[:place][0]+1 == target[0] && mover[:place][1] == target[1]
                                1
                            end
                        end
                    else
                        0
                    end
                else
                    return Judg.kin(mover, target)
                end
            when 3
                if mover[:status] == 1
                    if mover[:place][0]-2 == target[0] && mover[:place][1]-1 == target[1]
                        return 1
                    elsif mover[:place][0]-2 == target[0] && mover[:place][1]+1 == target[1]
                        return 1
                    else
                        return 0
                    end
                else
                    return Judg.kin(mover, target)
                end
            when 4
                if mover[:status] == 1
                    if mover[:place][0]-1 == target[0] && mover[:place][1]-1 == target[1]
                        return 1
                    elsif mover[:place][0]-1 == target[0] && mover[:place][1] == target[1]
                        return 1
                    elsif mover[:place][0]-1 == target[0] && mover[:place][1]+1 == target[1]
                        return 1
                    elsif mover[:place][0]+1 == target[0] && mover[:place][1]-1 == target[1]
                        return 1
                    elsif mover[:place][0]+1 == target[0] && mover[:place][1]+1 == target[1]
                        return 1
                    end
                else
                    return Judg.kin(mover, target)
                end
            when 5
                return Judg.kin(mover, target)
            when 6
                return Spe::Cial.hi(mover, target, koma, board)
            when 7
                return Spe::Cial.kaku(mover, target, koma, board)
            when 8
                return Spe::Cial.oh(mover, target)
            end
        end
        def self.kin(mover, target)
            if mover[:place][0]-1 == target[0] && mover[:place][1]-1 == target[1]
                1
            elsif mover[:place][0]-1 == target[0] && mover[:place][1] == target[1]
                1
            elsif mover[:place][0]-1 == target[0] && mover[:place][1]+1 == target[1]
                1
            elsif mover[:place][0] == target[0] && mover[:place][1]-1 == target[1]
                1
            elsif mover[:place][0] == target[0] && mover[:place][1]+1 == target[1]
                1
            elsif mover[:place][0]+1 == target[0] && mover[:place][1] == target[1]
                1
            else
                0
            end
        end
    end
end

module Spe
    class Cial
        def self.oh(mover, target)
            if mover[:place][0]-1 == target[0] && mover[:place][1]-1 == target[1]
                1
            elsif mover[:place][0]-1 == target[0] && mover[:place][1] == target[1]
                1
            elsif mover[:place][0]-1 == target[0] && mover[:place][1]+1 == target[1]
                1
            elsif mover[:place][0] == target[0] && mover[:place][1]-1 == target[1]
                1
            elsif mover[:place][0] == target[0] && mover[:place][1]+1 == target[1]
                1
            elsif mover[:place][0]+1 == target[0] && mover[:place][1]-1 == target[1]
                1
            elsif mover[:place][0]+1 == target[0] && mover[:place][1] == target[1]
                1
            elsif mover[:place][0]+1 == target[0] && mover[:place][1]+1 == target[1]
                1
            else
                0
            end
        end
        def self.hi(mover, target, koma, board)
            ok = 1
            if mover[:place][0] == target[0] #もし横座標が変わらなかったら（縦移動）
                diff = target[1] - mover[:place][1] #どのくらい縦移動したか
                if diff > 1
                    for i in 1..(diff-1)
                        if koma[board[mover[:place][0]][mover[:place][1]+i]][:owner] != 0
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
                        if koma[board[mover[:place][0]][mover[:place][1]+i]][:owner] != 0
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
                    if mover[:place][0] == target[0] && mover[:place][1]-1 == target[1]
                        1
                    elsif mover[:place][0] == target[0] && mover[:place][1]+1 == target[1]
                        1
                    end
                end
            elsif mover[:place][1] == target[1] #もし縦座標が変わらなかったら（横移動）
                diff = target[0] - mover[:place][0] #どのくらい横移動したか
                if diff > 1
                    for i in 1..(diff-1)
                        if koma[board[mover[:place][0]+i][mover[:place][1]]][:owner] != 0
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
                        if koma[board[mover[:place][0]+i][mover[:place][1]]][:owner] != 0
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
                    if mover[:place][0]-1 == target[0] && mover[:place][1] == target[1]
                        1
                    elsif mover[:place][0]+1 == target[0] && mover[:place][1] == target[1]
                        1
                    end
                end
            elsif mover[:status] == 2
                return Cial.oh(mover, target)
            else
                0
            end
        end
        def self.kaku(mover, target, koma, board)
            diff0 = target[0] - mover[:place][0]
            diff1 = target[1] - mover[:place][1]
            diff2 = diff1*-1
            ok = 1
            if diff0 == diff1 || diff0 == diff2
                if diff0 > 0 && diff1 > 0
                    for i in 1..(diff0-1)
                        if koma[board[mover[:place][0]+i][mover[:place][1]+i]][:owner] != 0
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
                    for i in 1..(diff0-1)
                        if koma[board[mover[:place][0]+i][mover[:place][1]-i]][:owner] != 0
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
                    for i in 1..(diff1-1)
                        if koma[board[mover[:place][0]-i][mover[:place][1]+i]][:owner] != 0
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
                    for i in 1..(diff2-1)
                        if koma[board[mover[:place][0]-i][mover[:place][1]-i]][:owner] != 0
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
            elsif mover[:status] == 2
                return Cial.oh(mover, target)
            else
                0
            end
        end
    end
end