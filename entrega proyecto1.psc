struct info
{
}
datos
struct contenido
{
// MMDD
//
// 1. LLUVIOSO  2. SOLEADO  3. NUBLADO
//
//
//
}
SubProceso LEER()
	FILE *otro
	otro = fopen"inicio2.bin", "rb"
	Si  (otro <> NULL)
		fread&datos, variableReservadazeof(datos), 1, otro
		Escribir 'ENCONTRE CON TEL. ', datos.nombre, datos.clave
		fcloseotro
	SiNo
		Escribir 'NO EXISTE REGISTRO DE USUARIO PARA ENTRAR'
	FinSi
FinSubProceso
Algoritmo nombre
	leer
FinAlgoritmo
struct info
{
}
datos
struct contenido
{
// MMDD
//
// 1. LLUVIOSO  2. SOLEADO  3. NUBLADO
//
//
//
}
SubProceso ESCRIBIR()
	Escribir 'DIGTE NOMBRE: '
	Leer sdatos.nombre
	Escribir 'DIGTE CLAVE: '
	Leer datos.clave
	FILE *prueba
	prueba = fopen"inicio2.bin", "wb"
	Si  (prueba <> NULL)
		fwrite&datos, variableReservadazeof(datos), 1, prueba
		fcloseprueba
	FinSi
FinSubProceso
SubProceso VALIDA(STRUCT INFO REGISTRO)
	FILE *otro
	otro = fopen"inicio2.bin", "rb"
	Si  (otro <> NULL)
		fread&datos, variableReservadazeof(datos), 1, otro
		fcloseotro
		Si  ((strcmp(registro.nombre datos.nombre) == 0)  y  (registro.clave == datos.clave))
		SiNo
		FinSi
	SiNo
		Escribir 'NO EXISTE REGISTRO DE USUARIO SE CREO NUEVO'
		FILE *otro2
		otro2 = fopen"inicio2.bin", "wb"
		fwrite&registro, variableReservadazeof(registro), 1, otro2
		fcloseotro2
	FinSi
FinSi
SubProceso CREAR()
	Escribir 'Esta acción borra el archivo si ya existe. Esta seguro de continuar S-N ? '
	Leer continua
	Si  (continua == S | continua == s)
		FILE *otro
		otro = fopen"inicio2.bin", "wb"
		fcloseotro
	FinSi
FinSubProceso
Algoritmo nombre
	escribir
	struct info registro
	Escribir 'Ingrese nombre: '
	Leer sregistro.nombre
	Escribir 'Ingrese clave: '
	Leer registro.clave
	validado = validaregistro
	Si  (validado == 1)
		Escribir 'Usuario y clave válidos.'
	SiNo
		Escribir 'Usuario o clave inválidos.'
	FinSi
	crear
