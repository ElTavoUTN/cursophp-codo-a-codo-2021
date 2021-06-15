let nombreAlumno = prompt("Ingrese el nombre del Alumno");
document.getElementById("nombre_alumno").innerHTML = ("Nombre de Alumno: " + nombreAlumno);
console.log(nombreAlumno);

// Nota 1
let nota1 = parseInt(prompt("Ingrese primera nota del Alumno"));

while (esNumero(nota1)) {
    nota1 = parseInt(prompt("Ingrese primera nota del Alumno"));
}
document.getElementById("nota_1").innerHTML = nota1;
console.log("Nota 1: " + nota1);

// Nota 2
let nota2 = parseInt(prompt("Ingrese segunda nota del Alumno"));
while (esNumero(nota2)) {
    nota2 = parseInt(prompt("Ingrese segunda nota del Alumno"));
}
document.getElementById("nota_2").innerHTML = nota2;
console.log("Nota 2: " + nota2);

// Nota 3
let nota3 = parseInt(prompt("Ingrese tercer nota del Alumno"));
while (esNumero(nota3)) {
    nota3 = parseInt(prompt("Ingrese tercer nota del Alumno"));
}
document.getElementById("nota_3").innerHTML = nota3;
console.log("Nota 3: " + nota3);

let cantidadNotas = 3;

// Promedio
let promedio = parseInt((nota1 + nota2 + nota3) / cantidadNotas);

promedioMsj(promedio, nombreAlumno);
document.getElementById("promedio").innerHTML = promedio;
console.log("Promedio: " + promedio);

// Función de verificación si es nro
function esNumero(num) {
    if (!isNaN(num) && num != null && num != "") {
        if (num <= 10) {
            alert("Número ingresado correctamente")
            return false;
        } else {
            alert("Número de nota mayor a 10, debe colocar notas entre 1 y 10");
            return true;
        }
    } else if (num == 'fin') {
        return false
    } else {
        alert('No es un número válido');
        return true
    }
}

// Función verificación de promedio msjs
function promedioMsj(prom, nomAlumno) {
    if (prom >= 6 && prom <= 10) {
        alert("El promedio de las notas del alumno es: " + prom + ". " + nomAlumno + " está aprobado")
    } else {
        alert("El promedio de las notas del alumno es: " + prom + ". " + nomAlumno + " debe esforzarse más")
    }
}