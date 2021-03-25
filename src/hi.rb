require_relative "koma"

class Hi
    include KomaBase
    def self.content
        content = "飛"
    end
    def self.naricon
        naricon = "龍"
    end
end

class Hi1 < Hi
    def self.id
        6001
    end
    def self.place
        [2, 2]
    end
    def self.owner
        1
    end
end

class Hi2 < Hi
    def self.id
        6002
    end
    def self.place
        [8, 8]
    end
    def self.owner
        2
    end
end