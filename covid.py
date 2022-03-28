import math
from collections import Counter
import csv
import re

# Problem 2

# row[0] id
# row[1] age
# row[2] sex
# row[3] city
# row[4] province
# row[5] country
# row[6] latitude
# row[7] longitude
# row[8] date_onset_symptoms
# row[9] date_admission_hospital
# row[10] date_confirmation
# row[11] symptoms

# After all these tasks, write the data back to a CSV file named “covidResult.csv”.

# Part 1
def average_age():
    with open ('covidTrain.csv') as coVid:

        reader = csv.reader(coVid)

        next(reader)

        # get the range average
        for num,row in enumerate(reader):
            if "-" in row[1]:
                age = row[1].split('-')
                newAge = float(float(age[0])+float(age[1]))
                newAge = newAge / 2
                return round(newAge)
            else:
                return row[1]
##########################################################################################
# Part 2
def new_Dates():
    with open ('covidTrain.csv') as coVid:

        reader = csv.reader(coVid)

        next(reader)

        # Change the date order
        for num,row in enumerate(reader):
            dateOn = row[8].split('.')
            dateAd = row[9].split('.')
            dateCo = row[10].split('.')
            newdateOn = f'{dateOn[1]}.{dateOn[0]}.{dateOn[2]}'
            newdateAd = f'{dateAd[1]}.{dateAd[0]}.{dateAd[2]}'
            newdateCo = f'{dateCo[1]}.{dateCo[0]}.{dateCo[2]}'

            return newdateOn, newdateAd, newdateCo
##########################################################################################
# Part 3
# Provinces: Aichi Prefecture, Anhui, Beijing, Gansu, Guangdong, Guangxi, Guizhou, Hokkaido,
# Hong Kong

AichiLat = 0
AichiLong = 0
AichiCount = 0
AnhuiLat = 0
AnhuiLong = 0
AnhuiCount = 0
BeijingLat = 0
BeijingLong = 0
BeijingCount = 0
GansuLat = 0
GansuLong = 0
GansuCount = 0
GuangdongLat = 0
GuangdongLong = 0
GuangdongCount = 0
GuangxiLat = 0
GuangxiLong = 0
GuangxiCount = 0
GuizhouLat = 0
GuizhouLong = 0
GuizhouCount = 0
HokkaidoLat = 0
HokkaidoLong = 0
HokkaidoCount = 0
HongKongLat = 0
HongKongLong = 0
HongKongCount = 0

with open ('covidTrain.csv') as coVid:
    
    reader = csv.reader(coVid)
    
    next(reader)
    
    # Check the province and add the value to the corresponding lat or long
    for num,row in enumerate(reader):
        if row[4] == "Aichi Prefecture":
            if row[6] != "NaN":
                AichiLat = AichiLat + float(row[6])
            if row[7] != "NaN":
                AichiLong = AichiLong + float(row[7])
            AichiCount = AichiCount + 1
        if row[4] == "Anhui":
            if row[6] != "NaN":
                AnhuiLat = AnhuiLat + float(row[6])
            if row[7] != "NaN":
                AnhuiLong = AnhuiLong + float(row[7])
            AnhuiCount = AnhuiCount + 1
        if row[4] == "Beijing":
            if row[6] != "NaN":
                BeijingLat = BeijingLat + float(row[6])
            if row[7] != "NaN":
                BeijingLong = BeijingLong + float(row[7])
            BeijingCount = BeijingCount + 1
        if row[4] == "Gansu":
            if row[6] != "NaN":
                GansuLat = GansuLat + float(row[6])
            if row[7] != "NaN":
                GansuLong = GansuLong + float(row[7])
            GansuCount = GansuCount + 1
        if row[4] == "Guangdong":
            if row[6] != "NaN":
                GuangdongLat = GuangdongLat + float(row[6])
            if row[7] != "NaN":
                GuangdongLong = GuangdongLong + float(row[7])
            GuangdongCount = GuangdongCount + 1
        if row[4] == "Guangxi":
            if row[6] != "NaN":
                GuangxiLat = GuangxiLat + float(row[6])
            if row[7] != "NaN":
                GuangxiLong = GuangxiLong + float(row[7])
            GuangxiCount = GuangxiCount + 1
        if row[4] == "Guizhou":
            if row[6] != "NaN":
                GuizhouLat = GuizhouLat + float(row[6])
            if row[7] != "NaN":
                GuizhouLong = GuizhouLong + float(row[7])
            GuizhouCount = GuizhouCount + 1
        if row[4] == "Hokkaido":
            if row[6] != "NaN":
                HokkaidoLat = HokkaidoLat + float(row[6])
            if row[7] != "NaN":
                HokkaidoLong = HokkaidoLong + float(row[7])
            HokkaidoCount = HokkaidoCount + 1
        if row[4] == "Hong Kong":
            if row[6] != "NaN":
                HongKongLat = HongKongLat + float(row[6])
            if row[7] != "NaN":
                HongKongLong = HongKongLong + float(row[7])
            HongKongCount = HongKongCount + 1
            
