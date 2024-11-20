random_list = {
	10 = {
		scope:attacker.capital_province = {
			create_epidemic_outbreak = {
				type = smallpox
				intensity = minor
			}
		}										
	}
	10 = {
		scope:attacker.capital_province = {
			create_epidemic_outbreak = {
				type = typhus
				intensity = minor
			}
		}										
	}
	10 = {
		scope:attacker.capital_province = {
			create_epidemic_outbreak = {
				type = peryite_affliction
				intensity = minor
			}
		}										
	}
	10 = {
		scope:attacker.capital_province = {
			create_epidemic_outbreak = {
				type = chrondiasis
				intensity = minor
			}
		}										
	}
	10 = {
		scope:attacker.capital_province = {
			create_epidemic_outbreak = {
				type = dysentery
				intensity = minor
			}
		}										
	}
	10 = {
		scope:attacker.capital_province = {
			create_epidemic_outbreak = {
				type = measles
				intensity = minor
			}
		}										
	}
	10 = {
		scope:attacker.capital_province = {
			create_epidemic_outbreak = {
				type = consumption
				intensity = minor
			}
		}										
	}
}

while = {
	count = 5
	spawn_army = {
		uses_supply = no
		inheritable = no
		name = "risen_dead"
		levies = {
			value = {
				value = 750
			}
		}
		location = scope:acs_hecate_province
	}
}

# Is an independent ruler, conquest
ACS.0010 = {
	hidden = yes
	type = character_event

	trigger = {
		has_trait = dragon_rider
		is_alive = yes
		is_adult = yes
		# is_independent_ruler = yes
	}

	immediate = {
		random_neighboring_and_across_water_top_liege_realm = {
			save_scope_as = target_title
			holder = {
				save_scope_as = target_character
			}
		}
		start_war = {
			cb = dragon_rider_conquest_cb
			target = scope:target_title.holder.top_liege
			target_title = scope:target_title
		}
	}
}

# If is no an independent ruler, declare the war vs liege
ACS.0011 = {
	hidden = yes
	type = character_event

	trigger = {
		has_trait = dragon_rider
		is_alive = yes
		is_adult = yes
		is_independent_ruler = no
	}

	immediate = {
		random_neighboring_and_across_water_top_liege_realm = {
			save_scope_as = target_title
			holder = {
				save_scope_as = target_character
			}
		}
		start_war = {
			cb = independence_war
			target = root.top_liege
		}
	}
}
