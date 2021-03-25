require_relative "koma"

class Kyo
    include KomaBase
    def self.content
        "香"
    end
    def self.naricon
        "杏"
    end
end

class Kyo1 < Kyo
    def self.id
        2001
    end
    def self.place
        [1, 1]
    end
    def self.owner
        1
    end
end

class Kyo2 < Kyo
    def self.id
        2002
    end
    def self.place
        [1, 9]
    end
    def self.owner
        1
    end
end

class Kyo3 < Kyo
    def self.id
        2003
    end
    def self.place
        [9, 1]
    end
    def self.owner
        2
    end
end

class Kyo4 < Kyo
    def self.id
        2004
    end
    def self.place
        [9, 9]
    end
    def self.owner
        2
    end
end