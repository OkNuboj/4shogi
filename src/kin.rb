require_relative "koma"

class kin
    include KomaBase
end

kin1 = Kin.new
kin1.id = 5001
kin1.place = [1, 4]
kin1.owner = 1
kin2 = Kin.new
kin2.id = 5002
kin2.place = [1, 6]
kin2.owner = 1
kin3 = Kin.new
kin3.id = 5003
kin3.place = [9, 4]
kin3.owner = 2
kin4 = Kin.new
kin4.id = 5004
kin4.place = [9, 6]
kin4.owner = 2