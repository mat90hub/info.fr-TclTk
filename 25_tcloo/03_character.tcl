#!/usr/bin/env tclsh
#-*- mode: tcl; coding: utf-8-unix; fill-column: 80; ispell-local-dictionary: "american"; -*-

character destroy

oo::class create character {
    variable State

    constructor {nm} {
	set State(name) $nm
	array set State {defense 2 attack 3 hitpoints 5}
	set State(possessions) {}
    }

    method show {} {
	parray State
    }

    method acquire {item} {
	lappend State(possessions) $item
    }

    method netWorth {} {
	set total 0
	foreach item $State(possessions) {
	    incr total [$item getValue]
	}
	return $total
    }
}


oo::class create treasure {
    variable name value

    constructor {nm val} {
	set name $nm
	set value $val
    }

    method getValue {} {
	return $value
    }
}

character create daffy Allmine
daffy acquire [treasure new ruby 100]
daffy acquire [treasure new diamond 200]

daffy show

puts "Le trésor d'Allmine vaut: [daffy netWorth]"
