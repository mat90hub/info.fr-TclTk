#!/usr/bin/env tclsh
#-*- mode: tcl; coding: utf-8-unix; fill-column: 80; ispell-local-dictionary: "american"; -*-

oo::class create character {
    variable State

    constructor {name} {
	puts "contruction du caractère"
	array set State {defense 2 attack 3 hitpoints 5}
	set State(name) $name
    }
    method show {} {parray State}
    method defense {attackStrength} {
	puts "L'attaque finale est: $attackStrength"
	if {$attackStrength > $State(defense)} {
            return " $attackStrength supérieur à $State(defense),\
              $State(name) est touché"
	} else {
            return " $attackStrength inférieur à $State(defense),\
              $State(name) est manqué"
	}
    }
}
