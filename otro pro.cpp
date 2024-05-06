#include <iostream>
#include <fstream>
#include <string>
#include <sstream>
using namespace std;
///*****************************************************************************////
// se declaro un struct en el cul se guardara el nombre y la clave en la variable datos.
const char DELIMITADOR = '|';

struct info {
		char nombre[25];
		int clave;
}datos ;	

struct contenido {
	int fecha;  //MMDD
	int tempe;  //## CELCIUS
	int condi;  //1. LLUVIOSO  2. SOLEADO  3. NUBLADO  
	int veloc;  //## KM
	int presi;  //#### hPa
	int humed;  //## %	
};	
///***********************************************************************//////	
//se crea una funcion sin retorno la cual es utilizada para LEER el archivo.bin.

void leer() {
	
//el nombre otro es el nombre del archivo dentro de c++ porque el nombre con el cual sera guardado es inicio2.bin.

//El ifstream es utilizado para poder LEER un archivo.

	ifstream otro("inicio2.bin", ios::binary);
	
//se realiza un condicional if el cual nos dice que si el documento otro esta abierto entonces que  nos permita leerlo.

	if (otro.is_open() ) {
		
// con el read la accion que damos es para poder leer el archivo deacuerdo al tamaño que tenga la variable datos.

		otro.read((char *) &datos, sizeof (datos));	
		cout<< "ENCONTRE " << datos.nombre << " CON TEL.  "<< datos.clave;
		
// un else que si el documento no esta aierto entonces que le diga a usuario que NO EXISTE REGISRTO DE USUAIRO PARA ENTRAR.

	} else {
		cout<< "NO EXISTE REGISRTO DE USUAIRO PARA ENTRAR";
	}
}
//Otra funcion sin retorno que sera utilizada para que el ususuario pueda escribir en el archivo .bin.

void escribir() {
	
//solicitamos datos al usuario y los guardamos en el struct.

	cout  << "DIGTE NOMBRE";
	cin >> datos.nombre;
	cout  << "DIGTE CLAVE";
	cin >> datos.clave;
//Utilizamos el ofstream para que el usuario pueda escribir en el.

	ofstream  prueba("inicio2.bin", ios::binary);
	
//el char es utilizado para convertir los datos escritos por el usuario a carcter y del tamaño de la variable datos.

	prueba.write((char *) &datos, sizeof(datos) );
	
}

// hacemosr la validacion del usuaruario y contraseña.

int valida(info registro) {
	ifstream otro("inicio2.bin", ios::binary);
	
	//aqui hacemos un condicional el caul nos indica que si el archivo (otro) esta abierto entoces.
	
	if (otro.is_open() ) {
		
// esto nos permite leer el lo que tenemos guardado hasta el momento en la variable datos.

		otro.read((char *) &datos, sizeof (datos));	
		
//realizamos un codicional if el cual nos permite comparar si la calave que el usuario detecto esta registrada o no.
		if((strcmp(registro.nombre,datos.nombre)==0) && (registro.clave==datos.clave))
			return 1;
		else
			return 0;	
	} else {
		cout<< "NO EXISTIA REGISRTO DE USUARIO SE CREO NUEVO";
		ofstream otro2("inicio2.bin", ios::binary);
		otro2.write((char *) &registro, sizeof(registro) );
	}
}

////////**********************************************************///////////////////////
void crear() {
	char continua;
	
	cout << "Esta acción borra el archivo si ya existe. Esta seguro de continuar S-N ? ";
	cin >> continua;
	if (continua=='S') {
		ofstream inicia("datos.txt" , ios::out);
		cout << "El archivo se creo correctamente";
	} 
}
//	
//	int fecha;  //MMDD
//	int tempe;  //## CELCIUS
//	int condi;  //1. LLUVIOSO  2. SOLEADO  3. NUBLADO  
//	int veloc;  //## KM
//	int presi;  //#### hPa
//	int humed;  //## %	
void registra() {
	contenido entrada;
	cout << "DATOS DE LECTURA A REGISTRAR";
	
	cout << "Digite EL MES (##)) Y DIA (##)  ";
	cin >> entrada.fecha;
	cout << endl << "Digite la temperatura en gardos Celcius";
	cin >> entrada.tempe ;
	cout << endl << "Digite conidción atmosferica. Use 1 para Lluviioso 2 para soleado o 3 para Nublado";
	cin >> entrada.condi;
	cout << endl << "Digite velocidad dle viento en KM";
	cin >> entrada.veloc;
	cout << endl << "Digite Presión atmosferica";
	cin >> entrada.presi;
	cout << endl << "Digite el porcentaje de humedad";
	cin >> entrada.humed;
	
	ofstream regis("datos.txt", ios::app);
	regis << entrada.fecha<<DELIMITADOR;
	regis << entrada.tempe<<DELIMITADOR;
	regis << entrada.condi<<DELIMITADOR;
	regis << entrada.veloc<<DELIMITADOR;	
	regis << entrada.presi<<DELIMITADOR;	
	regis << entrada.humed<<DELIMITADOR;
	regis << endl;	
	
}

