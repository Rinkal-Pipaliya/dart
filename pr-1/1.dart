void main(){

  List<int> negative = [5,-3,-4,-5,-3,2,3,-1,0,1,];

  print(" Negative Elements in the Array ");

  for(var num in negative){
    if(num < 0){
      print(num);
    }

  } 
}