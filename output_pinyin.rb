require 'chinese_pinyin'

def generate_space(num)
    spaces = ''
    while num > 0
        spaces << ' '
        num -= 1
    end
    return spaces
end

def align_hanzi_pinyin(line, processed_line, standard_space_num)
    pinyins = processed_line.split(' ')
    hanzis = line.split('')
    spaces_delta = []
    pinyins.each_with_index do |pinyin, index|
        spaces_delta << (pinyin.bytesize - hanzis[index].bytesize) # one chinese character contains 2 bytes
    end
    
    deli = generate_space(standard_space_num)
    
    pinyin_line = processed_line.split(' ').join(deli) << "\n"
    hanzi_line = ''

    spaces_delta.each_with_index do |space_d, index|
        total_space = generate_space(standard_space_num + space_d)
        hanzi_line << hanzis[index] << total_space
    end
    hanzi_line << "\n"

    return pinyin_line, hanzi_line
    
end

## Start 
origFile = ARGV[0]

if origFile == ''
    exit('file not found')
end

fileWithPinyin = 'processed_' + origFile 

File.foreach(origFile) {
    | line | 
    processd_line = Pinyin.t(line, tonemarks: true)
    pinyin_line, hanzi_line = align_hanzi_pinyin(line, processd_line, 4)
    File.write(fileWithPinyin, pinyin_line , mode: "a")
    File.write(fileWithPinyin, hanzi_line , mode: "a")
    
}