AichiLat = round(AichiLat/AichiCount, 2)
AichiLong = round(AichiLong/AichiCount, 2)
AnhuiLat = round(AnhuiLat/AnhuiCount, 2)
AnhuiLong = round(AnhuiLong/AnhuiCount, 2)
BeijingLat = round(BeijingLat/BeijingCount, 2)
BeijingLong = round(BeijingLong/BeijingCount, 2)
GansuLat = round(GansuLat/GansuCount, 2)
GansuLong = round(GansuLong/GansuCount, 2)
GuangdongLat = round(GuangdongLat/GuangdongCount, 2)
GuangdongLong = round(GuangdongLong/GuangdongCount, 2)
GuangxiLat = round(GuangxiLat/GuangxiCount, 2)
GuangxiLong = round(GuangxiLong/GuangxiCount, 2)
GuizhouLat = round(GuizhouLat/GuizhouCount, 2)
GuizhouLong = round(GuizhouLong/GuizhouCount, 2)
HokkaidoLat = round(HokkaidoLat/HokkaidoCount, 2)
HokkaidoLong = round(HokkaidoLong/HokkaidoCount, 2)
HongKongLat = round(HongKongLat/HongKongCount, 2)
HongKongLong = round(HongKongLong/HongKongCount, 2)
# Now iterate through the list again and add the values.
##########################################################################################
# Part 4

AichiList = []
AnhuiList = []
BeijingList = []
GansuList = []
GuangdongList = []
GuangxiList = []
GuizhouList = []
HokkaidoList = []
HongKongList = []

with open ('covidTrain.csv') as coVid:
    
    reader = csv.reader(coVid)
    
    next(reader)
    
    # Check the province and add to the corresponding city list 
    for num,row in enumerate(reader):
        if row[4] == "Aichi Prefecture" and row[3] != "NaN":
            AichiList.append(row[3])
        if row[4] == "Anhui" and row[3] != "NaN":
            AnhuiList.append(row[3])
        if row[4] == "Beijing" and row[3] != "NaN":
            BeijingList.append(row[3])
        if row[4] == "Gansu" and row[3] != "NaN":
            GansuList.append(row[3])
        if row[4] == "Guangdong" and row[3] != "NaN":
            GuangdongList.append(row[3])
        if row[4] == "Guangxi" and row[3] != "NaN":
            GuangxiList.append(row[3])
        if row[4] == "Guizhou" and row[3] != "NaN":
            GuizhouList.append(row[3])
        if row[4] == "Hokkaido" and row[3] != "NaN":
            HokkaidoList.append(row[3])
        if row[4] == "Hong Kong" and row[3] != "NaN":
            HongKongList.append(row[3])
            
    a = Counter(AichiList)
    b = Counter(AnhuiList)
    c = Counter(BeijingList)
    d = Counter(GansuList)
    e = Counter(GuangdongList)
    f = Counter(GuangxiList)
    g = Counter(GuizhouList)
    h = Counter(HokkaidoList)
    i = Counter(HongKongList)
# Now iterate through the list again and add the cities.
##########################################################################################
# Part 5

