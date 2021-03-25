require_relative "koma"

class Hi
    include KomaBase
    def content
        content = "飛"
    end
    def naricon
        naricon = "龍"
    end
end

hi1 = Hi.new
hi1.id = 6001
hi1.place = [2, 2]
hi1.owner = 1
hi2 = Hi.new
hi2.id = 6002
hi2.place = [8, 8]
hi2.owner = 2