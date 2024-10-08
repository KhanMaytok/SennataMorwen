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
