#!/usr/bin/lua

-- table for morse code values
l_code = {}

l_code[".-"]    = 'a'
l_code["-..."]  = 'b'
l_code["-.-."]  = 'c'
l_code["-.."]   = 'd'
l_code["."]     = 'e'
l_code["..-."]  = 'f'
l_code["--."]   = 'g'
l_code["...."]  = 'h'
l_code[".."]    = 'i'
l_code[".---"]  = 'j'
l_code["-.-"]   = 'k'
l_code[".-.."]  = 'l'
l_code["--"]    = 'm'
l_code["-."]    = 'n'
l_code["---"]   = 'o'
l_code[".--."]  = 'p'
l_code["--.-"]  = 'q'
l_code[".-."]   = 'r'
l_code["..."]   = 's'
l_code["-"]     = 't'
l_code["..-"]   = 'u'
l_code["...-"]  = 'v'
l_code[".--"]   = 'w'
l_code["-..-"]  = 'x'
l_code["-.--"]  = 'y'
l_code["--.."]  = 'z'
l_code["-----"] = '0'
l_code[".----"] = '1'
l_code["..---"] = '2'
l_code["...--"] = '3'
l_code["....-"] = '4'
l_code["....."] = '5'
l_code["-...."] = '6'
l_code["--..."] = '7'
l_code["---.."] = '8'
l_code["----."] = '9'

-- adding inverse of table
r_code = {}
for k, v in pairs(l_code) do
	r_code[v] = k
end

-- returns array table of strings seperated by the deliminator
function split_string(str, delim)
	local d_len      = #delim
	local last_index = 0 - d_len
	local next_word  = 1
	local result     = {}
	
	for i = 1, #str do
		local chunk = string.sub(str, i, i + d_len - 1)
		
		if chunk == delim then
			result[next_word] = string.sub(str, last_index + d_len, i - 1)
			last_index        = i
			next_word         = next_word + 1
		end
	end
	
	-- adding the last chunk
	result[next_word] = string.sub(str, last_index + d_len, #str)
	return result
end

-- takes string of alphanumeric characters and returns a new string in
--  morse code
function translate_to_morse(input)
	local str    = string.lower(input)
	local words  = split_string(str, " ")
	local result = ""
	
	for i= 1, #words do
		for j= 1, #words[i] do
			local letter = string.sub(words[i], j, j)
			
			if r_code[letter] then
				result = result .. r_code[letter]
				result = result .. " "
			end
		end
		
		-- adding a slash to distinguish separate words
		result = result .. "/"
	end
	
	-- removing last spaces
	return string.sub(result, 1, #result - 2)
end

-- takes a morse code string and returns a new string in alpha-numeric
--  characters
function translate_from_morse(str)
	local words  = split_string(str, "/")
	local result = ""
	
	for i= 1, #words do
		local letters = split_string(words[i], " ")
		
		for j= 1, #letters do
			if l_code[letters[j]] then
				result = result .. l_code[letters[j]]
			end
		end
		
		result = result .. " "
	end
	
	-- removing the last space
	return string.sub(result, 1, #result - 1)
end

-- main
if arg[1] == "-e" and #arg == 2 then
	print(translate_to_morse(arg[2]))
elseif arg[1] == "-d" and #arg == 2 then
	print(translate_from_morse(arg[2]))
else
	print("usage: " .. arg[0] .. "  <-e | -d> message")
end
