#!/bin/bash

# text2QrStl Generate a qr code in stl format from a string.

# Copyright (C) 2013 David Francos Cuartero <dfrancos@dlabs.co>

# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.


declare -A errors deps colors;

(( ${#@} < 2 )) && {
    cat << EOD
text2QrStl - Simple script to convert a text into a qrcode with stl format
Get your text into real life.
David Francos Cuartero <me@davidfrancos.net>

    Usage : text2qrstl <Text to convert to stl> <filename> [scale_size]
EOD
    exit 1;
}

[[ $3 ]] && scale=$3 || scale=2

colors=(
    ['red']="\033[0;31m"
    ['end']="\033[0m"
)

deps=(
    ['qr2scad']="https://github.com/l0b0/qr2scad"
    ['openscad']="http://www.openscad.org/"
    ['qrencode']="http://fukuchi.org/works/qrencode/"
)

openscadFunction="scale([$scale,$scale,$scale]){union(){qrcode(); translate([-10, -10, -1]) cube([qr_size,qr_size,1]); }}";

for dep in ${!deps[@]}; do
    type $dep &>/dev/null || {
        errors[${dep}]="Sorry, couldn't find ${dep}, try ${deps[$dep]}";
    }
done

(( ${#errors[@]} > 0 )) && {
    echo "I found the following errors:"
    for error in "${errors[@]}"; do
        echo -e "\t ${colors[red]}?${colors[end]} ${error}";
    done
    exit 1;
}

{
    tmp=`mktemp`;
    qrencode -o $tmp.qr $1
    qr2scad < $tmp.qr > $tmp.scad;
    sed -i s/qrcode\(\)\;//g $tmp.scad
    echo $openscadFunction >> $tmp.scad
    openscad $tmp.scad -o $2.stl
    #rm $tmp.*
}

[[ -f $2.stl ]] && {
    echo "Your qr stl is in $2.stl with text $1"
} || {
    echo "Something failed".
}