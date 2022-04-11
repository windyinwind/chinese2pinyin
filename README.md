# chinese2pinyin
Add pinyin on top of Chinese character for a file

# prerequisite
Install ruby package chinese_pinyin
`gem install chinese_pinyin`

# how to use
run 
`ruby output_pinyin.rb 'your_file'`

output file:
processed_'your_file' in the same dir

# note
Don't support cross-directory operations, below command will file
`ruby output_pinyin.rb 'paht/to/your_file'`