AichiSympList = []
AnhuiSympList = []
BeijingSympList = []
GansuSympList = []
GuangdongSympList = []
GuangxiSympList = []
GuizhouSympList = []
HokkaidoSympList = []
HongKongSympList = []

with open ('covidTrain.csv') as coVid:
    
    reader = csv.reader(coVid)
    
    next(reader)
    
    # Check the province and check if it has a ;. Add to corresponding symptom list.
    for num,row in enumerate(reader):
        if row[4] == "Aichi Prefecture" and row[11] != "NaN":
            if ";" in row[11]:
                x = row[11].split(";")
                for symptom in x:
                    AichiSympList.append(symptom.strip())
            else:
                AichiSympList.append(row[11])
        if row[4] == "Anhui" and row[3] != "NaN":
            if ";" in row[11]:
                x = row[11].split(";")
                for symptom in x:
                    AnhuiSympList.append(symptom.strip())
            else:
                AnhuiSympList.append(row[11])
        if row[4] == "Beijing" and row[3] != "NaN":
            if ";" in row[11]:
                x = row[11].split(";")
                for symptom in x:
                    BeijingSympList.append(symptom.strip())
            else:
                BeijingSympList.append(row[11])
        if row[4] == "Gansu" and row[3] != "NaN":
            if ";" in row[11]:
                x = row[11].split(";")
                for symptom in x:
                    GansuSympList.append(symptom.strip())
            else:
                GansuSympList.append(row[11])
        if row[4] == "Guangdong" and row[3] != "NaN":
            if ";" in row[11]:
                x = row[11].split(";")
                for symptom in x:
                    GuangdongSympList.append(symptom.strip())
            else:
                GuangdongSympList.append(row[11])
        if row[4] == "Guangxi" and row[3] != "NaN":
            if ";" in row[11]:
                x = row[11].split(";")
                for symptom in x:
                    GuangxiSympList.append(symptom.strip())
            else:
                GuangxiSympList.append(row[11])
        if row[4] == "Guizhou" and row[3] != "NaN":
            if ";" in row[11]:
                x = row[11].split(";")
                for symptom in x:
                    GuizhouSympList.append(symptom.strip())
            else:
                GuizhouSympList.append(row[11])
        if row[4] == "Hokkaido" and row[3] != "NaN":
            if ";" in row[11]:
                x = row[11].split(";")
                for symptom in x:
                    HokkaidoSympList.append(symptom.strip())
            else:
                HokkaidoSympList.append(row[11])
        if row[4] == "Hong Kong" and row[3] != "NaN":
            if ";" in row[11]:
                x = row[11].split(";")
                for symptom in x:
                    HongKongSympList.append(symptom.strip())
            else:
                HongKongSympList.append(row[11])
            
    j = Counter(AichiSympList)
    k = Counter(AnhuiSympList)
    l = Counter(BeijingSympList)
    m = Counter(GansuSympList)
    n = Counter(GuangdongSympList)
    o = Counter(GuangxiSympList)
    p = Counter(GuizhouSympList)
    q = Counter(HokkaidoSympList)
    r = Counter(HongKongSympList)
    
