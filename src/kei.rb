require_relative "koma"

class Kei
    include KomaBase
    def content
        content = "桂"
    end
    def naricon
        naricon = "圭"
    end
end

kei1 = Kei.new
kei1.id = 3001
kei1.place = [1, 2]
kei1.owner = 1
kei2 = Kei.new
kei2.id = 3002
kei2.place = [1, 8]
kei2.owner = 1
kei3 = Kei.new
kei3.id = 3003
kei3.place = [9, 2]
kei3.owner = 2
kei4 = Kei.new
kei4.id = 3004
kei4.place = [9, 8]
kei4.owner = 2