module Judge1
    class Judg
        def self.ment(chA, chB)
            case(chA[:id] / 100)
            when 1
                if chA[:status] == 1
                    if chA[:place][0]+1 == chB[0] && chA[:place][1] == chB[1]
                        return 1
                    else
                        return 0
                    end
                else
                    Judg.kin(chA, chB)
                end
            when 2
                if chA[:status] == 1
                    if chA[:place][0] < chB[0] && chA[:place][1] == chB[1]
                        return 1
                    else
                        return 0
                    end
                else
                    Judg.kin(chA, chB)
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
                    Judg.kin(chA, chB)
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
                    Judg.kin(chA, chB)
                end
            when 5
                Judg.kin(chA, chB)
            when 6
                if chA[:status] == 0
                    if chA[:place][0] == chB[0] || chA[:place][1] == chB[1]
                        return 1
                    else
                        return 0
                    end
                else
                    if chA[:place][0] == chB[0] || chA[:place][1] == chB[1]
                        return 1
                    elsif chA[:place][0]-1 == chB[0] && chA[:place][1]-1 == chB[1]
                        return 1
                    elsif chA[:place][0]-1 == chB[0] && chA[:place][1]+1 == chB[1]
                        return 1
                    end
                    Judg.kin(chA, chB)
                end
            when 7
                if chA[:status] == 0
                    Judg.kaku(chA, chB)
                else
                    if chA[:place][0]+1 == chB[0] && chA[:place][1]-1 == chB[1]
                        return 1
                    elsif chA[:place][0]+1 == chB[0] && chA[:place][1] == chB[1]
                        return 1
                    elsif chA[:place][0]+1 == chB[0] && chA[:place][1]+1 == chB[1]
                        return 1
                    elsif chA[:place][0] == chB[0] && chA[:place][1]-1 == chB[1]
                        return 1
                    elsif chA[:place][0] == chB[0] && chA[:place][1]+1 == chB[1]
                        return 1
                    elsif chA[:place][0]-1 == chB[0] && chA[:place][1] == chB[1]
                        return 1
                    elsif chA[:place][0]-1 == chB[0] && chA[:place][1]-1 == chB[1]
                        return 1
                    elsif chA[:place][0]-1 == chB[0] && chA[:place][1]+1 == chB[1]
                        return 1
                    end
                    Judg.kaku(chA, chB)
                end
            when 8
                if chA[:place][0]-1 == chB[0] && chA[:place][1]-1 == chB[1]
                    return 1
                elsif chA[:place][0]-1 == chB[0] && chA[:place][1]+1 == chB[1]
                    return 1
                end
                Judg.kin(chA, chB)
            end
        end
        def self.kin(chA, chB)
            if chA[:place][0]+1 == chB[0] && chA[:place][1]-1 == chB[1]
                return 1
            elsif chA[:place][0]+1 == chB[0] && chA[:place][1] == chB[1]
                return 1
            elsif chA[:place][0]+1 == chB[0] && chA[:place][1]+1 == chB[1]
                return 1
            elsif chA[:place][0] == chB[0] && chA[:place][1]-1 == chB[1]
                return 1
            elsif chA[:place][0] == chB[0] && chA[:place][1]+1 == chB[1]
                return 1
            elsif chA[:place][0]-1 == chB[0] && chA[:place][1] == chB[1]
                return 1
            else
                return 0
            end
        end
        def self.kaku(chA, chB)
            ok = 0
            zen = chA[:place][0] - 1
            go = 9 - chA[:place][0]
            for i in 1..zen
                if chA[:place][0]-i == chB[0] && chA[:place][1]+i == chB[1]
                    ok = 1
                    break
                elsif chA[:place][0]-i == chB[0] && chA[:place][1]-i == chB[1]
                    ok = 1
                    break
                end
            end
            for i in 1..go
                if chA[:place][0]+i == chB[0] && chA[:place][1]+i == chB[1]
                    ok = 1
                    break
                elsif chA[:place][0]+i == chB[0] && chA[:place][1]-i == chB[1]
                    ok = 1
                    break
                end
            end
            if ok == 1
                return 1
            else
                return 0
            end
        end
    end
end