# Now iterate through the list again and add the symptoms.
##########################################################################################
# Combine everything to the new csv file
# Part 1 Age Range Values
# Part 2 Date Format
# Part 3 Average Lat and Long values
# Part 4 Missing Cities
# Part 5 Missing Symptoms
with open('covidResult.csv','w') as outfile:
    with open('covidTrain.csv') as irisfile:
        
        reader = csv.reader(irisfile)
        
        row = next(reader)                # read first line of field names
        outfile.write(','.join(row))
        outfile.write('\n')
        
        for num,row in enumerate(reader):
            idx = 0
            outrow = []
            for val in row:      # check all fields
                if val == "NaN" or "-" in val: # if NaN or age contains "-"
                    if idx == 1: # if age has a range
                        age = val.split('-')
                        newAge = float(float(age[0])+float(age[1]))
                        newAge = newAge / 2
                        outrow.append(str(round(newAge)))
                    if idx == 3: # if city is NaN
                        if row[4] == "Aichi Prefecture":
                            outrow.append(a.most_common(1)[0][0])
                        if row[4] == "Anhui":
                            outrow.append(b.most_common(1)[0][0])
                        if row[4] == "Beijing":
                            outrow.append(c.most_common(1)[0][0])
                        if row[4] == "Gansu":
                            outrow.append(d.most_common(1)[0][0])
                        if row[4] == "Guangdong":
                            outrow.append(e.most_common(1)[0][0])
                        if row[4] == "Guangxi":
                            outrow.append(f.most_common(1)[0][0])
                        if row[4] == "Guizhou":
                            outrow.append(g.most_common(1)[0][0])
                        if row[4] == "Hokkaido":
                            outrow.append(h.most_common(1)[0][0])
                        if row[4] == "Hong Kong":
                            outrow.append(i.most_common(1)[0][0])
                    if idx == 6: # if latitude is NaN
                        if row[4] == "Aichi Prefecture":
                            outrow.append(str(round(AichiLat, 2)))
                        if row[4] == "Anhui":
                            outrow.append(str(round(AnhuiLat, 2)))
                        if row[4] == "Beijing":
                            outrow.append(str(round(BeijingLat, 2)))
                        if row[4] == "Gansu":
                            outrow.append(str(round(GansuLat, 2)))
                        if row[4] == "Guangdong":
                            outrow.append(str(round(GuangdongLat, 2)))
                        if row[4] == "Guangxi":
                            outrow.append(str(round(GuangxiLat, 2)))
                        if row[4] == "Guizhou":
                            outrow.append(str(round(GuizhouLat, 2)))
                        if row[4] == "Hokkaido":
                            outrow.append(str(round(HokkaidoLat, 2)))
                        if row[4] == "Hong Kong":
                            outrow.append(str(round(HongKongLat, 2)))
                    if idx == 7: # if Longitude is NaN
                        if row[4] == "Aichi Prefecture":
                            outrow.append(str(round(AichiLong, 2)))
                        if row[4] == "Anhui":
                            outrow.append(str(round(AnhuiLong, 2)))
                        if row[4] == "Beijing":
                            outrow.append(str(round(BeijingLong, 2)))
                        if row[4] == "Gansu":
                            outrow.append(str(round(GansuLong, 2)))
                        if row[4] == "Guangdong":
                            outrow.append(str(round(GuangdongLong, 2)))
                        if row[4] == "Guangxi":
                            outrow.append(str(round(GuangxiLong, 2)))
                        if row[4] == "Guizhou":
                            outrow.append(str(round(GuizhouLong, 2)))
                        if row[4] == "Hokkaido":
                            outrow.append(str(round(HokkaidoLong, 2)))
                        if row[4] == "Hong Kong":
                            outrow.append(str(round(HongKongLong, 2)))
                    if idx == 11: # if symptom is NaN
                        if row[4] == "Aichi Prefecture":
                            outrow.append(j.most_common(1)[0][0])
                        if row[4] == "Anhui":
                            outrow.append(k.most_common(1)[0][0])
                        if row[4] == "Beijing":
                            outrow.append(l.most_common(1)[0][0])
                        if row[4] == "Gansu":
                            outrow.append(m.most_common(1)[0][0])
                        if row[4] == "Guangdong":
                            outrow.append(n.most_common(1)[0][0])
                        if row[4] == "Guangxi":
                            outrow.append(o.most_common(1)[0][0])
                        if row[4] == "Guizhou":
                            outrow.append(p.most_common(2)[1][0])
                        if row[4] == "Hokkaido":
                            outrow.append(q.most_common(1)[0][0])
                        if row[4] == "Hong Kong":
                            outrow.append(r.most_common(1)[0][0])
                if idx == 8 or idx == 9 or idx == 10:
                    date1, date2, date3 = new_Dates()
                    if idx == 8:
                        outrow.append(str(date1))
                    if idx == 9:
                        outrow.append(str(date2))
                    if idx == 10:
                        outrow.append(str(date3))  
                else:
                    if val == "NaN" or "-" in val: # I need this because of a bug
                        pass
                    else:
                        outrow.append(val) # Otherwise, add to the list
                    
                idx = idx + 1
 
            outfile.write(','.join(outrow))
            outfile.write('\n')
