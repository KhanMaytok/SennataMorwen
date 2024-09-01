namespace = ACS

ACS.0001 = {
    scope = none
	hidden = yes

    trigger = {
        NOT = {
            has_global_variable = spawned_warframes
        }
    }

	immediate = {
        set_global_variable = {
			name = spawned_warframes
			value = yes
		}

        # Get a random county owned by the player
        random_province = {
            save_scope_as = random_province
        }

        create_character = {
			location = scope:random_province
			template = nahua_invader_commander_template
			save_scope_as = new_commander
		}
		
		scope:new_commander = {
			create_dynamic_title = {
				tier = kingdom
				name = SI_HOST_NAME
			}
			
			create_title_and_vassal_change = {
				type = created
				save_scope_as = change
			}
			
			scope:new_title = {
				set_capital_county = title:c_vathmora
				set_landless_title = yes
				set_destroy_on_succession = yes
				set_delete_on_destroy = yes
				generate_coa = yes
				set_definitive_form = yes
				change_title_holder = {
					holder = scope:new_commander
					change = scope:change
				}
				set_variable = {
					name = si_is_host
					value = yes
				}
			}
			resolve_title_and_vassal_change = scope:change
			
            scope:random_province = {
                duchy = {
                    save_scope_as = random_province_duchy
                }
            }

			scope:random_province.county.holder.top_liege = {
				save_scope_as = war_target
			}
			
			#Start war
			start_war = {
				cb = si_landing_war
				target = scope:war_target
				target_title = scope:random_province.county
			}
			
			#Spawn army
			while = {
				count = 20
				spawn_army = {
					uses_supply = no
					inheritable = yes
					name = "risen_dead"
					men_at_arms = {
                        type = risen_dead
                        stacks = 20
                    }
					location = scope:random_province
				}
			}
			
			#Remove crappy auto-generated courtiers
			every_courtier = {
				limit = {
					NOR = { 
						this = scope:new_commander
						is_spouse_of = scope:new_commander
					}
				}
				death = {
					death_reason = death_disappearance
				}
			}
			
			#Spawn in some commanders
			while = {
				count = 5
				create_character = {
					employer = scope:new_commander
					template = nahua_invader_commander_template
				}
			}
			
			#Spawn in some soldiers
			while = {
				count = 5
				create_character = {
					employer = scope:new_commander
					template = nahua_invader_soldier_template
				}
			}
			
			#Spawn in some additional courtiers
			while = {
				count = 10
				limit = {
					any_courtier = {
						is_female = no
						count < 5
					}
				}
				create_character = {
					employer = scope:new_commander
					template = nahua_invader_male_courtier_template
				}
			}
			
			while = {
				count = 10
				limit = {
					any_courtier = {
						is_female = yes
						count < 5
					}
				}
				create_character = {
					employer = scope:new_commander
					template = nahua_invader_female_courtier_template
				}
			}
			
			#Notify everyone
			every_player = {
				send_interface_message = { #Generic landing notification
						type = event_generic_bad
						title = INVASION_ANOTHER_LANDING_MESSAGE_TITLE
						desc = INVASION_ANOTHER_LANDING_MESSAGE_DESC
						right_icon = scope:new_commander
						left_icon = scope:random_province_duchy
						goto = scope:random_province
					}
			}
		}
    }
}