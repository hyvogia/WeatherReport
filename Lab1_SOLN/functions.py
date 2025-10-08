def build_menu(array):
    return "".join(array)

def show_pokemon(array):
    name = array["pokemon"]
    battled_num = str(len(array["battled"]))
    return f"{name}: battled {battled_num} pokemon\n"

def percentage(input):
    return round(input / 15 * 100, 2)

def health_bar(input):
    return "*" * input