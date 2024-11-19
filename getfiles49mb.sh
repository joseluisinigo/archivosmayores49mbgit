#!/bin/bash

# Paso 1: Obtener la lista de archivos en estado de Git (modificados o no rastreados)
echo "Generando lista de archivos en estado de Git..."
git ls-files -o -m --exclude-standard > git_files.txt

# Paso 2: Buscar archivos mayores a 49 MB en el directorio actual de forma recursiva
echo "Buscando archivos mayores a 49 MB..."
find . -type f -size +49M | sed 's|^\./||' > large_files.txt

# Paso 3: Mostrar las listas generadas para depuración (opcional)
echo "Archivos en estado de Git:"
cat git_files.txt
echo "Archivos mayores a 49 MB:"
cat large_files.txt

# Paso 4: Comparar ambas listas y mostrar los resultados
echo "Comparando listas..."
grep -Fxf git_files.txt large_files.txt > result.txt

# Paso 5: Mostrar los resultados finales
if [[ -s result.txt ]]; then
    echo "Archivos en estado de Git que superan los 49 MB:"
    cat result.txt
else
    echo "No se encontraron archivos en estado de Git que superen los 49 MB."
fi

# Paso 6: Limpiar archivos temporales (opcional)
rm -f git_files.txt large_files.txt result.txt
