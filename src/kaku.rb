require_relative "koma"

class Kaku
    include KomaBase
    def content
        content = "角"
    end
    def naricon
        naricon = "馬"
    end
end

kaku1 = Kaku.new
kaku1.id = 7001
kaku1.place = [2, 8]
kaku1.owner = 1
kaku2 = Kaku.new
kaku2.id = 7002
kaku2.place = [8, 2]
kaku2.owner = 2