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
![punto3](imgs/p33.jpeg "Queries")

  3.1 Obtener el nombre y categoría de los usuarios que usan programas cuyo precio es mayor a 5000.

    ![3.1](imgs/3.1.jpeg "punto 3.1")
    ```
    $ T_1 := Usuarios \Join Usan $ \
    $ T_2 := T_1 \Join_{Programas.CodP = T_1.CodP} Programas $ \
    $ T_3 := \sigma_{Precio > 5000} (T_2) $ \
    $ T_4 := \prod_{Usuarios.Nombre, Categoria} (T_3) $
    ```

  3.2 Mostrar el código y nombre de los usuarios que no usan programas del SO Linux

    ![3.2](imgs/3.2.jpeg "punto 3.2")
    ```
    $ T_1 := Usuarios \Join usan $\
    $ T_2 := T_1 \Join_{programas.CodP = T1.CodP} (Programas) $\
    $ T_3 := \prod_{usuario.CodU, usuario.nombre, SO.nombre}(T_2 \Join_{T_2.CodS=OS.CodS} SO)$\
    $ R := \prod_{T_3.nombre, T_3.CodU}(T_3 - \sigma_{T_3.nombreOS = 'Linux'}(T_3)) $
    ```
  3.3 Obtener el nombre de los programas y su respectivo SO que son utilizados por usuarios de categoría “Dummies” y “Senior”

    ![3.3](imgs/3.3.jpeg "punto 3.3")
    ```
    $ T_1 := \sigma_{Categoria=´Dummies´ \vee  Categoria='Senior'} (SO) $ \
    $ T_2 := T_1 \Join (Usan) $ \
    $ T_3 := Programas \Join_{Programas.CodS=SO.CodS} SO $ \
    $ T_4 := T_2 \Join_{T_2.CodP=T_3.CodP} T_3 $ \
    $ R := \prod_{Programa.Nombre, SO.Nombre} (T_4) $
    ```
  3.4 Mostrar los programas que son usados por todos los usuarios.

    ![3.4](imgs/3.4.jpeg "punto 3.4")
    ```
    $ T_1 := Usan \Join_{programa.CodP = Usan.CodP}(Programas) $\
    $ R := \prod_{programa.CodP, programa.Nombre, programa.Precio, programa.CodS}(T_1)$
    ```
### Punto 4
