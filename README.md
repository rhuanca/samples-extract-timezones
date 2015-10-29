# samples-extract-timezones
Sample usage: 
>./read.pl /usr/share/zoneinfo/posix > out.txt

To import result to mongo: 
> mongoimport --db test --collection timezones --file timezones.json

Script to write sorted output to a file:
cursor = db.getCollection('timezones').find({}, {tz:1, posix:1,_id:0}).sort({tz:1})
while(cursor.hasNext()) {
  printjsononeline(cursor.next());
}

To execute query: 
> mongo --quiet query.js > result.json

