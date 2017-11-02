var fs = require ('fs');
var dir_name = process.argv[2];
var extension_type = process.argv[3];
var new_list = []
fs.readdir(dir_name, function(err, list){
    if (err) return console.error(err)
    list.forEach(function(value){
        if(value.endsWith('.' + extension_type)){
            new_list.push(value);
        }
    });
    for(var i = 0; i < new_list.length; i++){
        console.log(new_list[i]);
    }
});

var fs = require('fs')
var path = require('path')

var folder = process.argv[2]
var ext = '.' + process.argv[3]

fs.readdir(folder, function (err, files) {
    if (err) return console.error(err)
    files.forEach(function (file) {
        if (path.extname(file) === ext) {
            console.log(file)
        }
    })
})
