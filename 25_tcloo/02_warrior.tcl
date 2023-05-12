#!/usr/bin/env tclsh
#-*- mode: tcl; coding: utf-8-unix; fill-column: 80; ispell-local-dictionary: "american"; -*-

source 01_character.tcl
oo::class create warrior {
    superclass character
    variable State
    constructor {name} {
	puts "construction d'un guerrier"
	next $name
	incr State(defense) 2
	incr State(attack) 2
    }
}

warrior create elmer Siegfried

elmer show


oo::class create human {
    superclass character
    variable State
    constructor {name} {
	puts "construction d'un personnage humain"
	next $name
	incr State(hitpoints) 2
    }
}

oo::class create humanwarrior {
    superclass human warrior character
    variable State
    constructor {name} {
	puts "Construction d'un guerrier humain"
	next $name
    }
}

humanwarrior create jojo Parsifal

jojo show


oo::class create shield {
    method defense {attackStrength} {
	puts "le bouclier réduit l'attaque de 2"
	return [next [expr {$attackStrength - 2}]]
    }
}

oo::class create dagger {
    method defense {attackStrength} {
	puts "la dague réduit l'attaque de 1"
	return [next [expr {$attackStrength - 1}]]
    }
}

humanwarrior destroy

oo::class create humanwarrior {
    superclass human warrior character
    mixin shield dagger
    variable State
    constructor {name} {
	puts "construction d'un guerrier humain"
	next $name
    }
}


elmer destroy

humanwarrior create elmer Siegfried