FinSi
struct contenido
{
// MMDD
//
// 1. LLUVIOSO  2. SOLEADO  3. NUBLADO
//
//
//
FinSubProceso
SubProceso REGISTRA()
	struct contenido entrada
	Escribir 'DATOS DE LECTURA A REGISTRAR'
	Escribir 'Digite EL MES ## Y DIA ##: '
	Leer entrada.fecha
	Escribir 'Digite la temperatura en grados Celsius: '
	Leer entrada.tempe
	Escribir 'Digite condición atmosférica. Use 1 para Lluvioso, 2 para Soleado o 3 para Nublado: '
	Leer entrada.condi
	Escribir 'Digite velocidad del viento en KM: '
	Leer entrada.veloc
	Escribir 'Digite Presión atmosférica: '
	Leer entrada.prevariableReservada
	Escribir 'Digite el porcentaje de humedad: '
	Leer entrada.humed
	FILE *regis
	regis = fopen"datos.txt", "a"
	Si  (regis <> NULL)
		fprintfregis, "%d%c%d%c%d%c%d%c%d%c%d%c\n", entrada.fecha, DELIMITADOR, entrada.tempe, DELIMITADOR, entrada.condi, DELIMITADOR, entrada.veloc, DELIMITADOR, entrada.prevariableReservada, DELIMITADOR, entrada.humed, DELIMITADOR
		fcloseregis
	SiNo
		Escribir 'Error al abrir el archivo.'
	FinSi
FinSubProceso
SubProceso CALCULAR()
	Dimension parte1[10]
	Dimension  temperatura[10]
	Dimension  condicion[10]
	Dimension  viento[10]
	Dimension  prevariableReservadaon[10]
	Dimension  humedad[10]
	Dimension mayortem[10] = ""
	Dimension  menortem[10] = "200"
	Dimension  acumtem[1000] = ""
	Escribir 'Los Datos Cual Dato desea calcular'
	SubProceso VERARCHIVO()
		Dimension parte1[10]
		Dimension  temperatura1[10]
		Dimension  condicion[10]
		Dimension  viento[10]
		Dimension  prevariableReservadaon[10]
		Dimension  humedad[10]
		Dimension mayortem[10] = ""
		Dimension  menortem[10] = "200"
		Dimension  acumtem[1000] = ""
		Escribir 'DATOS REGISTRADOS ACTUALMENTE'
		FILE *mirar
		mirar = fopen"datos.txt", "r"
		Si  (mirar <> NULL)
			Mientras  fgetscadena variableReservadazeofcadena mirar <> NULL
				cuenta=cuenta+1
				sscanfcadena, "%[^|]|%[^|]|%[^|]|%[^|]|%[^|]|%[^|]", parte1, temperatura1, condicion, viento, prevariableReservadaon, humedad
				strcatacumtem, temperatura1
				Si  (atoi(temperatura1) > atoi(mayortem))
					strcpymayortem, temperatura1
				FinSi
				Si  (atoi(temperatura1) < atoi(menortem))
					strcpymenortem, temperatura1
				FinSi
				Si  ((atoi(temperatura1) >= 35)  y  (strcmp(condicion 2) == 0)  y  (atoi(viento) >= 7))
					sprintfincendio, "PROBABILIDAD DE INCENDIO ALTA Temperatura %s Y viento de %s", temperatura1, viento
				FinSi
				Si  ((atoi(prevariableReservadaon) < 1010)  y  (atoi(humedad) > 70)  y  (strcmp(condicion 1) == 0))
					sprintftormenta, "ALTA PROBABILIDAD DE TORMENTA percion atmosferica %s Y humedad de %s%%", prevariableReservadaon, humedad
				FinSi
			FinMientras
			fclosemirar
			Escribir 'SE REGISTRARON  REGISTROS', cuenta
			Escribir 'MAYOR s', mayortem
			Escribir 'MENOR s', menortem
			// printf("%s\n", acumtem)
			Escribir 's', incendio
			Escribir 's', tormenta
			FILE *salida
			salida = fopen"informe.txt", "w"
			Si  (salida <> NULL)
				fprintfsalida, "Se recibieron %d Registros\n", cuenta
				fprintfsalida, "La temperatura mayor fue %s Grado CelvariableReservadaus\n", mayortem
				fprintfsalida, "La temperatura menor fue %s Grados CelvariableReservadaus\n", menortem
				// fprintf(salida, "%s\n", acumtem)
				fprintfsalida, "%s\n", incendio
				fprintfsalida, "%s\n", tormenta
				fclosesalida
			SiNo
				Escribir 'Error al abrir el archivo de salida.'
			FinSi
		SiNo
			Escribir 'Error al abrir el archivo.'
		FinSi
FinSubProceso
Algoritmo nombre
	verarchivo
FinSubProceso
struct info
{
FinAlgoritmo
SubProceso VERARCHIVO()
	FILE *mirar
	mirar = fopen"datos.txt", "r"
	Si  (mirar <> NULL)
		Mientras  fgetscadena variableReservadazeofcadena mirar <> NULL
			sscanfcadena, "%[^|]|%[^|]|%[^|]|%[^|]|%[^|]|%[^|]", parte1, parte1, parte1, parte1, parte1, parte1
			Escribir 'FECHA :s', parte1
			sscanfcadena, "%[^|]|%[^|]|%[^|]|%[^|]|%[^|]|%[^|]", parte1, parte1, parte1, parte1, parte1, parte1
			Escribir 'TEMPERATURA s', parte1
			sscanfcadena, "%[^|]|%[^|]|%[^|]|%[^|]|%[^|]|%[^|]", parte1, parte1, parte1, parte1, parte1, parte1
			Escribir 'CONDICION ATMOSFERICA s', parte1
			sscanfcadena, "%[^|]|%[^|]|%[^|]|%[^|]|%[^|]|%[^|]", parte1, parte1, parte1, parte1, parte1, parte1
			Escribir 'VELOCIDAD DEL VIENTO s', parte1
			sscanfcadena, "%[^|]|%[^|]|%[^|]|%[^|]|%[^|]|%[^|]", parte1, parte1, parte1, parte1, parte1, parte1
			Escribir 'PRESION ATMOSFERICA s', parte1
			sscanfcadena, "%[^|]|%[^|]|%[^|]|%[^|]|%[^|]|%[^|]", parte1, parte1, parte1, parte1, parte1, parte1
			Escribir 'HUMEDAD s', parte1
		FinMientras
		fclosemirar
	FinSi
FinSubProceso
Algoritmo nombre
	struct info usuario
	Escribir 'DIGITE NOMBRE: '
	Leer susuario.nombre
	Escribir 'DIGITE CLAVE: '
	Leer usuario.clave
	Si  (valida(usuario) <> 1)
		Escribir 'LA INFORMACION NO ES CORRECTA. VUELVA A INTENTARLO'
	FinSi
	Hacer
		Escribir 'Digite una opcion1. Crear Archivo2. Registra Datos3. Hacer Calculos4. Ver Archivo5. Terminar'
		Leer opcion
		Segun  opcion Hacer
			1:
				crear
			2:
				registra
			3:
				calcular
			4:
				verarchivo
			5:
				Escribir 'Saliendo del programa...'
			De Otro Modo:
				Escribir 'Opcion invalida. Intente de nuevo.'
		FinSegun
	Hasta Que  (opcion <> 5)
FinAlgoritmo
Si (opcion==2)
	registra
FinSi
Si (opcion==3)
	calcular
FinSi
Si (opcion==4)
	verarchivo
FinSi
Hasta Que  (opcion <> 5)
FinAlgoritmo