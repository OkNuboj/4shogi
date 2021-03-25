require_relative "koma"

class Kyo
    include KomaBase
end

kyo1 = Kyo.new
kyo1.id = 2001
kyo1.place = [1, 1]
kyo1.owner = 1
kyo2 = Kyo.new
kyo2.id = 2002
kyo2.place = [1, 9]
kyo2.owner = 1
kyo3 = Kyo.new
kyo3.id = 2003
kyo3.place = [9, 1]
kyo3.owner = 2
kyo4 = Kyo.new
kyo4.id = 2004
kyo4.place = [9, 9]
kyo4.owner = 2