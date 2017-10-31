include camera.h
using namespace std;

class Lot{
	public
		Lot();
		Lot(string);
		~Lot();
		addLot(string);
		removeLot(int);
		viewCount(int);
	private
		list<int> lotList;
		string lotName;
		list<Camera> camList;
}

Lots(){
	lotList = NULL;
	lotName = NULL;
	camList = new CamList();
};

Lots(string name){
	lotList = new list<Lot>;
	lotName = name;
	camList = new camList();
};

addLot(Lot){
	insert into "db" Lot, lot.lotName; 
};

removeLot(Lot){
	remove * from "db" where lotName like Lot.name;  	
};

