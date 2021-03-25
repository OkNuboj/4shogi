require_relative "koma"

class Kin
    include KomaBase
    def content
        content = "金"
    end
end

class Kin1 < Kin
    def self.id
        5001
    end
    def self.place
        [1, 4]
    end
    def self.owner
        1
    end
end

class Kin2 < Kin
    def self.id
        5002
    end
    def self.place
        [1, 6]
    end
    def self.owner
        1
    end
end

class Kin3 < Kin
    def self.id
        5003
    end
    def self.place
        [9, 4]
    end
    def self.owner
        2
    end
end

class Kin4 < Kin
    def self.id
        5004
    end
    def self.place
        [9, 6]
    end
    def self.owner
        2
    end
end