require_relative "koma"

class Oh
    include KomaBase
end

oh1 = Oh.new
oh1.id = 8001
oh1.place = [1, 5]
oh1.owner = 1
oh2 = Oh.new
oh2.id = 8002
oh2.place = [9, 5]
oh2.owner = 2