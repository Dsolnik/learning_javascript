// CLOSURE
// PRINTS OUT 6 5 times
for (var i = 0; i <=5; i++){
    setTimeout(function(){
        console.log("i: " + i);
    }, i * 1000);
}
// PRINTS OUT 1,2,3,4,5
for (var i = 0; i <=5; i++){
    let j = i;
    setTimeout(function(){
        console.log("i: " + j);
    }, i * 1000);
}

for (let i = 1; i <= 5; i++){
    setTimeout(function(){
        console.log("i: " + i);
    }, i*1000);
}

for (var i = 0; i <=5; i++){
    (function(i){
        setTimeout(function(){
            console.log("i: " + i);
        }, i * 1000);
    })(i);
}

//PROTOTYPE CHAIN

function Foo(who){
    this.me = who;
}
Foo.prototype.identify = function(){
    return "I am " + this.me;
}

var a1 = new Foo("a1");
a1.identify(); // "I am a1"


a1.speak = function(){
    console.log("Hello,", this.identify());
}
a1.speak(); // Hello, I am a1

a1.identify = function(){
    alert("hello, " + this.__proto__.identify() + ".");
}
a1.identify(); // "Hello I am undefined"

a1.identify = function(){
    alert("hello, " + this.__proto__.identify.call(this) + ".");
}
a1.identify(); // "Hello I am a1"

