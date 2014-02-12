#require 'mysql2'
#
## Work around latin1 database encoding in production by mapping it to utf8
#Mysql2::Client::CHARSET_MAP['latin1'] = Encoding::UTF_8
