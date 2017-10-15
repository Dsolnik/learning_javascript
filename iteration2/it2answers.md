This iteration, as you go through WRITE DOWN as much as you can with code samples.

An easy way to write quick code snippets is to use something like www.codepen.io or just execute right in the browser console.

Save these snippets to later show me what you learned and demonstrated through the code.

For the project, make sure you understand what EVERY line of your code does. Have a motive behind writing each line and understand how it works. 

#Part 0 (Debugging)
https://www.codeschool.com/courses/discover-devtools

You do not have to complete all sections or go through this that rigorously. It's important though that you know what tools are available. It'll help you get a better grasp on the underlying mechanisms of Javascript and get through bugs in your project code. 

#Part 1 (Project-oriented)
##Questions to answer for project prior to completion
1. How are Javascript files loaded? 
    They are loaded in sequence unless marked with the async or defer attribute. If they have defer the defers are executed in order but async is unpredictable.
2. What is the DOM? 
    Document Object Model. Documents are ordered like a tree.
3. What is AJAX? Explain in as much detail as possible.
    AJAX is a way to communicate with a server and exchange data so you can update the page or the server. It communicates using HTTP. It can be used asyncronously so it can happen in the background while the page loads. AJAX is that stuff we do when we do hhtpRequest.


##Project Summary (Part 1 should be completed)
Create a web page with a button that says "Get Menu" on it. Upon clicking it,
it should load all the data at a given endpoint by sending an HTTP Request and display it below the button dynamically (that is without refreshing the page).

The endpoint: http://demo3354820.mockable.io/menu/sushi

###Requirements
The project should be submitted within this repository under the directory iteration1
####Folder structure
/index.html
/script.js
/style.css

####Layout
Button should be colored.
Button should be centered into the middle of the page.

####Functionality
The button should send a certain type of request to this API endpoint.
You are limited to the following tools:
* Vanilla Javascript (no transpilers, NO JQUERY)
* CSS
* HTML

No other tools are allowed.


---
#Part 2: (Fundamentals of Javascript) (spend a decent chunk of time on this this week at least 1 hour just reading and writing code that tests concepts)
Watch:
Frontendmasters: From fundamentals to functional js finish functions, nesting, scope.

Read: 
http://javascriptissexy.com/understand-javascript-callback-functions-and-use-them/

##Functions and JS Fundamentals 
For this section, I want you to write code that tests out and demonstrates the concepts below
Write a pure function. Write a non-pure function. Then explain why this is important in programming
```javascript
   a = {value : 5}
   var pure_add_two = function(a){
        return a + 2
   }
   
   var x = pure_add_two(3) // has no effect on the state of a
   
   var impure_add_two = function(a){
        a.value +=2
   }
   
   a.value // 5
   x = impure_add_two(a) // this function changes the state of a
   a.value // 7
   
    
```

Write code that tests and demonstrates the prototype chain.

```javascript
    Object.prototype.a = 3;
    var obj = {}
    obj.a // 3
    
    var Thing = function(name){
        this.name = name;
    }
    
    Thing.prototype.getName = function(){
        return this.name;
    }
    
    var thing = new Thing("cool")
    thing.getName // cool
    var Other = function(name){
        Thing.call(this, name) // this runs the Thing constructor
        this.name2 = "memes"
    }
    
    Other.prototype.kind = "otherthing"
    Other.prototype = new Thing() // this makes the prototype of Thing2 Thing and lets it access the properties of Thing
    var other = new Other("dank")
    other.getName() //"dank"
    other.name2 // "memes"
    other.kind // "otherthing"
```

Write code that shows that many things in Javascript is an object.

```javascript
    var a = {}
    var b = []
    var c = function(){}
    a instanceof Object \\ true
    b instanceof Object \\ true
    c instanceof Object \\ true
    
```

Write some IIFEs.

```javascript
    (function(){
        var a = "cool"
        console.log(a)
    })();
    
    console.log(a) // undefined
```

* What is the prototype chain?
    The prototype chain is a chain associated with each object that determines what attributes and methods an object can acess. It terminates in NULL. When you check a variables property, the browser searches through the prototype chain for the property.
* What is a pure function?
    A pure function is a function with no side effects. 
* In Javascript, people frequently say everything is an object. Explain what this means
    You can put properties on almost everything. 
* Does Javascript have block scope? 
    No. Functions determine scope.
* What is an IIFE?
    Immediately Invoked Function Expression. Used to preserve global namespace. 
---
#Part 3: Project Expansions
* What is MVC? How does it compare to the idea of separation of presentation and content?
    Webpages are divided into 3 sections.
    
    model - The core of the page. Determines what to do when events are triggered, databased calls, etc.
    
    view - everything that you see, the UI.
    
    controller - Reacts to events and calls the model

Now read this:
https://addyosmani.com/resources/essentialjsdesignpatterns/book/#singletonpatternjavascript
Read on the following patterns:
1. Constructor
2. Singleton

Implement the constructor pattern for your project above.

If you have time read a little bit on the module pattern.

#Part 4: Review
Is javascript a functional or object-oriented language?  
    it can be used as both. it has a little bit of both.
What do first-class functions offer to javascript programmers?  
    Greater abstraction and less code repetition. Also a ton of asyncronous stuff.
#Part 5: Supplement
What are the five categories of status codes?
* 1xx Informational
* 2xx Success
* 3xx Redirection
* 4xx Client Error
* 5xx Server Error

Memorize the following status codes:
200 OK; 
401 Unauthorized Access -need authentication
403 Forbidden Access - don't try to access it again
404 Not Found
500 Internal Service Error
