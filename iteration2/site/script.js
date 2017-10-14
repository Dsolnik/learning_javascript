function httpRequest(url, callback){
    var req = new XMLHttpRequest();
    req.onreadystatechange = function(){
        if(this.readyState == req.DONE && this.status == 200){
            callback(this.responseText);
        }else if(this.readyState == req.DONE){
            console.log("error connecting");
        }
    }
    req.open("GET", url);
    req.send();
}

function loadSushi(){
    httpRequest("http://demo3354820.mockable.io/menu/ushi", function(text){
        var a = document.getElementById('toplace');
        a.innerHTML = JSON.stringify(text)
    })
}
