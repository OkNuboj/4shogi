=begin
駒の基本プログラム
n>00, 1<=x<=9, 1<=y<=9
空:xy0
歩:10n 香:20n 圭:30n 銀:40n 金:50n 飛:60n 角:70n
と:11n 馨:21n 銈:31n 艮:41n        龍:61n 馬:71n
王:80n 玉:81n
=end

module KomaBase
    attr_accessor :id
    attr_accessor :place
    attr_accessor :owner
    attr_accessor :content
    attr_accessor :naricon
end