function putTextToBody(url){
    console.log("GOT HERE");
    httpGetAsyncRequest(url, function(text) {
        var a = document.getElementById("toplace");
        a.innerHTML = text
        }
    );
}

function httpGetAsyncRequest(url, callback){
    var xmlHttp = new XMLHttpRequest();
    xmlHttp.addEventListener("load", function(){ 
        callback(this.responseText) });
    xmlHttp.open("GET", url);
    xmlHttp.send()
}