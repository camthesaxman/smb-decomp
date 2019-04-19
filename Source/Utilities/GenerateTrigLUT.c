//Includes
#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>
#include <stdlib.h>
#include <string.h>
#include <limits.h>

//Constants
#define SIZEOF_LUT	16392
#define OFFS_SIN_LUT	0x181920
#define OFFS_TAN_LUT	0x191940
#define NEXT_INT(fp)	(getc(fp)<<24)|(getc(fp)<<16)|(getc(fp)<<8)|getc(fp)

//!!UNION HACK!!
//For converting between int and float
typedef union {
	uint32_t i;
	float f;
} if_t;
uint32_t toInt(float x) {
	if_t cvt;
	cvt.f = x;
	return cvt.i;
}
float toFloat(uint32_t x) {
	if_t cvt;
	cvt.i = x;
	return cvt.f;
}

//Print usage
void printUsage() {
	printf("Usage: GenerateTrigLUT [pathToSMB1Dol]\n");
}

//Main function
int main(int argc, char ** argv) {
	//Check if floats are 32 bits (they usually are, but just to be safe)
	if((CHAR_BIT*sizeof(float))!=32) {
		fprintf(stderr,"ERROR: `float` type is not 32 bits.\n"
			"What kind of compiler are you using?!\n");
		return -1;
	}
	//Check if argc is 2
	if(argc!=2) {
		fprintf(stderr,"ERROR: Unexpected parameter count.\n");
		printUsage();
		return -1;
	}
	//Open our `.dol` file, and check to see if we can read it
	FILE * filePointer = fopen(argv[1],"rb");
	if(filePointer==NULL) {
		fprintf(stderr,"ERROR: Could not open file (for reading).\n");
		return -1;
	}
	//Same with output file (we use a default filename here)
	FILE * outFP = fopen("output.txt","w");
	if(outFP==NULL) {
		fprintf(stderr,"ERROR: Could not open file `output.txt` (for writing).\n");
		return -1;
	}
	
	//Copy our data
	fseek(filePointer,OFFS_SIN_LUT,SEEK_SET);
	for(int i=0; i<SIZEOF_LUT; i+=8) {
		for(int j=0; j<8; j++) {
			fprintf(outFP,"%ff, ",toFloat(NEXT_INT(filePointer)));
		}
		fprintf(outFP,"\n");
	}
	
	//Close output file and open a new one for the other LUT
	fclose(outFP);
	outFP = fopen("output2.txt","w");
	if(outFP==NULL) {
		fprintf(stderr,"ERROR: Could not open file `output.txt` (for writing).\n");
		return -1;
	}
	
	//Copy the rest of our data
	fseek(filePointer,OFFS_TAN_LUT,SEEK_SET);
	for(int i=0; i<SIZEOF_LUT; i+=8) {
		for(int j=0; j<8; j++) {
			fprintf(outFP,"%ff, ",toFloat(NEXT_INT(filePointer)));
		}
		fprintf(outFP,"\n");
	}
	
	//Close the files and exit
	fclose(filePointer);
	fclose(outFP);
	return 0;
}