void calcular() {
	string mayortem="";
	string menortem="200";
	string acumtem="";
	string cadena,parte1,temperatura1,condicion,viento,precion,humedad;
	string incendio="NO HAY PROBABILIDAD DE INCENDIO";
	string tormenta="NO HAY PROBABILIDAD DE TORMENTA";
	int cuenta=0;
	
	cout << "Los Datos Cual Dato desea calcular" << endl;
	ifstream mirar("datos.txt", ios::in);
	while (getline(mirar,cadena)) {  
		cuenta++;
		stringstream input_stringstream(cadena);
		getline(input_stringstream, parte1, DELIMITADOR);
		getline(input_stringstream, temperatura1, DELIMITADOR);		
		acumtem +=temperatura1;
		if (temperatura1 > mayortem) {
			mayortem=temperatura1;
			
		}
		if (temperatura1 < menortem) {
			menortem=temperatura1;		
		}
		getline(input_stringstream, condicion, DELIMITADOR);		
		
		getline(input_stringstream, viento, DELIMITADOR);		
		getline(input_stringstream, precion, DELIMITADOR);	
		getline(input_stringstream, humedad, DELIMITADOR);		
			
		if ((temperatura1 >= "35") && (condicion=="2") && ((viento >= "7") )) {
				incendio="PROBABILIDAD DE INCENDIO ALTA Temperatura "+temperatura1+" Y viento de "+viento;	
		}
		if ((precion < "1010") && (humedad > "70") && (condicion == "1") ) {
				tormenta="ALTA PROBABILIDAD DE TORMENTA percion atmosferica "+precion+" Y humedad de " + humedad+"%";	
		}
			
	}
	cout << "SE REGISTRARON " << cuenta << " REGISTROS " << endl; 
	cout << "MAYOR " << mayortem << endl; 
	cout << "MENOR " << menortem << endl; 
	//cout << acumtem << endl;
	cout << incendio << endl;
	cout << tormenta << endl;
	
	ofstream salida("informe.txt" , ios::out);
	salida << "Se recibieron " << cuenta << " Registros " << endl; 
	salida << "La temperatura mayor fue " << mayortem << " Grado Celsius "<< endl; 
	salida << "La temperatura menor fue " << menortem << " Grados Celsius"<< endl; 
	//salida << acumtem << endl;
	salida << incendio << endl;
	salida << tormenta << endl;
	
}

void verarchivo() {
	string cadena,parte1;
	
	cout << "DATOS REGISTRADOS ACTUALMENBTE" << endl;
	
	ifstream mirar("datos.txt", ios::in);
	while (getline(mirar,cadena)) {  
		stringstream input_stringstream(cadena);
		getline(input_stringstream, parte1, DELIMITADOR);
		cout << "FECHA :" << parte1 ;
		getline(input_stringstream, parte1, DELIMITADOR);		
		cout << "TEMPERATIURA " << parte1;
		getline(input_stringstream, parte1, DELIMITADOR);		
		cout << "COIDCION ATMOSFERICA " << parte1;
		getline(input_stringstream, parte1, DELIMITADOR);		
		cout << "VELOCIDAD DEL VIENTO " << parte1;
		getline(input_stringstream, parte1, DELIMITADOR);		
		cout << "PRECION ATMOSFERICA " << parte1;
		getline(input_stringstream, parte1, DELIMITADOR);		
		cout << "HUMEDAD " << parte1 << endl;
	}
	
	
}
int main () {
//se declararon variables.
	int opcion;
    info  usuario;
    
//hacemos un do while para que mientras el usuario dijite el numero 1  el programa le solicite nombre y contraseña.  
	//do {
    cout  << "DIGTE NOMBRE";
	cin >>usuario.nombre;
	cout  << "DIGTE CLAVE";
	cin >>usuario.clave;
	opcion=valida(usuario);
	//} while(opcion !=1);
	if (opcion != 1) {
		cout << "LA INFORMCAION NO ES CORRECTA.VUELVA A INTERTARLO";
		return 0;
	}
	
// este bucle es utilizado para la interfaz del menu siempre y cuando sea diferente de 3 ya que el numero 3 en el menu significa la saida del programa.

	do 
	{
		cout << "Digite una opcion" << endl << "1. Crear Archivo" << endl << "2. Registra Datos"  << endl << "3. Hacer Calculos"  << endl << "4. Ver Archivo" << endl << "5. Terminar" << endl;
		cin >> opcion;
		
		if(opcion==1) {
			crear();
		}
// que si el usuario dijita el numero 1 entonces el progrograma lo que hace es remitir al usuario hacia la funcion escribir para crear un registro.		

		if(opcion==2) {		
			registra();
		}
// que si el usuario dijita el numero 1 entonces el progrograma lo que hace es remitir al usuario hacia la funcion LEER para que este pueda leer sus datos.	
		if(opcion==3)  {
			calcular();
		}

		if(opcion==4)  {
			verarchivo();
		}

	} while (opcion != 5);
			
}
