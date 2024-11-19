```markdown
# Script to Identify Large Files in Git

This script helps detect files exceeding 49 MB in Git's state before performing a `git push`. Sometimes, large residual files are added to the repository, causing the `git push` to fail due to size restrictions on platforms like GitHub. This can corrupt the commit history and require additional steps to fix the issue.

## Common Problem

When attempting to `git push` large files, errors can occur, leaving you stuck in this state. To resolve this, you often need to run:

```bash
git reset --soft HEAD^
```

This removes the last commit while keeping the changes in the staging area. Then, you can manually remove the problematic files or use this script to quickly identify them.

## How the Script Works

This script:

1. Lists all files in Git's state (modified or untracked).
2. Recursively searches the directory for files larger than 49 MB.
3. Compares both lists to identify which large files are in Git's state.
4. Outputs the results, helping you take action before committing or pushing.

## Usage Instructions

### 1. Initial Setup

Save the script as `getfiles49mb.sh` and grant it execute permissions:

```bash
chmod +x getfiles49mb.sh
```

### 2. Running the Script

Run the script from your repository's root:

```bash
./getfiles49mb.sh
```

### 3. Interpreting Results

The script will output:

- **Files in Git state exceeding 49 MB:**  
  A list of files to be removed or excluded before committing or pushing.

- **No files in Git state exceeding 49 MB:**  
  Everything is fine, and you can proceed without issues.

### 4. Manual Correction

If large files are detected, take the following actions:

1. **Remove large files**:  
   Manually delete the detected files using `rm`, and re-commit the changes.

2. **Reconfigure your commit**:  
   Use `git reset --soft HEAD^` to undo the last commit while keeping changes staged, then adjust which files to include.

### Example

```bash
./getfiles49mb.sh
```

Sample output:

```plaintext
Files in Git state exceeding 49 MB:
docs/0.0.0-carpeta/WIFI carpeta/large-file.pdf
```

In this case, you can remove `large-file.pdf` and proceed with the commit:

```bash
rm docs/0.0.0-carpeta/WIFI carpeta/large-file.pdf
git add .
git commit -m "Removing large file"
git push
```

## Benefits

- Detect and prevent size-related issues before a `git push`.
- Avoid errors that may disrupt the workflow.
- Ensure the repository's history remains clean and free of large, unwanted files.

Use this script to maintain order in your repository and prevent unnecessary blocking issues!
```



```markdown
# Script para Identificar Archivos Grandes en Git

Este script ayuda a detectar archivos que superan los 49 MB en el estado de Git antes de realizar un `git push`. A veces, se añaden archivos residuales grandes al repositorio, lo que causa que el `git push` falle debido a restricciones de tamaño en plataformas como GitHub. Esto puede corromper el historial de commits y requerir pasos adicionales para solucionar el problema.

## Problema Común

Al intentar hacer un `git push` con archivos grandes, pueden ocurrir errores que dejan el repositorio en un estado problemático. Para resolverlo, normalmente es necesario ejecutar:

```bash
git reset --soft HEAD^
```

Esto elimina el último commit pero mantiene los cambios en el área de staging. Luego, puedes eliminar manualmente los archivos problemáticos o usar este script para identificarlos rápidamente.

## Cómo Funciona el Script

Este script:

1. Lista todos los archivos en el estado de Git (modificados o sin seguimiento).
2. Busca recursivamente archivos mayores de 49 MB en el directorio.
3. Compara ambas listas para identificar qué archivos grandes están en el estado de Git.
4. Muestra los resultados para que puedas tomar medidas antes de hacer el commit o push.

## Instrucciones de Uso

### 1. Configuración Inicial

Guarda el script como `getfiles49mb.sh` y dale permisos de ejecución:

```bash
chmod +x getfiles49mb.sh
```

### 2. Ejecutar el Script

Ejecuta el script desde la raíz de tu repositorio:

```bash
./getfiles49mb.sh
```

### 3. Interpretar los Resultados

El script mostrará:

- **Archivos en el estado de Git que superan los 49 MB:**  
  Una lista de archivos que debes eliminar o excluir antes de hacer commit o push.

- **No hay archivos en el estado de Git que superen los 49 MB:**  
  Todo está bien, y puedes proceder sin problemas.

### 4. Corrección Manual

Si se detectan archivos grandes, realiza las siguientes acciones:

1. **Eliminar los archivos grandes:**  
   Borra manualmente los archivos detectados usando `rm`, y vuelve a realizar el commit.

2. **Reconfigurar tu commit:**  
   Usa `git reset --soft HEAD^` para deshacer el último commit manteniendo los cambios en el staging, y ajusta los archivos que deseas incluir.

### Ejemplo

```bash
./getfiles49mb.sh
```

Salida de ejemplo:

```plaintext
Archivos en el estado de Git que superan los 49 MB:
docs/0.0.0-carpeta/WIFI carpeta/archivo-grande.pdf
```

En este caso, puedes eliminar `archivo-grande.pdf` y proceder con el commit:

```bash
rm docs/0.0.0-carpeta/WIFI carpeta/archivo-grande.pdf
git add .
git commit -m "Eliminando archivo grande"
git push
```

## Beneficios

- Detecta y previene problemas relacionados con el tamaño antes de un `git push`.
- Evita errores que pueden interrumpir el flujo de trabajo.
- Mantén el historial del repositorio limpio y libre de archivos grandes no deseados.

Usa este script para mantener orden en tu repositorio y evitar bloqueos innecesarios.
```
