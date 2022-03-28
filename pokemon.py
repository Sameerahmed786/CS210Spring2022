import csv
from collections import defaultdict, Counter

def fire_per_abv_39():
    reader = csv.DictReader(open('pokemonTrain.csv'))
    fire_abv_39 = 0
    total_fire = 0
    for key, item in enumerate(reader):
        if item['type'] == 'fire':
            total_fire += 1
            if float(item['level']) > 39:
                fire_abv_39 += 1
    percentage = round(fire_abv_39 / total_fire * 100)
    file = open('pokemon1.txt', 'w')
    file.write('Percentage of fire type Pokemons at or above level 40=' + str(percentage))
    file.close()


def fill_missing_types():
    reader = csv.DictReader(open('pokemonTrain.csv'))
    pokemon_dict_list = list()
    type_weaknesses = defaultdict(list)
    for key, item in enumerate(reader):
        # print(key, item)
        type_weaknesses[item['type']].append(item['weakness'])
        pokemon_dict_list.append(item)

    type_weakness_count = {}
    for key, item in type_weaknesses.items():
        type_weakness_count[key] = Counter(item)

    for key, item in enumerate(pokemon_dict_list):
        if item['type'] == 'NaN':
            nan_weakness = item['weakness']
            new_type = ""
            max = 0
            for pokemon_type, weakness in type_weakness_count.items():
                for weakness_type, count in weakness.items():
                    if pokemon_type != 'NaN':
                        if nan_weakness == weakness_type:
                            if count >= max:
                                if new_type == "":
                                    new_type = pokemon_type
                                    item['type'] = pokemon_type
                                elif pokemon_type < new_type:
                                    new_type = pokemon_type
                                    item['type'] = pokemon_type

    return pokemon_dict_list


def missing_atk_def_hp(pokemon_dict_list):
    level_threshold = 40
    total_have_atk_abv_40 = 0
    total_have_def_abv_40 = 0
    total_have_hp_abv_40 = 0

    total_have_atk_40_bel = 0
    total_have_def_40_bel = 0
    total_have_hp_40_bel = 0


    total_atk_abv_40 = 0
    total_def_abv_40 = 0
    total_hp_abv_40 = 0

    total_atk_40_bel = 0
    total_def_40_bel = 0
    total_hp_40_bel = 0
    for key, item in enumerate(pokemon_dict_list):
        if float(item['level']) > 40:
            if item['atk'] != 'NaN':
                total_atk_abv_40 += float(item['atk'])
                total_have_atk_abv_40 += 1
            if item['def'] != 'NaN':
                total_def_abv_40 += float(item['def'])
                total_have_def_abv_40 += 1
            if item['hp'] != 'NaN':
                total_hp_abv_40 += float(item['hp'])
                total_have_hp_abv_40 += 1

        if float(item['level']) <= 40:
            if item['atk'] != 'NaN':
                total_atk_40_bel += float(item['atk'])
                total_have_atk_40_bel += 1
            if item['def'] != 'NaN':
                total_def_40_bel += float(item['def'])
                total_have_def_40_bel += 1
            if item['hp'] != 'NaN':
                total_hp_40_bel += float(item['hp'])
                total_have_hp_40_bel += 1

    atk_abv_40_avg = round((total_atk_abv_40 / total_have_atk_abv_40), 1)
    def_abv_40_avg = round((total_def_abv_40/ total_have_def_abv_40), 1)
    hp_abv_40_avg = round((total_hp_abv_40 / total_have_hp_abv_40), 1)

    atk_40_bel_avg = round((total_atk_40_bel / total_have_atk_40_bel), 1)
    def_40_bel_avg = round((total_def_40_bel/ total_have_def_40_bel), 1)
    hp_40_bel_avg = round((total_hp_40_bel/ total_have_hp_40_bel), 1)

    for key, item in enumerate(pokemon_dict_list):
        if float(item['level']) > 40:
            if item['atk'] == 'NaN':
                item['atk'] = str(atk_abv_40_avg)
            if item['def'] == 'NaN':
                item['def'] = str(def_abv_40_avg)
            if item['hp'] == 'NaN':
                item['hp'] = str(hp_abv_40_avg)
        else:
            if item['atk'] == 'NaN':
                item['atk'] = str(atk_40_bel_avg)
            if item['def'] == 'NaN':
                item['def'] = str(def_40_bel_avg)
            if item['hp'] == 'NaN':
                item['hp'] = str(hp_40_bel_avg)

    return pokemon_dict_list


def write_new_csv(pokemon_dict_list):
    field_names = ['id', 'name', 'level', 'personality', 'type', 'weakness', 'atk', 'def', 'hp', 'stage']
    with open('pokemonResult.csv', 'w') as csvfile:
        csvfile.write(','.join(field_names)+'\n')
        for row in pokemon_dict_list:
            values = list(row.values())
            csvfile.write(','.join(values)+'\n')


def type_personalities(pokemon_dict_list):
    personalities = defaultdict(list);
    for key, item in enumerate(pokemon_dict_list):
        if item['personality'] not in personalities[item['type']]:
            personalities[item['type']].append(item['personality'])
    sorted_keys = sorted(personalities.keys())

    with (open('pokemon4.txt', 'w')) as file:
        file.write("Pokemon type to personality mapping:\n")
        for key in sorted_keys:
            values = personalities[key]
            file.write(key + ": " + ", ".join(values)+"\n")

def hp_stage_3(pokemon_dict_list):
    total_hp_stage_3 = 0
    total_stage_3 = 0
    for key, item in enumerate(pokemon_dict_list):
        if float(item['stage']) == 3.0:
            total_hp_stage_3 += float(item['hp'])
            total_stage_3 += 1
    hp_avg = round(total_hp_stage_3 / total_stage_3)
    file = open("pokemon5.txt", "w")
    file.write("Average hit points for Pokemons of stage 3.0="+str(hp_avg))
    file.close()



if __name__ == '__main__':
    fire_per_abv_39()
    pokemon_dict_list = fill_missing_types()
    new_pokemon_dict_list = missing_atk_def_hp(pokemon_dict_list)
    write_new_csv(new_pokemon_dict_list)
    type_personalities(new_pokemon_dict_list)
    hp_stage_3(new_pokemon_dict_list)
