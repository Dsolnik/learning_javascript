function putTextToBody(url){
    httpGetAsyncRequest(url, function(text) {
        var a = document.getElementById("toplace");
        a.innerHTML = JSON.stringify(text);
        }
    );
}

function httpGetAsyncRequest(url, callback){
    var xmlHttp = new XMLHttpRequest();
    xmlHttp.addEventListener("load", function(){ 
        if(xmlHttp.status >= 200 && xmlHttp.status < 400){
            // worked
            var data = JSON.parse(xmlHttp.responseText);
            callback(data);
        }else{
            console.log("error");
        }
    });
    xmlHttp.open("GET", url);
    xmlHttp.onerror = function(){
        console.log("error in connection")
    }
    xmlHttp.send()
 }
