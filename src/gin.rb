require_relative "koma"

class Gin
    include KomaBase
end

gin1 = Gin.new
gin1.id = 4001
gin1.place = [1, 3]
gin1.owner = 1
gin2 = Gin.new
gin2.id = 4002
gin2.place = [1, 7]
gin2.owner = 1
gin3 = Gin.new
gin3.id = 4003
gin3.place = [9, 3]
gin3.owner = 1
gin4 = Gin.new
gin4.id = 4004
gin4.place = [9, 7]
gin4.owner = 1