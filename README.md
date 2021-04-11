# Parcial 1
*Description*\
The answers for the first partial exam from the Databases course

### Punto 1
* Modelo E-R.
![modeloER](imgs/punto-uno-p1.jpg "modelo ER")

### Punto 2
* Modelo Relacional ( especificando llaves primarias y foráneas )
```
Libro ( PK(ISBN), titulo, year_publication, idioma, resumen, FK(sub_area_conocimiento), num_paginas, Autor, FK(Editorial))
  FK: sub_area_conocimiento REFERENCE A Codigo EN Sub_Area
  FK: Editorial REFERENCE A Codigo EN Editorial

Libros_Prestamo (FK(Num_Prestamo), FK(Libro_Prestamo))
  FK: Num_Prestamo REFERENCE A núm_consecutivo EN Préstamo_físico
  FK: Libro_Prestamo REFERENCE A ISBN EN Libro

Libro_Fisico ( PK(num_ejemplar), ubicación)

Libro_Digital ( Url, Formato_Archivo, Tamaño)

Autor ( PK(Codigo), Primer_Apellido, Segundo_Apellido, Primer_Nombre, Segundo_Nombre )

Editorial ( PK(codigo), Nombre, Pagina_web, Pais_Origen )

Area_conocimiento ( PK(Codigo), Nombre, Descripción )

Sub_Areas ( PK(codigo), Nombre, FK(Area_conocimiento) )
  FK: Area_conocimiento REFERENCE A Codigo EN Area_conocimiento

Autor_Libro (FK(Codigo_autor), FK(ISBN_Libro) )
  FK: Codigo_autor REFERENCE A codigo EN Autor
  FK: ISBN_Libro REFERENCE A ISBN EN Libro

Usuario ( PK(identificación), nombre, dirección, teléfono, email )

Estudiante ( carrera, universidad)

Profesor ( departamento, titulo, área)

Préstamo_físico ( PK(núm_consecutivo), fecha_inicio, fecha_fin, pedido, FK(tendero), FK(identificación) )
  FK: tendero REFERENCE A identificación EN Empleado
  FK: identificación REFERENCE A identificación EN Usuario

Préstamo_digital ( PK(num_cons), FK(usuario), fecha, hora, dir_IP)
  FK: Usuario REFERENCE A identificación EN Usuario

Empleado ( PK(identificación), nombre, cargo )

Multa ( PK(ID), FK(usuario_generador), fecha, valor_multa, descripción )
  FK: usuario_generador REFERENCE A identificación EN Usuario

Solicitud ( PK(núm), fecha, descripcion, FK(usuario), ISBN, titulo)
  FK: usuario REFERENCE A identificación EN Usuario
```

### Punto 3
* Dados los siguientes esquemas, escribir las consultas en Algebra Relacional.
![punto3](imgs/p3.jpeg "Queries")

### Punto 4
