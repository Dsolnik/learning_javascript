args = process.argv;
len = args.length;
sum = 0;
for(var i = 2; i < args.length; i++){
    sum += Number(args[i]);
}
console.log(sum);
