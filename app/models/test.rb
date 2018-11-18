class Test
    def detect arr
        detection = arr.select { |e| arr.count(e) > 1 }
        detection.length rescue  0
    end


    def main
        input= gets.chomp.to_s.split ''
        detect input
    end

end
