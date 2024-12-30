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

sennatha_womb_position = {
	category = court_position_category_special
	skill = learning
	max_available_positions = 5
	valid_character = {
		scope:employee = {
			is_imprisoned = no
			is_adult = yes
            is_female = yes
            OR = {
                has_trait = sennatha_1
                has_trait = sennatha_2
                has_trait = sennatha_3
                has_trait = sennatha_4
                has_trait = sennatha_5
                has_trait = sennatha_6
                has_trait = sennatha_7
                has_trait = sennatha_8
                has_trait = sennatha_9
                has_trait = sennatha_10
            }
		}
	}

	opinion = {
		value = regular_court_position_opinion
	}

	# How high the aptitude has to be to reach the 5 different modifier levels
	aptitude_level_breakpoints = { 20 40 60 80 }

	# How good is this character in this position? root scope is the holder of the court position
	
    aptitude = {
        value = 1		    
        if = {
            limit = {
                has_trait = sennatha_1
            }
            add = { 
                value = 1
                desc = court_position_necomancer_trait
            }
        }

        if = {
            limit = {
                has_trait = sennatha_2
            }
            add = { 
                value = 2
                desc = court_position_necomancer_trait
            }
        }

        if = {
            limit = {
                has_trait = sennatha_3
            }
            add = { 
                value = 3
                desc = court_position_necomancer_trait
            }
        }

        if = {
            limit = {
                has_trait = sennatha_4
            }
            add = { 
                value = 4
                desc = court_position_necomancer_trait
            }
        }

        if = {
            limit = {
                has_trait = sennatha_5
            }
            add = { 
                value = 5
                desc = court_position_necomancer_trait
            }
        }

        if = {
            limit = {
                has_trait = sennatha_6
            }
            add = { 
                value = 6
                desc = court_position_necomancer_trait
            }
        }

        if = {
            limit = {
                has_trait = sennatha_7
            }
            add = { 
                value = 7
                desc = court_position_necomancer_trait
            }
        }

        if = {
            limit = {
                has_trait = sennatha_8
            }
            add = { 
                value = 8
                desc = court_position_necomancer_trait
            }
        }

        if = {
            limit = {
                has_trait = sennatha_9
            }
            add = { 
                value = 9
                desc = court_position_necomancer_trait
            }
        }

        if = {
            limit = {
                has_trait = sennatha_10
            }
            add = { 
                value = 10
                desc = court_position_necomancer_trait
            }
        }
		    add = court_position_aptitude_family_business_value
		    add = court_position_aptitude_low_penalty_value
        }

	is_shown = { }

	is_shown_character = {
		scope:employee = {
			OR = {
				is_courtier_of = scope:liege
				is_vassal_of = scope:liege
			}
		}
	}

	revoke_cost = {
		prestige =  {
			value = major_court_position_prestige_revoke_cost
			# Set to 0 with Dynasty Perk Inner Circle
			if = {
				limit = {
					exists = this
					is_ai = yes
				}
				multiply = 0
			}
		}
	}

	salary = {
		round = no
		gold = {
			value = medium_court_position_salary
		}
	}

	# These modifiers are employed based on what level the aptitude reaches (levels are defined as breakpoints) 
	scaling_employer_modifiers = {
		terrible = {
			monthly_court_grandeur_change_mult = 0.10
		}
		poor = {
			court_grandeur_baseline_add = 1
			monthly_court_grandeur_change_mult = 0.10
		}
		average = {
			court_grandeur_baseline_add = 1
			monthly_court_grandeur_change_mult = 0.15
		}
		good = {
			court_grandeur_baseline_add = 2
			monthly_court_grandeur_change_mult = 0.20
		}
		excellent = {
			court_grandeur_baseline_add = 2
			monthly_court_grandeur_change_mult = 0.25
		}
	}

	custom_employer_modifier_description = court_mage_employer_custom_effect_description

	modifier = {
		monthly_prestige = minor_court_position_prestige_salary
		learning = 1
	}

	candidate_score = {
		value = 150
		add = scope:base_value
        add = court_position_candidate_score_base_value
        add = court_position_candidate_aptitude_value
	}
}

