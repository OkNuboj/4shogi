module Judge
    class Judg
        def self.ment(check, target)
            case (check[:id] / 100)
                when 1
                    if check[:nari] == 0
                        if check[:place][0]+1 == target[0] && check[:place][1] == target[1]
                            return 1
                        else
                            return 0
                        end
                    else
                        narikin(check, target)
                    end
                when 2
                    if check[:nari] == 0
                        if check[:place][1] > target[1]
                            return 1
                        else
                            return 0
                        end
                    else
                        narikin(check, target)
                    end
                when 3
                    if check[:nari] == 0
                        if check[:place][0]+2 == target[0] && check[:place][1]-1 == target[1]
                            return 1
                        elsif check[:place][0]+2 == target[0] && check[:place][1]+1 == target[1]
                            return 1
                        else
                            return 0
                        end
                    else
                        narikin(check, target)
                    end
                when 4
                    if check[:nari] == 0
                        if check[:place][0]+1 == target[0] && check[:place][1]-1 == target[1]
                            return 1
                        elsif check[:place][0]+1 == target[0] && check[:place][1] == target[1]
                            return 1
                        elsif check[:place][0]+1 == target[0] && check[:place][1]+1 == target[1]
                            return 1
                        elsif check[:place][0] == target[0] && check[:place][1]-1 == target[1]
                            return 1
                        elsif check[:place][0] == target[0] && check[:place][1]+1 == target[1]
                            return 1
                        elsif check[:place][0]-1 == target[0] && check[:place][1]-1 == target[1]
                            return 1
                        elsif check[:place][0]-1 == target[0] && check[:place][1]+1 == target[1]
                            return 1
                        end
                    else
                        narikin(check, target)
                    end
                when 5
                    narikin(check, target)
                when 6
                    if check[:nari] == 0
                        if check[:place][0] == target[0] || check[:place][1] == target[1]
                            return 1
                        else
                            return 0
                        end
                    else
                        if check[:place][0] == target[0] || check[:place][1] == target[1]
                            return 1
                        elsif check[:place][0]-1 == target[0] && check[:place][1]-1 == target[1]
                            return 1
                        elsif check[:place][0]-1 == target[0] && check[:place][1]+1 == target[1]
                            return 1
                        end
                        narikin(check, target)
                    end
                when 7
                    if check[:nari] == 0
                        ok = 0
                        zen = check[:place][0] - 1
                        go = 9 - check[:place][0]
                        for i in 1..zen
                            if check[:place][0]-i == target[0] && check[:place][1]+i == target[1]
                                ok = 1
                                break
                            elsif check[:place][0]-i == target[0] && check[:place][1]-i == target[1]
                                ok = 1
                                break
                            end
                        end
                        for i in 1..go
                            if check[:place][0]+i == target[0] && check[:place][1]+i == target[1]
                                ok = 1
                                break
                            elsif check[:place][0]+i == target[0] && check[:place][1]-i == target[1]
                                ok = 1
                                break
                            end
                        end
                        if ok == 1
                            return 1
                        else
                            return 0
                        end
                    else
                        if check[:place][0]+1 == target[0] && check[:place][1]-1 == target[1]
                            return 1
                        elsif check[:place][0]+1 == target[0] && check[:place][1] == target[1]
                            return 1
                        elsif check[:place][0]+1 == target[0] && check[:place][1]+1 == target[1]
                            return 1
                        elsif check[:place][0] == target[0] && check[:place][1]-1 == target[1]
                            return 1
                        elsif check[:place][0] == target[0] && check[:place][1]+1 == target[1]
                            return 1
                        elsif check[:place][0]-1 == target[0] && check[:place][1] == target[1]
                            return 1
                        elsif check[:place][0]-1 == target[0] && check[:place][1]-1 == target[1]
                            return 1
                        elsif check[:place][0]-1 == target[0] && check[:place][1]+1 == target[1]
                            return 1
                        end
                        ok = 0
                        zen = check[:place][0] - 1
                        go = 9 - check[:place][0]
                        for i in 1..zen
                            if check[:place][0]-i == target[0] && check[:place][1]+i == target[1]
                                ok = 1
                                break
                            elsif check[:place][0]-i == target[0] && check[:place][1]-i == target[1]
                                ok = 1
                                break
                            end
                        end
                        for i in 1..go
                            if check[:place][0]+i == target[0] && check[:place][1]+i == target[1]
                                ok = 1
                                break
                            elsif check[:place][0]+i == target[0] && check[:place][1]-i == target[1]
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
                when 8
                    if check[:place][0]-1 == target[0] && check[:place][1]-1 == target[1]
                        return 1
                    elsif check[:place][0]-1 == target[0] && check[:place][1]+1 == target[1]
                        return 1
                    end
                    narikin(check, target)
                end
            end
        end
        def self.narikin(check, target)
            if check[:place][0]+1 == target[0] && check[:place][1]-1 == target[1]
                return 1
            elsif check[:place][0]+1 == target[0] && check[:place][1] == target[1]
                return 1
            elsif check[:place][0]+1 == target[0] && check[:place][1]+1 == target[1]
                return 1
            elsif check[:place][0] == target[0] && check[:place][1]-1 == target[1]
                return 1
            elsif check[:place][0] == target[0] && check[:place][1]+1 == target[1]
                return 1
            elsif check[:place][0]-1 == target[0] && check[:place][1] == target[1]
                return 1
            else
                return 0
            end
        end
end