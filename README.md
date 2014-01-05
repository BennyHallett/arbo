arbo
====

Command line password manager in Ruby


Proposed Usage
==============

`arbo` - Displays help
`arbo help` - Displays help
`arbo init $password` - Creates empty ~/.arbodb file, and encryts it
`arbo list` - Lists known password (keys only, not values DUH!)
`arbo set $key $value` - Sets password
`arbo generate $key` - Generates a new password and assigns it to the key
`arbo delete $key` - Deletes the password from the database
`arbo get $key` - Copies the password to the clipboard

Other required features
=======================

* Config file to set defaults such as password length
* Database probably needs a header to confirm if decrypted properly
