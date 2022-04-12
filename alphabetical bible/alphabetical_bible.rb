kjv = File.read("kjv.txt").gsub(/[^a-zA-Z]+/, ' ').split

word_hash = Hash.new(0)

kjv.each do |word|
	word_hash[word] += 1
end

word_hash_alpha_sorted = word_hash.sort.to_h

sorted = []

word_hash_alpha_sorted.each do |word, count|
	count.times do |i|
		sorted << "#{word} "
	end
	sorted << "#{$/}"
end

word_hash_num_sorted = word_hash.sort_by {|k,v| v}.reverse.to_h

stats = ""

word_hash_num_sorted.each do |word, count|
	stats += "#{word}: #{count}#{$/}"
end

File.open('sorted_kjv.txt', 'w') { |f| f.write sorted.join }
File.open('stats.txt', 'w') { |f| f.write stats}
