var expReg = new RegExp('^[A-Z\u00E0-\u00FC]+$', 'i'); //expresion regular para validar solo letras y acentos

/* Función Ejercicio 1 */
function Eje1() {
    var edadVal = "";
    var salida = false;
    var nombre = prompt("Ingrese nombre");

    while (salida == false) {
        if (expReg.test(nombre) && (nombre != null)) {
            var edad = parseInt(prompt("Ingrese edad de la persona"));
            while (esNumero(edad)) {
                edad = parseInt(prompt("Ingrese edad de la persona"));
            }
            salida = true;
        } else {
            alert('Ingrese un nombre válido');
            nombre = prompt("Ingrese nombre");
        }
    }

    var esMayor = mayorEdad(edad);

    if (esMayor == true) {
        alert(nombre + ' es mayor de edad.');
        edadVal = "es mayor de edad";
        console.log(nombre + ' es mayor de edad.');
    } else {
        alert(nombre + ' es menor de edad.');
        edadVal = "es menor de edad";
        console.log(nombre + ' es menor de edad.');
    }
    document.getElementById("nombreP").innerHTML = ("Nombre: " + nombre);
    document.getElementById("contenido").innerHTML = (nombre + " " + edadVal + " con " + edad + " años.")
    document.getElementById("div1").style.display = "block";
}

/* Función Ejercicio 2 */
function Eje2() {
    var edadVal = "";
    var x = 0;
    var edad = 0;
    var nombresArray = [];

    /* Se ingresa al while para captar el nombre de las personas 
     y compara Expresiones regulares */
    while (x < 3) { // Se puede establecer una variable para el 3
        var nombre = prompt("Ingrese nombre");
        if (expReg.test(nombre) && (nombre != null)) {
            edad = parseInt(prompt("Ingrese edad de la persona"));
            // Se evalua si corresponde con un nro, sino entra al while
            while (esNumero(edad)) {
                edad = parseInt(prompt("Ingrese edad de la persona"));
            }
            var esMayor = mayorEdad(edad); // Se evalua si es mayor o menor de edad.

            if (esMayor == true) {
                alert(nombre + ' es mayor de edad.');
                edadVal = "es mayor de edad";
                console.log(nombre + ' es mayor de edad con ' + edad + ' años.');
            } else {
                alert(nombre + ' es menor de edad.');
                edadVal = "es menor de edad";
                console.log(nombre + ' es menor de edad con ' + edad + ' años.');
            }

            // Se arma un array con Nombre y Edad.
            nombresArray.push({ nombre: nombre, edad: edad });
            document.getElementById("nom_" + x).innerHTML = (nombre)
            document.getElementById("edad_" + x).innerHTML = (edad + " años");
            x++;
        } else {
            alert('Ingrese un nombre válido');
        }
    }

    let ordenNombre = ordenMayorEdadArray(nombresArray); //Se ordena el Array
    //Se llevan los elementos al index
    document.getElementById('mayorNomEdad').innerHTML = (ordenNombre[0].nombre + " con " + ordenNombre[0].edad + " años")
    document.getElementById("div2").style.display = "block";
}

/* Función mayor de Edad para función 1 */
function mayorEdad(value) {
    if (value >= 18) {
        return true
    }
}

/* Función ordenamiento de menor a mayor de Edad para función 2 */
function ordenMayorEdadArray(value) {
    let ordenMayor = value.sort(function(x, y) {
        if (x.edad > y.edad) {
            return -1;
        }
        if (x.edad < y.edad) {
            return 1;
        }
        return 0;
    });
    return ordenMayor;
}

/* Función para evaluar si una persona es mayor de edad y que ingrese nros 
y no caracteres */
function esNumero(num) {
    if (!isNaN(num) && num != null && num != "") {
        if (num > 0 && num <= 100) {
            alert("Edad ingresada correctamente")
            return false;
        } else {
            alert("Edad mayor a 1 y menor a 100");
            return true;
        }
    } else {
        alert('No es una edad válida');
        return true
    }
}