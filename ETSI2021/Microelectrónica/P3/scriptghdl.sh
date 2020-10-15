#!/bin/sh
#Script para analizar y simular proyectos VHDL con ghdl

#Directorio para almecenar archivos intermedios
DIRECTORIO=work

if [ $# -eq 0 ]; then
	echo "Es necesario indicar al menos el nombre de una unidad:"
	echo "./script.sh top_level_tb"
	exit 1
fi

#if [ ! ls  -a ! -r ./*.vhdl ]; then
#	echo "No se han detectados archivos .vhd o .vhdl"
#	exit 1
#fi

[ ! -d ./$DIRECTORIO ] && mkdir ./$DIRECTORIO && echo "Directorio $DIRECTORIO no existía y se ha creado"

find ./  -maxdepth 1 \( -name "*.vhd" -o -name "*.vhdl" \) -exec ghdl -i --ieee=synopsys --workdir=$DIRECTORIO  {} \+

for var in "$@"
do
	echo "Elaborando diseño $var"
	ghdl -m --std=93c --ieee=synopsys --workdir=$DIRECTORIO $var
done

echo "FIN"
echo "Ejemplo ./$1 --stop-time=10ms --wave=resultado_wave.ghw"
