require_relative "koma"

class Kaku
    include KomaBase
    def self.content
        "角"
    end
    def self.naricon
        "馬"
    end
end

class Kaku1 < Kaku
    def self.id
        7001
    end
    def self.place
        [2, 8]
    end
    def self.owner
        1
    end
end

class Kaku2 < Kaku
    def self.id
        7002
    end
    def self.place
        [8, 2]
    end
    def self.owner
        2
    end
end