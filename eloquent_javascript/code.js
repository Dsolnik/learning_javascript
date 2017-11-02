 for(let i= 1; i <= 7; i++){
         console.log("#".repeat(i));
 }
 // Fizz Buzz
 for(let i = 1; i <= 100; i++){
    to_print = "";
    if(i % 3 == 0){
        to_print += "Fizz";
    }
    if(i % 5 == 0){
        to_print += "Buzz";
    }
    if(!to_print){
        to_print += i;
    }
    console.log(to_print);
 }
// Board
generate_board = function(size){
    for(let i = 0; i < size; i++){
    curr_line =""; 
    for(let j = 0; j < size; j++){
        curr_line += (j + i) % 2 ? "#" : " ";
    }   
    console.log(curr_line);
    }   
}

// Reverse array in place 
reverseArrayInPlace = function (arr){
	for(let i = 0; i < arr.length / 2; i++){
        let temp = arr[i];
		arr[i] = arr[arr.length - i - 1];
		arr[arr.length - i - 1] = temp;
    }
}
