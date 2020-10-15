require "byebug"

class Array
    def remove_dups
        h = {}
        self.each do |ele|
            h[ele] = true
        end
        h.keys
    end

    def two_sum
        arr = []
        (0...length - 1).each do |i|
            (i + 1...length).each do |i2|
                arr << [i, i2] if self[i] + self[i2] == 0
            end
        end
        return arr
    end

    def my_transpose
        a = Array.new(length) {Array.new(length)}
        self.each_with_index do |row, i1|
            row.each_with_index do |ele, i2|
                a[i2][i1] = ele
            end
        end
        a
    end

    def stock_picker
        output = []
        dif = 0
        # debugger
        self.each_with_index do |el1, id1|
            self[id1+1..-1].each_with_index do |el2, id2|
                if el2 - el1 > dif
                    dif = el2 - el1
                    output = [id1, id2 + id1 + 1]
                end 
            end
        end
        output
    end
end