module Judge2
    class Judg
        def self.ment(chA, chB)
            case(chA[:id] / 100)
            when 1
                if chA[:status] == 1
                    if chA[:place][0]-1 == chB[0] && chA[:place][1] == chB[1]
                        return 1
                    else
                        return 0
                    end
                else
                    Judg.kin(chA, chB)
                end
            when 2
                if chA[:status] == 1
                    if chA[:place][0] > chB[0] && chA[:place][1] == chB[1]
                        return 1
                    else
                        return 0
                    end
                else
                    Judg.kin(chA, chB)
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
                    Judg.kin(chA, chB)
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
                    Judg.kin(chA, chB)
                end
            when 5
                Judg.kin(chA, chB)
            when 6
                if chA[:status] == 0
                    if chA[:place][0] == chB[0] || chA[:place][1] == chB[1]
                        return 1
                    else
                        return 0
                    end
                else
                    if chA[:place][0] == chB[0] || chA[:place][1] == chB[1]
                        return 1
                    elsif chA[:place][0]+1 == chB[0] && chA[:place][1]-1 == chB[1]
                        return 1
                    elsif chA[:place][0]+1 == chB[0] && chA[:place][1]+1 == chB[1]
                        return 1
                    end
                    Judg.kin(chA, chB)
                end
            when 7
                if chA[:status] == 0
                    Judg.kaku(chA, chB)
                else
                    if chA[:place][0]+1 == chB[0] && chA[:place][1]-1 == chB[1]
                        return 1
                    elsif chA[:place][0]+1 == chB[0] && chA[:place][1] == chB[1]
                        return 1
                    elsif chA[:place][0]+1 == chB[0] && chA[:place][1]+1 == chB[1]
                        return 1
                    elsif chA[:place][0] == chB[0] && chA[:place][1]-1 == chB[1]
                        return 1
                    elsif chA[:place][0] == chB[0] && chA[:place][1]+1 == chB[1]
                        return 1
                    elsif chA[:place][0]-1 == chB[0] && chA[:place][1] == chB[1]
                        return 1
                    elsif chA[:place][0]-1 == chB[0] && chA[:place][1]-1 == chB[1]
                        return 1
                    elsif chA[:place][0]-1 == chB[0] && chA[:place][1]+1 == chB[1]
                        return 1
                    end
                    Judg.kaku(chA, chB)
                end
            when 8
                if chA[:place][0]+1 == chB[0] && chA[:place][1]-1 == chB[1]
                    return 1
                elsif chA[:place][0]+1 == chB[0] && chA[:place][1]+1 == chB[1]
                    return 1
                end
                Judg.kin(chA, chB)
            end
        end
        def self.kin(chA, chB)
            if chA[:place][0]+1 == chB[0] && chA[:place][1]-1 == chB[1]
                return 1
            elsif chA[:place][0]+1 == chB[0] && chA[:place][1] == chB[1]
                return 1
            elsif chA[:place][0]+1 == chB[0] && chA[:place][1]+1 == chB[1]
                return 1
            elsif chA[:place][0] == chB[0] && chA[:place][1]-1 == chB[1]
                return 1
            elsif chA[:place][0] == chB[0] && chA[:place][1]+1 == chB[1]
                return 1
            elsif chA[:place][0]-1 == chB[0] && chA[:place][1] == chB[1]
                return 1
            else
                return 0
            end
        end
        def self.kaku(chA, chB)
            ok = 0
            zen = chA[:place][0] - 1
            go = 9 - chA[:place][0]
            for i in 1..zen
                if chA[:place][0]-i == chB[0] && chA[:place][1]+i == chB[1]
                    ok = 1
                    break
                elsif chA[:place][0]-i == chB[0] && chA[:place][1]-i == chB[1]
                    ok = 1
                    break
                end
            end
            for i in 1..go
                if chA[:place][0]+i == chB[0] && chA[:place][1]+i == chB[1]
                    ok = 1
                    break
                elsif chA[:place][0]+i == chB[0] && chA[:place][1]-i == chB[1]
                    ok = 1
                    break
                end
            end
            if ok == 1
                return 1
            else
                return 0
            end
        end
    end
end