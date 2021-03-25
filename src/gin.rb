require_relative "koma"

class Gin
    include KomaBase
    def self.content
        "銀"
    end
    def self.naricon
        "全"
    end
end

class Gin1 < Gin
    def self.id
        4001
    end
    def self.place
        [1, 3]
    end
    def self.owner
        1
    end
end

class Gin2 < Gin
    def self.id
        4002
    end
    def self.place
        [1, 7]
    end
    def self.owner
        1
    end
end

class Gin3 < Gin
    def self.id
        4003
    end
    def self.place
        [9, 3]
    end
    def self.owner
        2
    end
end

class Gin4 < Gin
    def self.id
        4004
    end
    def self.place
        [9, 7]
    end
    def self.owner
        2
    end
end