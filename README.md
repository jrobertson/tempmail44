# Introducing the TempMail44 gem

## Usage

    require 'tempmail44'

    tm = TempMail44.new host: 'temp-mail44.p.rapidapi.com', apikey: 'YOUR-API-KEY', debug: true
    tm.create

    tm.email #=> 6wl254jvn@bestparadize.com
    r = tm.read
    r.first.subject #=> 'Test123'

    # ... opening a new IRB session

    tm = TempMail44.new host: 'temp-mail44.p.rapidapi.com', apikey: 'YOUR-API-KEY', debug: true
    tm.email = '6wl254jvn@bestparadize.com'
    r = tm.read
    r.first.subject #=> 'Test123'

## Resources

* https://github.com/jrobertson/tempmail44

tempmail44 tempmail email temp
