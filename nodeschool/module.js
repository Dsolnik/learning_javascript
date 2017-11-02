var fs = require('fs')
var path = require('path')

var read_dir = function(dirname, extension_string, callback){
    fs.readdir(dirname, function(err, files){
        if (err){
            callback(err, null);
        }
        else{
            filtered_list = []
            files.forEach(function(file){
                if(path.extname(file) == '.' + extension_string)
                    filtered_list.push(file);
            })
            callback(null, filtered_list);
        }
    });
}

module.exports= read_dir;