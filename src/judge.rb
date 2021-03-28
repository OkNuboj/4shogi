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
end