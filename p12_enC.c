# include <stdio.h>
void writeTag();
extern int* gets(int* cad);
extern unsigned int atoi(int* cadena);
extern int printDec(unsigned int val);
extern int printHex(unsigned int val);
int main(){
    int cad;
    int *pcad=&cad;
    for(int i=0;i<=2;i++){
        writeTag();
        int* cadena=gets(pcad);
        int num= atoi(cadena);
        printf("Salida En Terminal De PrintDec:\n");
        printDec(num);
        printf("\nSalida En Terminal De PrintHex:\n");
        printHex(num);
        printf("\n");
        printf("\n");
    }
    return 0;
}
void writeTag(){
    printf("Ingresa La Cadena:");
    printf("\n");
}