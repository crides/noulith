if exists('b:current_syntax')
    finish
endif

setlocal iskeyword+=',?

syntax case match

syntax keyword Keyword if else while for yield into switch case null and or coalesce break try catch throw continue return consume pop remove swap every struct freeze import literally _
syntax keyword Keyword R F V
syn keyword Function argv
syn keyword Function abs acos acosh aes128_hazmat_decrypt_block aes128_hazmat_encrypt_block aes256_gcm_decrypt aes256_gcm_encrypt all and' any anything append append_file apply asin asinh assert atan atan2 atanh base64_decode base64_encode blake3 bool butlast by bytes cbrt ceil choose chr combinations complex complex_parts const contains
syn keyword Function cos cosh count cycle debug default denominator dict discard drop each echo ends_with enumerate env_var eval even exp factorize false filter find find? first flat_map flatten flip float floor flush fold frequencies from func gcd group group_all hex_decode hex_encode id imag_part in index index? input insert int int_radix interact iota is is_alnum is_alpha is_ascii is_digit is_lower is_prime is_space is_upper items iterate join json_decode json_encode keys last lcm len lines list list_files ln locate locate? log10 log2
syn keyword Function lower map map_keys map_values max md5 memoize merge min not not_in now nulltype number numerator odd of on only or' ord pairwise partition permutations prefixes print product random random_bytes random_range rational read read_file read_file? read_file_bytes read_file_bytes? real_part reject repeat replace request request_bytes request_json reverse round rsplit satisfying scan search search_all second set sha256 shuffle signum sin sinh sleep sort split split_re splitn sqrt starts_with str str_radix stream strip strip_end strip_start subsequences subtract suffixes sum tail take tan tanh then third til time to transpose trim trim_end trim_start true type uncons uncons? unique unlines unsnoc unsnoc? unwords upper utf8_decode utf8_encode values vars vector window with words write write_file xor zip ziplongest

syn match Number "\<[0-9]\+\>\|\<0[xX][0-9a-fA-F]\+\>\|\<0[oO][0-7]\+\>\|\<0[bB][10]\+\>"

syn match noulithEmbedded /\\[\\"'ntbrf]/ contained
syn match noulithEmbedded /\\"/ contained
syn match noulithEmbedded /\\'/ contained
hi def link noulithEmbedded Identifier
syn region String start='"' end='"' contains=noulithEmbedded
syn region String start="[a-z0-9]\@<!'" end="'" contains=noulithEmbedded

syn match Operator "[-!$%&*+-./<=>@^|~]\+"
syn match Keyword "[\:]"

syn match Comment "#(\@!.*$"
syn region noulithMultilineComment start="#(" end=")" contains=noulithMultilineNest
" stupid padding so the opening parenthesis doesn't also contribute to depth
syn region noulithMultilineNest start="\(..\)\@<=(" end=")" contained contains=noulithMultilineNest
hi def link noulithMultilineComment Comment
hi def link noulithMultilineNest Comment

set commentstring=#%s

let b:current_syntax = 'noulith'
