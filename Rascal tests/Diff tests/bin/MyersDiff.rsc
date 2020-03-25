module MyersDiff

import Prelude;

public str extractFile(str path){
	locTemp = |file:///|;
	return readFile(locTemp+path);
}

public list[value] diff(str path1, str path2){
	//Create arrays
	list1 = split("\n", extractFile(path1));
	list2 = split("\n", extractFile(path2));
	
	//Local vars
	maxA = size(list1);
	maxB = size(list2);
	tuple[int x, list[value] history] firstValue = < 0, [] >;
	frontier = (1: firstValue);
	old_x = -1;
	x = -1;
	y = -1;
	history = [];
	removeSignal = "Remove";
	insertSignal = "Insert";
	keepSignal = "Keep";
	
	for(d <- [0 .. maxA+maxB+1]){
		for(k <- [interval | int interval <- [-d .. d+1], 
			interval % 2 == 0 && d % 2 == 0 || interval % 2 != 0 && d % 2 != 0]){ 
			//That would have been way easier if Rascal allowed looping by steps of two
			if(k == -d || (k != d && frontier[k-1].x < frontier[k+1].x)){
				old_x = frontier[k+1].x;
				history = frontier[k+1].history;
				x = old_x;
				y = x - k;
				if(1 <= y && y < maxB)
					history += insertSignal+" "+list2[y-1];
			}else{
				old_x = frontier[k-1].x;
				history = frontier[k-1].history;
				x = old_x+1;
				y = x-k;
				if(1 <= x && x < maxA)
					history += removeSignal+" "+list1[x-1];
			}
			while(x < maxA && y < maxB && list1[x] == list2[y]){
				x+= 1;
				y+= 1;
				history += keepSignal+" "+list1[x-1];
			}
			if(x>= maxA && y >= maxB)
				return history;
			else{
				tuple[int x, list[value] history] newValue = < x, history >;
				frontier[k] = newValue;
			}
		}
	}
}

public test bool remove(){
	result = diff("D:/Projets/CodeDiffing/DiffFiles/fileA1.txt", "D:/Projets/CodeDiffing/DiffFiles/fileA2.txt");
	correct = ["Keep Line 1\r", "Remove Line 2\r","Keep Line 3"];
	return result == correct;
}


public test bool add(){
	result = diff("D:/Projets/CodeDiffing/DiffFiles/fileA2.txt", "D:/Projets/CodeDiffing/DiffFiles/fileA1.txt");
	correct = ["Keep Line 1\r", "Insert Line 2\r","Keep Line 3"];
	return result == correct;
}

public test bool keep(){
	result = diff("D:/Projets/CodeDiffing/DiffFiles/fileA2.txt", "D:/Projets/CodeDiffing/DiffFiles/fileA2.txt");
	correct = ["Keep Line 1\r", "Keep Line 3"];
	return result == correct;
}