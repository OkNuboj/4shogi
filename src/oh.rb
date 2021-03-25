require_relative "koma"

class Oh
    include KomaBase
end

class Oh1 < Oh
    def self.content
        "王"
    end
    def self.id
        8001
    end
    def self.place
        [1, 5]
    end
    def self.owner
        1
    end
end

class Oh2 < Oh
    def self.content
        "玉"
    end
    def self.id
        8002
    end
    def self.place
        [9, 5]
    end
    def self.owner
        2
    end
end