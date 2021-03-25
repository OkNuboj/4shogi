require_relative "koma"

class Kei
    include KomaBase
    def self.content
        "桂"
    end
    def self.naricon
        "圭"
    end
end

class Kei1 < Kei
    def self.id
        3001
    end
    def self.place
        [1, 2]
    end
    def self.owner
        1
    end
end

class Kei2 < Kei
    def self.id
        3002
    end
    def self.place
        [1, 8]
    end
    def self.owner
        1
    end
end

class Kei3 < Kei
    def self.id
        3003
    end
    def self.place
        [9, 2]
    end
    def self.owner
        2
    end
end

class Kei4 < Kei
    def self.id
        3004
    end
    def self.place
        [9, 8]
    end
    def self.owner
        2
    end
end