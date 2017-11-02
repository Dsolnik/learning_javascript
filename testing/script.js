

document.addEventListener("DOMContentLoaded", function(){
    for(let i = 0; i < 5; i++){
        const newElement = document.createElement('button');
        newElement.innerHTML = "Button " + (i + 1);
        newElement.id = "button" + (i + 1);
        newElement.onmouseover = function(){
            newElement.innerHTML = newElement.innerHTML.toUpperCase();
            this.addEventListener("mouseout", function(){
                newElement.innerHTML = newElement.innerHTML.toLowerCase();             
            });
        }
        // newElement.onmouseout = function(){
        //     newElement.innerHTML = newElement.innerHTML.toLowerCase();
        // }
        document.body.appendChild(newElement);
    }
    const newDiv = document.createElement('div');
    Object.assign(newDiv, {
        width : '100%',
        height : '20%',
        id : 'rotating-div'   
    });
    document.body.appendChild(newDiv);
    for(let i = 0; i < 5; i ++){
        const newElement = document.createElement('button');
        Object.assign(newElement, {
            id : "element" + (i + 1),
            innerHTML : (i + 1),
        })
        newDiv.appendChild(newElement);
        newElement.addEventListener("mouseover", function mouseevent(){
            this.removeEventListener("mouseover", mouseevent);
            setTimeout(function(){
                const clone = this.cloneNode(true);
                clone.onmouseover = mouseevent;
                this.remove();
                newDiv.appendChild(clone);
                console.log("cool");    
            }.bind(this), 1000);
        });
    }
});

document.addEventListener("mouseover", function(event){
    if(event.target.matches("button")){
        event.target.innerHTML = event.target.innerHTML.toUpperCase();
    }
});

document.addEventListener("mouseout", function(event){
    if(event.target.matches("button")){
        event.target.innerHTML = event.target.innerHTML.toLowerCase();
    }
});



