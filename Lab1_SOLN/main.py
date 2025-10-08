#Lab 1 - Hy Vo
from importfiles import get_json_data as gjson
import functions as f


if __name__ == "__main__":
    pokemon = gjson()
    #print(pokemon)
    menu = f.build_menu(["1. Show all pokemon\n",
             "2. Find pokemon stats\n",
             "3. Exit\n",
             "\n",
             "Enter your choice: "
             ])
    option = int(input(menu))
    outcome = ""
    if option == 1:
        for p in pokemon:
            outcome += f.show_pokemon(p)
    elif option == 2:
        input_name = input("Enter a pokemon name: ")
        index_num = 0
        for p in pokemon:
            if p.get("pokemon") == input_name:
                index_num = pokemon.index(p)
        if pokemon[index_num]["pokemon"] == input_name:
            stamina_point = pokemon[index_num]["stamina"]
            attack_point = pokemon[index_num]["attack"]
            defense_point = pokemon[index_num]["defense"]

            outcome = f"Stamina:{f.percentage(stamina_point)}%({f.health_bar(stamina_point)})\
                        \nAttack:{f.percentage(attack_point)}%({f.health_bar(attack_point)})\
                        \nDefense:{f.percentage(defense_point)}%({f.health_bar(defense_point)})"
        else:
            outcome = "Pokemon not in list"
    elif option == 3:
        outcome = "Program is closing"
    else:
        outcome = "Invalid Input"

    print(outcome)