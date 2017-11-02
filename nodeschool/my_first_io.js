var fs = require('fs');
var buf = fs.readFileSync(process.argv[2]);
var num_new_lines = buf.toString().split('\n').length - 1;
console.log(num_new_lines);
