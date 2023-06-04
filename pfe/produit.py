import requests
from bs4 import BeautifulSoup
import csv
from itertools import zip_longest

liste_marque = []
liste_libelle = []
liste_grammage = []
liste_prix = []
liste_magasin=[]
 #laitue
result = requests.get("https://www.carrefour.tn/default/laitue-2022144800009.html")
src = result.content
soup = BeautifulSoup(src,"lxml")


marque = soup.find_all("div",{"class":"cr-produt-short-description mb-4"})

libelle = soup.find_all("span",{"class":"base"})

grammage = soup.find_all("div",{"class":"cr-produt-short-description mb-4"})

prix =soup.find_all("span",{"class":"price"})

nomMagasin=str('carrefour')
liste_magasin.append(nomMagasin)

for i in range(len(marque)):
    liste_marque.append(marque[i].text)
for i in range(len(libelle)): 
    liste_libelle.append(libelle[i].text)
for i in range(len(grammage)):    
    liste_grammage.append(grammage[i].text.strip())
for i in range(len(prix)):    
    liste_prix.append(prix[i].text.strip())



file_list = [liste_marque,liste_libelle,liste_grammage,liste_prix ,liste_magasin]
exported = zip_longest(*file_list)
with open("C:/Users/Lenovo/Desktop/test/produit_table.csv","w",newline="") as myfile:
    wr = csv.writer(myfile,delimiter=";")
    wr.writerow(['marque',  'libelle',   'grammage',   'prix' ,'nomMagasin'])
    wr.writerows(exported)

#tomates
result1= requests.get("https://www.carrefour.tn/default/tomates-fraiches-concassees-400g-6194001481297.html")
src1 = result1.content
soup1= BeautifulSoup(src1,"lxml")


marque = soup1.find_all("a",{"class":"cr-brand-name"})

libelle = soup1.find_all("span",{"class":"base"})

grammage = soup1.find_all("div",{"class":"cr-produt-short-description mb-4"})

prix =soup1.find_all("span",{"class":"price"})

nomMagasin=str('carrefour')
liste_magasin.append(nomMagasin)


for i in range(len(marque)):
    liste_marque.append(marque[i].text)
for i in range(len(libelle)): 
    liste_libelle.append(libelle[i].text)
for i in range(len(grammage)):    
    liste_grammage.append(grammage[i].text.strip())
for i in range(len(prix)):    
    liste_prix.append(prix[i].text.strip())

    
file_list = [liste_marque,liste_libelle,liste_grammage,liste_prix,liste_magasin]
exported = zip_longest(*file_list)
with open("C:/Users/Lenovo/Desktop/test/produit_table.csv","w",newline="") as myfile:
    wr = csv.writer(myfile,delimiter=";")
    wr.writerow(['marque',  'libelle',   'grammage',   'prix' ,'nomMagasin'])
    wr.writerows(exported)
    
#ongion

result2= requests.get("https://www.carrefour.tn/default/oignon%20rouge%20en%20barquette-6191493700554.html")
src2 = result2.content
soup2= BeautifulSoup(src2,"lxml")


marque = soup2.find_all("div",{"class":"cr-produt-short-description mb-4"})

libelle = soup2.find_all("span",{"class":"base"})

grammage = soup2.find_all("div",{"class":"cr-produt-short-description mb-4"})

prix =soup2.find_all("span",{"class":"price"})

nomMagasin=str('carrefour')
liste_magasin.append(nomMagasin)

for i in range(len(marque)):
    liste_marque.append(marque[i].text)
for i in range(len(libelle)): 
    liste_libelle.append(libelle[i].text)
for i in range(len(grammage)):    
    liste_grammage.append(grammage[i].text.strip())
for i in range(len(prix)):    
    liste_prix.append(prix[i].text.strip())

file_list = [liste_marque,liste_libelle,liste_grammage,liste_prix ,liste_magasin]
exported = zip_longest(*file_list)
with open("C:/Users/Lenovo/Desktop/test/produit_table.csv","w",newline="") as myfile:
    wr = csv.writer(myfile,delimiter=";")
    wr.writerow(['marque',  'libelle',   'grammage',   'prix' ,'nomMagasin'])
    wr.writerows(exported)

#piment de cayenne vert 
result3= requests.get("https://www.carrefour.tn/default/piment-de-cayenne-vert-null-2822674000000.html")
src3 = result3.content
soup3= BeautifulSoup(src3,"lxml")


marque = soup3.find_all("div",{"class":"cr-produt-short-description mb-4"})

libelle = soup3.find_all("span",{"class":"base"})

grammage = soup3.find_all("div",{"class":"cr-produt-short-description mb-4"})

prix =soup3.find_all("span",{"class":"price"})

nomMagasin=str('carrefour')
liste_magasin.append(nomMagasin)

for i in range(len(marque)):
    liste_marque.append(marque[i].text)
for i in range(len(libelle)): 
    liste_libelle.append(libelle[i].text)
for i in range(len(grammage)):    
    liste_grammage.append(grammage[i].text.strip())
for i in range(len(prix)):    
    liste_prix.append(prix[i].text.strip())

file_list = [liste_marque,liste_libelle,liste_grammage,liste_prix ,liste_magasin]
exported = zip_longest(*file_list)
with open("C:/Users/Lenovo/Desktop/test/produit_table.csv","w",newline="") as myfile:
    wr = csv.writer(myfile,delimiter=";")
    wr.writerow(['marque',  'libelle',   'grammage',   'prix' ,'nomMagasin'])
    wr.writerows(exported)


#petit-pois
result4= requests.get("https://www.carrefour.tn/default/petit-pois-null-2856113000000.html")
src4 = result4.content
soup4= BeautifulSoup(src4,"lxml")


marque = soup4.find_all("div",{"class":"cr-produt-short-description mb-4"})

libelle = soup4.find_all("span",{"class":"base"})

grammage = soup4.find_all("div",{"class":"cr-produt-short-description mb-4"})

prix =soup4.find_all("span",{"class":"price"})

nomMagasin=str('carrefour')
liste_magasin.append(nomMagasin)

for i in range(len(marque)):
    liste_marque.append(marque[i].text)
for i in range(len(libelle)): 
    liste_libelle.append(libelle[i].text)
for i in range(len(grammage)):    
    liste_grammage.append(grammage[i].text.strip())
for i in range(len(prix)):    
    liste_prix.append(prix[i].text.strip())

file_list = [liste_marque,liste_libelle,liste_grammage,liste_prix ,liste_magasin]
exported = zip_longest(*file_list)
with open("C:/Users/Lenovo/Desktop/test/produit_table.csv","w",newline="") as myfile:
    wr = csv.writer(myfile,delimiter=";")
    wr.writerow(['marque',  'libelle',   'grammage',   'prix' ,'nomMagasin'])
    wr.writerows(exported)

#ail
result5= requests.get("https://www.carrefour.tn/default/ail-null-2822282000000.html")
src5 = result5.content
soup5= BeautifulSoup(src5,"lxml")


marque = soup5.find_all("div",{"class":"cr-produt-short-description mb-4"})

libelle = soup5.find_all("span",{"class":"base"})

grammage = soup5.find_all("div",{"class":"cr-produt-short-description mb-4"})

prix =soup5.find_all("span",{"class":"price"})

nomMagasin=str('carrefour')
liste_magasin.append(nomMagasin)

for i in range(len(marque)):
    liste_marque.append(marque[i].text)
for i in range(len(libelle)): 
    liste_libelle.append(libelle[i].text)
for i in range(len(grammage)):    
    liste_grammage.append(grammage[i].text.strip())
for i in range(len(prix)):    
    liste_prix.append(prix[i].text.strip())

file_list = [liste_marque,liste_libelle,liste_grammage,liste_prix ,liste_magasin]
exported = zip_longest(*file_list)
with open("C:/Users/Lenovo/Desktop/test/produit_table.csv","w",newline="") as myfile:
    wr = csv.writer(myfile,delimiter=";")
    wr.writerow(['marque',  'libelle',   'grammage',   'prix' ,'nomMagasin'])
    wr.writerows(exported)

#fenouil avec fane
result6= requests.get("https://www.carrefour.tn/default/fenouil-avec-fane.html")
src6 = result6.content
soup6= BeautifulSoup(src6,"lxml")


marque = soup6.find_all("div",{"class":"cr-produt-short-description mb-4"})

libelle = soup6.find_all("span",{"class":"base"})

grammage = soup6.find_all("div",{"class":"cr-produt-short-description mb-4"})

prix =soup6.find_all("span",{"class":"price"})

nomMagasin=str('carrefour')
liste_magasin.append(nomMagasin)

for i in range(len(marque)):
    liste_marque.append(marque[i].text)
for i in range(len(libelle)): 
    liste_libelle.append(libelle[i].text)
for i in range(len(grammage)):    
    liste_grammage.append(grammage[i].text.strip())
for i in range(len(prix)):    
    liste_prix.append(prix[i].text.strip())

file_list = [liste_marque,liste_libelle,liste_grammage,liste_prix ,liste_magasin]
exported = zip_longest(*file_list)
with open("C:/Users/Lenovo/Desktop/test/produit_table.csv","w",newline="") as myfile:
    wr = csv.writer(myfile,delimiter=";")
    wr.writerow(['marque',  'libelle',   'grammage',   'prix' ,'nomMagasin'])
    wr.writerows(exported)

#persil
result7= requests.get("https://www.carrefour.tn/default/persil-2022220016522.html")
src7 = result7.content
soup7= BeautifulSoup(src7,"lxml")


marque = soup7.find_all("div",{"class":"cr-produt-short-description mb-4"})

libelle = soup7.find_all("span",{"class":"base"})

grammage = soup7.find_all("div",{"class":"cr-produt-short-description mb-4"})

prix =soup7.find_all("span",{"class":"price"})

nomMagasin=str('carrefour')
liste_magasin.append(nomMagasin)

for i in range(len(marque)):
    liste_marque.append(marque[i].text)
for i in range(len(libelle)): 
    liste_libelle.append(libelle[i].text)
for i in range(len(grammage)):    
    liste_grammage.append(grammage[i].text.strip())
for i in range(len(prix)):    
    liste_prix.append(prix[i].text.strip())

file_list = [liste_marque,liste_libelle,liste_grammage,liste_prix ,liste_magasin]
exported = zip_longest(*file_list)
with open("C:/Users/Lenovo/Desktop/test/produit_table.csv","w",newline="") as myfile:
    wr = csv.writer(myfile,delimiter=";")
    wr.writerow(['marque',  'libelle',   'grammage',   'prix' ,'nomMagasin'])
    wr.writerows(exported)

#pois de chiche fins 
result8= requests.get("https://www.carrefour.tn/default/null-null-6191454000365.html")
src8= result8.content
soup8= BeautifulSoup(src8,"lxml")


marque = soup8.find_all("div",{"class":"cr-produt-short-description mb-4"})

libelle = soup8.find_all("span",{"class":"base"})

grammage = soup8.find_all("div",{"class":"cr-produt-short-description mb-4"})

prix =soup8.find_all("span",{"class":"price"})

nomMagasin=str('carrefour')
liste_magasin.append(nomMagasin)

for i in range(len(marque)):
    liste_marque.append(marque[i].text)
for i in range(len(libelle)): 
    liste_libelle.append(libelle[i].text)
for i in range(len(grammage)):    
    liste_grammage.append(grammage[i].text.strip())
for i in range(len(prix)):    
    liste_prix.append(prix[i].text.strip())

file_list = [liste_marque,liste_libelle,liste_grammage,liste_prix,liste_magasin]
exported = zip_longest(*file_list)
with open("C:/Users/Lenovo/Desktop/test/produit_table.csv","w",newline="") as myfile:
    wr = csv.writer(myfile,delimiter=";")
    wr.writerow(['marque',  'libelle',   'grammage',   'prix' ,'nomMagasin'])
    wr.writerows(exported)

#haricots 
result9= requests.get("https://www.carrefour.tn/default/haricots-blancs-maam-6191586400316.html")
src9= result9.content
soup9= BeautifulSoup(src9,"lxml")


marque = soup9.find_all("div",{"class":"cr-produt-short-description mb-4"})

libelle = soup9.find_all("span",{"class":"base"})

grammage = soup9.find_all("div",{"class":"cr-produt-short-description mb-4"})

prix =soup9.find_all("span",{"class":"price"})

nomMagasin=str('carrefour')
liste_magasin.append(nomMagasin)

for i in range(len(marque)):
    liste_marque.append(marque[i].text)
for i in range(len(libelle)): 
    liste_libelle.append(libelle[i].text)
for i in range(len(grammage)):    
    liste_grammage.append(grammage[i].text.strip())
for i in range(len(prix)):    
    liste_prix.append(prix[i].text.strip())

file_list = [liste_marque,liste_libelle,liste_grammage,liste_prix ,liste_magasin]
exported = zip_longest(*file_list)
with open("C:/Users/Lenovo/Desktop/test/produit_table.csv","w",newline="") as myfile:
    wr = csv.writer(myfile,delimiter=";")
    wr.writerow(['marque',  'libelle',   'grammage',   'prix' ,'nomMagasin'])
    wr.writerows(exported)



#dattes
result12= requests.get("https://www.carrefour.tn/default/dattes-naturelles-branchees-6191410000033.html")
src12= result12.content
soup12= BeautifulSoup(src12,"lxml")


marque = soup12.find_all("div",{"class":"cr-produt-short-description mb-4"})

libelle = soup12.find_all("span",{"class":"base"})

grammage = soup12.find_all("div",{"class":"cr-produt-short-description mb-4"})

prix =soup12.find_all("span",{"class":"price"})

nomMagasin=str('carrefour')
liste_magasin.append(nomMagasin)

for i in range(len(marque)):
    liste_marque.append(marque[i].text)
for i in range(len(libelle)): 
    liste_libelle.append(libelle[i].text)
for i in range(len(grammage)):    
    liste_grammage.append(grammage[i].text.strip())
for i in range(len(prix)):    
    liste_prix.append(prix[i].text.strip())

file_list = [liste_marque,liste_libelle,liste_grammage,liste_prix ,liste_magasin]
exported = zip_longest(*file_list)
with open("C:/Users/Lenovo/Desktop/test/produit_table.csv","w",newline="") as myfile:
    wr = csv.writer(myfile,delimiter=";")
    wr.writerow(['marque',  'libelle',   'grammage',   'prix','nomMagasin'])
    wr.writerows(exported)

#fraise

result13= requests.get("https://www.carrefour.tn/default/confiture-de-fraises-6221029600116.html")
src13= result13.content
soup13= BeautifulSoup(src13,"lxml")


marque = soup13.find_all("div",{"class":"cr-produt-short-description mb-4"})

libelle = soup13.find_all("span",{"class":"base"})

grammage = soup13.find_all("div",{"class":"cr-produt-short-description mb-4"})

prix =soup13.find_all("span",{"class":"price"})

nomMagasin=str('carrefour')
liste_magasin.append(nomMagasin)

for i in range(len(marque)):
    liste_marque.append(marque[i].text)
for i in range(len(libelle)): 
    liste_libelle.append(libelle[i].text)
for i in range(len(grammage)):    
    liste_grammage.append(grammage[i].text.strip())
for i in range(len(prix)):    
    liste_prix.append(prix[i].text.strip())

file_list = [liste_marque,liste_libelle,liste_grammage,liste_prix,liste_magasin]
exported = zip_longest(*file_list)
with open("C:/Users/Lenovo/Desktop/test/produit_table.csv","w",newline="") as myfile:
    wr = csv.writer(myfile,delimiter=";")
    wr.writerow(['marque',  'libelle',   'grammage',   'prix' ,'nomMagasin'])
    wr.writerows(exported)

#pomme de terre
result14= requests.get("https://www.carrefour.tn/default/pomme-de-terre-null-2800152000000.html")
src14= result14.content
soup14= BeautifulSoup(src14,"lxml")


marque = soup14.find_all("div",{"class":"cr-produt-short-description mb-4"})

libelle = soup14.find_all("span",{"class":"base"})

grammage = soup14.find_all("div",{"class":"cr-produt-short-description mb-4"})

prix =soup14.find_all("span",{"class":"price"})

nomMagasin=str('carrefour')
liste_magasin.append(nomMagasin)

for i in range(len(marque)):
    liste_marque.append(marque[i].text)
for i in range(len(libelle)): 
    liste_libelle.append(libelle[i].text)
for i in range(len(grammage)):    
    liste_grammage.append(grammage[i].text.strip())
for i in range(len(prix)):    
    liste_prix.append(prix[i].text.strip())

file_list = [liste_marque,liste_libelle,liste_grammage,liste_prix,liste_magasin]
exported = zip_longest(*file_list)
with open("C:/Users/Lenovo/Desktop/test/produit_table.csv","w",newline="") as myfile:
    wr = csv.writer(myfile,delimiter=";")
    wr.writerow(['marque',  'libelle',   'grammage',   'prix','nomMagasin'])
    wr.writerows(exported)



#jus poire
result17= requests.get("https://www.carrefour.tn/default/boisson-au-jus-de-poire-6194007892684.html")
src17= result17.content
soup17= BeautifulSoup(src17,"lxml")


marque = soup17.find_all("div",{"class":"cr-produt-short-description mb-4"})

libelle = soup17.find_all("span",{"class":"base"})

grammage = soup17.find_all("div",{"class":"cr-produt-short-description mb-4"})

prix =soup17.find_all("span",{"class":"price"})

nomMagasin=str('carrefour')
liste_magasin.append(nomMagasin)

for i in range(len(marque)):
    liste_marque.append(marque[i].text)
for i in range(len(libelle)): 
    liste_libelle.append(libelle[i].text)
for i in range(len(grammage)):    
    liste_grammage.append(grammage[i].text.strip())
for i in range(len(prix)):    
    liste_prix.append(prix[i].text.strip())

file_list = [liste_marque,liste_libelle,liste_grammage,liste_prix,liste_magasin]
exported = zip_longest(*file_list)
with open("C:/Users/Lenovo/Desktop/test/produit_table.csv","w",newline="") as myfile:
    wr = csv.writer(myfile,delimiter=";")
    wr.writerow(['marque',  'libelle',   'grammage',   'prix' ,'nomMagasin'])
    wr.writerows(exported)


#oeufs chaia 
result18= requests.get("https://www.carrefour.tn/default/ufs-frais-jaune-orange+-null-6191542000161.html")
src18= result18.content
soup18= BeautifulSoup(src18,"lxml")


marque = soup18.find_all("a",{"class":"cr-brand-name"})

libelle = soup18.find_all("span",{"class":"base"})

grammage = soup18.find_all("div",{"class":"cr-produt-short-description mb-4"})

prix =soup18.find_all("span",{"class":"price"})

nomMagasin=str('carrefour')
liste_magasin.append(nomMagasin)

for i in range(len(marque)):
    liste_marque.append(marque[i].text)
for i in range(len(libelle)): 
    liste_libelle.append(libelle[i].text)
for i in range(len(grammage)):    
    liste_grammage.append(grammage[i].text.strip())
for i in range(len(prix)):    
    liste_prix.append(prix[i].text.strip())

file_list = [liste_marque,liste_libelle,liste_grammage,liste_prix,liste_magasin]
exported = zip_longest(*file_list)
with open("C:/Users/Lenovo/Desktop/test/produit_table.csv","w",newline="") as myfile:
    wr = csv.writer(myfile,delimiter=";")
    wr.writerow(['marque',  'libelle',   'grammage',   'prix' ,'nomMagasin'])
    wr.writerows(exported)

#oeufs elmazraa
result19= requests.get("https://www.carrefour.tn/default/ufs-frais-adhayma-el-brika-null-6191597900065.html")
src19= result19.content
soup19= BeautifulSoup(src19,"lxml")


marque = soup19.find_all("a",{"class":"cr-brand-name"})

libelle = soup19.find_all("span",{"class":"base"})

grammage = soup19.find_all("div",{"class":"cr-produt-short-description mb-4"})

prix =soup19.find_all("span",{"class":"price"})

nomMagasin=str('carrefour')
liste_magasin.append(nomMagasin)

for i in range(len(marque)):
    liste_marque.append(marque[i].text)
for i in range(len(libelle)): 
    liste_libelle.append(libelle[i].text)
for i in range(len(grammage)):    
    liste_grammage.append(grammage[i].text.strip())
for i in range(len(prix)):    
    liste_prix.append(prix[i].text.strip())

file_list = [liste_marque,liste_libelle,liste_grammage,liste_prix ,liste_magasin]
exported = zip_longest(*file_list)
with open("C:/Users/Lenovo/Desktop/test/produit_table.csv","w",newline="") as myfile:
    wr = csv.writer(myfile,delimiter=";")
    wr.writerow(['marque',  'libelle',   'grammage',   'prix','nomMagasin'])
    wr.writerows(exported)


#chamia
result21= requests.get("https://www.carrefour.tn/default/chamia-aux-amandes-6194004001256.html")
src21= result21.content
soup21= BeautifulSoup(src21,"lxml")


marque = soup21.find_all("a",{"class":"cr-brand-name"})

libelle = soup21.find_all("span",{"class":"base"})

grammage = soup21.find_all("div",{"class":"cr-produt-short-description mb-4"})

prix =soup21 .find_all("span",{"class":"price"})

nomMagasin=str('carrefour')
liste_magasin.append(nomMagasin)

for i in range(len(marque)):
    liste_marque.append(marque[i].text)
for i in range(len(libelle)): 
    liste_libelle.append(libelle[i].text)
for i in range(len(grammage)):    
    liste_grammage.append(grammage[i].text.strip())
for i in range(len(prix)):    
    liste_prix.append(prix[i].text.strip())

file_list = [liste_marque,liste_libelle,liste_grammage,liste_prix,liste_magasin]
exported = zip_longest(*file_list)
with open("C:/Users/Lenovo/Desktop/test/produit_table.csv","w",newline="") as myfile:
    wr = csv.writer(myfile,delimiter=";")
    wr.writerow(['marque',  'libelle',   'grammage',   'prix','nomMagasin'])
    wr.writerows(exported)


#miel romarin
result26= requests.get("https://www.carrefour.tn/default/miel-de-romarin-250g-6191523300150.html")
src26= result26.content
soup26= BeautifulSoup(src26,"lxml")


marque = soup26.find_all("a",{"class":"cr-brand-name"})

libelle = soup26.find_all("span",{"class":"base"})

grammage = soup26.find_all("div",{"class":"cr-produt-short-description mb-4"})

prix =soup26.find_all("span",{"class":"price"})

nomMagasin=str('carrefour')
liste_magasin.append(nomMagasin)

for i in range(len(marque)):
    liste_marque.append(marque[i].text)
for i in range(len(libelle)): 
    liste_libelle.append(libelle[i].text)
for i in range(len(grammage)):    
    liste_grammage.append(grammage[i].text.strip())
for i in range(len(prix)):    
    liste_prix.append(prix[i].text.strip())

file_list = [liste_marque,liste_libelle,liste_grammage,liste_prix,liste_magasin]
exported = zip_longest(*file_list)
with open("C:/Users/Lenovo/Desktop/test/produit_table.csv","w",newline="") as myfile:
    wr = csv.writer(myfile,delimiter=";")
    wr.writerow(['marque',  'libelle',   'grammage',   'prix' , 'nomMagasin'])
    wr.writerows(exported)

#sumon fumé
result27= requests.get("https://www.carrefour.tn/default/saumon-fume-aux-poivres-null-6191529200171.html")
src27= result27.content
soup27= BeautifulSoup(src27,"lxml")


marque = soup27.find_all("a",{"class":"cr-brand-name"})

libelle = soup27.find_all("span",{"class":"base"})

grammage = soup27.find_all("div",{"class":"cr-produt-short-description mb-4"})

prix =soup27.find_all("span",{"class":"price"})

nomMagasin=str('carrefour')
liste_magasin.append(nomMagasin)

for i in range(len(marque)):
    liste_marque.append(marque[i].text)
for i in range(len(libelle)): 
    liste_libelle.append(libelle[i].text)
for i in range(len(grammage)):    
    liste_grammage.append(grammage[i].text.strip())
for i in range(len(prix)):    
    liste_prix.append(prix[i].text.strip())

file_list = [liste_marque,liste_libelle,liste_grammage,liste_prix,liste_magasin]
exported = zip_longest(*file_list)
with open("C:/Users/Lenovo/Desktop/test/produit_table.csv","w",newline="") as myfile:
    wr = csv.writer(myfile,delimiter=";")
    wr.writerow(['marque',  'libelle',   'grammage',   'prix','nomMagasin'])
    wr.writerows(exported)

#tomate petit paris  
result28= requests.get("https://www.carrefour.tn/default/tomates-concassees-au-basilic-6194003220429.html")
src28= result28.content
soup28= BeautifulSoup(src28,"lxml")


marque = soup28.find_all("a",{"class":"cr-brand-name"})

libelle = soup28.find_all("span",{"class":"base"})

grammage = soup28.find_all("div",{"class":"cr-produt-short-description mb-4"})

prix =soup28.find_all("span",{"class":"price"})

nomMagasin=str('carrefour')
liste_magasin.append(nomMagasin)


for i in range(len(marque)):
    liste_marque.append(marque[i].text)
for i in range(len(libelle)): 
    liste_libelle.append(libelle[i].text)
for i in range(len(grammage)):    
    liste_grammage.append(grammage[i].text.strip())
for i in range(len(prix)):    
    liste_prix.append(prix[i].text.strip())

file_list = [liste_marque,liste_libelle,liste_grammage,liste_prix,liste_magasin]
exported = zip_longest(*file_list)
with open("C:/Users/Lenovo/Desktop/test/produit_table.csv","w",newline="") as myfile:
    wr = csv.writer(myfile,delimiter=";")
    wr.writerow(['marque',  'libelle',   'grammage',   'prix','nomMagasin'])
    wr.writerows(exported)


#poulet
result29= requests.get("https://www.carrefour.tn/default/cuisse-de-poulet-null-2400975000000.html")
src29= result29.content
soup29= BeautifulSoup(src29,"lxml")


marque = soup29.find_all("a",{"class":"cr-brand-name"})

libelle = soup29.find_all("span",{"class":"base"})

grammage = soup29.find_all("div",{"class":"cr-produt-short-description mb-4"})

prix =soup29.find_all("span",{"class":"price"})

nomMagasin=str('carrefour')
liste_magasin.append(nomMagasin)

for i in range(len(marque)):
    liste_marque.append(marque[i].text)
for i in range(len(libelle)): 
    liste_libelle.append(libelle[i].text)
for i in range(len(grammage)):    
    liste_grammage.append(grammage[i].text.strip())
for i in range(len(prix)):    
    liste_prix.append(prix[i].text.strip())

file_list = [liste_marque,liste_libelle,liste_grammage,liste_prix,liste_magasin]
exported = zip_longest(*file_list)
with open("C:/Users/Lenovo/Desktop/test/produit_table.csv","w",newline="") as myfile:
    wr = csv.writer(myfile,delimiter=";")
    wr.writerow(['marque',  'libelle',   'grammage',   'prix','nomMagasin'])
    wr.writerows(exported)
#bouteilles aqualine
result31= requests.get("https://www.carrefour.tn/default/eau-minerale-aqualine-2l-2l-6191556500039.html")
src31= result31.content
soup31= BeautifulSoup(src31,"lxml")


marque = soup31.find_all("a",{"class":"cr-brand-name"})

libelle = soup31.find_all("span",{"class":"base"})

grammage = soup31.find_all("div",{"class":"cr-produt-short-description mb-4"})

prix =soup31.find_all("span",{"class":"price"})

nomMagasin=str('carrefour')
liste_magasin.append(nomMagasin)

for i in range(len(marque)):
    liste_marque.append(marque[i].text)
for i in range(len(libelle)): 
    liste_libelle.append(libelle[i].text)
for i in range(len(grammage)):    
    liste_grammage.append(grammage[i].text.strip())
for i in range(len(prix)):    
    liste_prix.append(prix[i].text.strip())

file_list = [liste_marque,liste_libelle,liste_grammage,liste_prix,liste_magasin]
exported = zip_longest(*file_list)
with open("C:/Users/Lenovo/Desktop/test/produit_table.csv","w",newline="") as myfile:
    wr = csv.writer(myfile,delimiter=";")
    wr.writerow(['marque',  'libelle',   'grammage',   'prix','nomMagasin'])
    wr.writerows(exported)

#********************************************MONOPRIX****************************************************************

#laitue
result33 = requests.get("https://courses.monoprix.tn/bardo/salades/20037-salade-laitue.html")
src33 = result33.content
soup33 = BeautifulSoup(src33,"lxml")


marque = soup33.find_all("div",{"class":"marque"})

libelle = soup33.find_all("h1",{"class":"productpage_title"})

grammage = soup33.find_all("dd",{"class":"value"})

prix =soup33.find_all("span",{"content":"1.35"})

nomMagasin=str('monoprix')
liste_magasin.append(nomMagasin)


for i in range(len(marque)):
    liste_marque.append(marque[i].text)
for i in range(len(libelle)): 
    liste_libelle.append(libelle[i].text)
for i in range(len(grammage)):    
    liste_grammage.append(grammage[i].text.strip())
for i in range(len(prix)):    
    liste_prix.append(prix[i].text.strip())


file_list = [liste_marque,liste_libelle,liste_grammage,liste_prix,liste_magasin]
exported = zip_longest(*file_list)
with open("C:/Users/Lenovo/Desktop/test/produit_table.csv","w",newline="") as myfile:
    wr = csv.writer(myfile,delimiter=";")
    wr.writerow(['marque',  'libelle',   'grammage',   'prix' ,'nomMagasin' ])
    wr.writerows(exported)

#tomate
result34 = requests.get("https://courses.monoprix.tn/bardo/tomates/16910-concentr%C3%A9-de-tomate.html?search_query=tomate%20jouda&fast_search=fs")
src34 = result34.content
soup34 = BeautifulSoup(src34,"lxml")


marque = soup34.find_all("div",{"class":"marque"})

libelle = soup34.find_all("h1",{"class":"productpage_title"})

grammage = soup34.find_all("dd",{"class":"value"})

prix =soup34.find_all("span",{"content":"2.59"})

nomMagasin=str('monoprix')
liste_magasin.append(nomMagasin)

for i in range(len(marque)):
    liste_marque.append(marque[i].text)
for i in range(len(libelle)): 
    liste_libelle.append(libelle[i].text)
for i in range(len(grammage)):    
    liste_grammage.append(grammage[i].text.strip())
for i in range(len(prix)):    
    liste_prix.append(prix[i].text.strip())


file_list = [liste_marque,liste_libelle,liste_grammage,liste_prix,liste_magasin]
exported = zip_longest(*file_list)
with open("C:/Users/Lenovo/Desktop/test/produit_table.csv","w",newline="") as myfile:
    wr = csv.writer(myfile,delimiter=";")
    wr.writerow(['marque',  'libelle',   'grammage',   'prix' ,'nomMagasin' ])
    wr.writerows(exported)

#ognion
result35 = requests.get("https://courses.monoprix.tn/bardo/l%C3%A9gumes-frais/20021-oignon-rebeii.html?search_query=oig&fast_search=fs")
src35 = result35.content
soup35 = BeautifulSoup(src35,"lxml")


marque = soup35.find_all("div",{"class":"marque"})

libelle = soup35.find_all("h1",{"class":"productpage_title"})

grammage = soup35.find_all("dd",{"class":"value"})

prix =soup35.find_all("span",{"content":"1.23"})

nomMagasin=str('monoprix')
liste_magasin.append(nomMagasin)

for i in range(len(marque)):
    liste_marque.append(marque[i].text)
for i in range(len(libelle)): 
    liste_libelle.append(libelle[i].text)
for i in range(len(grammage)):    
    liste_grammage.append(grammage[i].text.strip())
for i in range(len(prix)):    
    liste_prix.append(prix[i].text.strip())


file_list = [liste_marque,liste_libelle,liste_grammage,liste_prix,liste_magasin]
exported = zip_longest(*file_list)
with open("C:/Users/Lenovo/Desktop/test/produit_table.csv","w",newline="") as myfile:
    wr = csv.writer(myfile,delimiter=";")
    wr.writerow(['marque',  'libelle',   'grammage',   'prix','nomMagasin' ])
    wr.writerows(exported)

#piment de cayenne vert 
result36 = requests.get("https://courses.monoprix.tn/bardo/l%C3%A9gumes-frais/20135-piment-meski.html?search_query=piment%20&fast_search=fs")
src36 = result36.content
soup36 = BeautifulSoup(src36,"lxml")


marque = soup36.find_all("div",{"class":"marque"})

libelle = soup36.find_all("h1",{"class":"productpage_title"})

grammage = soup36.find_all("dd",{"class":"value"})

prix =soup36.find_all("span",{"content":"3.68"})

nomMagasin=str('monoprix')
liste_magasin.append(nomMagasin)

for i in range(len(marque)):
    liste_marque.append(marque[i].text)
for i in range(len(libelle)): 
    liste_libelle.append(libelle[i].text)
for i in range(len(grammage)):    
    liste_grammage.append(grammage[i].text.strip())
for i in range(len(prix)):    
    liste_prix.append(prix[i].text.strip())


file_list = [liste_marque,liste_libelle,liste_grammage,liste_prix,liste_magasin]
exported = zip_longest(*file_list)
with open("C:/Users/Lenovo/Desktop/test/produit_table.csv","w",newline="") as myfile:
    wr = csv.writer(myfile,delimiter=";")
    wr.writerow(['marque',  'libelle',   'grammage',   'prix','nomMagasin' ])
    wr.writerows(exported)
    
#petit-pois 
result37 = requests.get("https://courses.monoprix.tn/bardo/l%C3%A9gumes-frais/20019-petit-pois.html")
src37 = result37.content
soup37 = BeautifulSoup(src37,"lxml")


marque = soup37.find_all("div",{"class":"marque"})

libelle = soup37.find_all("h1",{"class":"productpage_title"})

grammage = soup37.find_all("dd",{"class":"value"})

prix =soup37.find_all("span",{"content":"5.5"})

nomMagasin=str('monoprix')
liste_magasin.append(nomMagasin)

for i in range(len(marque)):
    liste_marque.append(marque[i].text)
for i in range(len(libelle)): 
    liste_libelle.append(libelle[i].text)
for i in range(len(grammage)):    
    liste_grammage.append(grammage[i].text.strip())
for i in range(len(prix)):    
    liste_prix.append(prix[i].text.strip())


file_list = [liste_marque,liste_libelle,liste_grammage,liste_prix,liste_magasin]
exported = zip_longest(*file_list)
with open("C:/Users/Lenovo/Desktop/test/produit_table.csv","w",newline="") as myfile:
    wr = csv.writer(myfile,delimiter=";")
    wr.writerow(['marque',  'libelle',   'grammage',   'prix' ,'nomMagasin'])
    wr.writerows(exported)
    
#ail 
result38 = requests.get("https://courses.monoprix.tn/bardo/l%C3%A9gumes-frais/20130-ail-rouge-sec-import%C3%A9.html")
src38= result38.content
soup38 = BeautifulSoup(src38,"lxml")


marque = soup38.find_all("div",{"class":"marque"})

libelle = soup38.find_all("h1",{"class":"productpage_title"})

grammage = soup38.find_all("dd",{"class":"value"})

prix =soup38.find_all("span",{"content":"15"})

nomMagasin=str('monoprix')
liste_magasin.append(nomMagasin)


for i in range(len(marque)):
    liste_marque.append(marque[i].text)
for i in range(len(libelle)): 
    liste_libelle.append(libelle[i].text)
for i in range(len(grammage)):    
    liste_grammage.append(grammage[i].text.strip())
for i in range(len(prix)):    
    liste_prix.append(prix[i].text.strip())


file_list = [liste_marque,liste_libelle,liste_grammage,liste_prix,liste_magasin]
exported = zip_longest(*file_list)
with open("C:/Users/Lenovo/Desktop/test/produit_table.csv","w",newline="") as myfile:
    wr = csv.writer(myfile,delimiter=";")
    wr.writerow(['marque',  'libelle',   'grammage',   'prix' ,'nomMagasin'])
    wr.writerows(exported)
    
#fenouil avec fane 
result39 = requests.get("https://courses.monoprix.tn/bardo/l%C3%A9gumes-frais/20007-t%C3%AAte-de-fenouil.html?search_query=fenouil%20avec&fast_search=fs")
src39 = result39.content
soup39 = BeautifulSoup(src39,"lxml")


marque = soup39.find_all("div",{"class":"marque"})

libelle = soup39.find_all("h1",{"class":"productpage_title"})

grammage = soup39.find_all("dd",{"class":"value"})

prix =soup39.find_all("span",{"content":"1.59"})

nomMagasin=str('monoprix')
liste_magasin.append(nomMagasin)

for i in range(len(marque)):
    liste_marque.append(marque[i].text)
for i in range(len(libelle)): 
    liste_libelle.append(libelle[i].text)
for i in range(len(grammage)):    
    liste_grammage.append(grammage[i].text.strip())
for i in range(len(prix)):    
    liste_prix.append(prix[i].text.strip())


file_list = [liste_marque,liste_libelle,liste_grammage,liste_prix,liste_magasin]
exported = zip_longest(*file_list)
with open("C:/Users/Lenovo/Desktop/test/produit_table.csv","w",newline="") as myfile:
    wr = csv.writer(myfile,delimiter=";")
    wr.writerow(['marque',  'libelle',   'grammage',   'prix', 'nomMagasin' ])
    wr.writerows(exported)

#persil 
result40 = requests.get("https://courses.monoprix.tn/bardo/l%C3%A9gumes-frais/20039-persil.html")
src40 = result40.content
soup40 = BeautifulSoup(src40,"lxml")


marque = soup40.find_all("div",{"class":"marque"})

libelle = soup40.find_all("h1",{"class":"productpage_title"})

grammage = soup40.find_all("dd",{"class":"value"})

prix =soup40.find_all("span",{"content":"0.4"})

nomMagasin=str('monoprix')
liste_magasin.append(nomMagasin)

for i in range(len(marque)):
    liste_marque.append(marque[i].text)
for i in range(len(libelle)): 
    liste_libelle.append(libelle[i].text)
for i in range(len(grammage)):    
    liste_grammage.append(grammage[i].text.strip())
for i in range(len(prix)):    
    liste_prix.append(prix[i].text.strip())


file_list = [liste_marque,liste_libelle,liste_grammage,liste_prix,liste_magasin]
exported = zip_longest(*file_list)
with open("C:/Users/Lenovo/Desktop/test/produit_table.csv","w",newline="") as myfile:
    wr = csv.writer(myfile,delimiter=";")
    wr.writerow(['marque',  'libelle',   'grammage',   'prix' ,'nomMagasin '])
    wr.writerows(exported)   

#pois de chiche fins
result41 = requests.get("https://courses.monoprix.tn/bardo/legumes/29373-pois-chiche.html")
src41 = result41.content
soup41 = BeautifulSoup(src41,"lxml")


marque = soup41.find_all("div",{"class":"marque"})

libelle = soup41.find_all("h1",{"class":"productpage_title"})

grammage = soup41.find_all("dd",{"class":"value"})

prix =soup41.find_all("span",{"content":"5.34"})

nomMagasin=str('monoprix')
liste_magasin.append(nomMagasin)


for i in range(len(marque)):
    liste_marque.append(marque[i].text)
for i in range(len(libelle)): 
    liste_libelle.append(libelle[i].text)
for i in range(len(grammage)):    
    liste_grammage.append(grammage[i].text.strip())
for i in range(len(prix)):    
    liste_prix.append(prix[i].text.strip())


file_list = [liste_marque,liste_libelle,liste_grammage,liste_prix,liste_magasin]
exported = zip_longest(*file_list)
with open("C:/Users/Lenovo/Desktop/test/produit_table.csv","w",newline="") as myfile:
    wr = csv.writer(myfile,delimiter=";")
    wr.writerow(['marque',  'libelle',   'grammage',   'prix' ,'nomMagasin' ])
    wr.writerows(exported)   




#haricots
result42 = requests.get("https://courses.monoprix.tn/bardo/fruits-et-l%C3%A9gumes/29375-haricots-blancs.html")
src42 = result42.content
soup42 = BeautifulSoup(src42,"lxml")


marque = soup42.find_all("div",{"class":"marque"})

libelle = soup42.find_all("h1",{"class":"productpage_title"})

grammage = soup42.find_all("dd",{"class":"value"})

prix =soup42.find_all("span",{"content":"4.39"})

nomMagasin=str('monoprix')
liste_magasin.append(nomMagasin)

for i in range(len(marque)):
    liste_marque.append(marque[i].text)
for i in range(len(libelle)): 
    liste_libelle.append(libelle[i].text)
for i in range(len(grammage)):    
    liste_grammage.append(grammage[i].text.strip())
for i in range(len(prix)):    
    liste_prix.append(prix[i].text.strip())


file_list = [liste_marque,liste_libelle,liste_grammage,liste_prix ,liste_magasin]
exported = zip_longest(*file_list)
with open("C:/Users/Lenovo/Desktop/test/produit_table.csv","w",newline="") as myfile:
    wr = csv.writer(myfile,delimiter=";")
    wr.writerow(['marque',  'libelle',   'grammage',   'prix' ,'nomMagasin'])
    wr.writerows(exported) 


#dattes
result43 = requests.get("https://courses.monoprix.tn/bardo/dattes/20211-dattes-branchees.html")
src43 = result43.content
soup43 = BeautifulSoup(src43,"lxml")


marque = soup43.find_all("div",{"class":"marque"})

libelle = soup43.find_all("h1",{"class":"productpage_title"})

grammage = soup43.find_all("dd",{"class":"value"})

prix =soup43.find_all("span",{"content":"13.2"})

nomMagasin=str('monoprix')
liste_magasin.append(nomMagasin)

for i in range(len(marque)):
    liste_marque.append(marque[i].text)
for i in range(len(libelle)): 
    liste_libelle.append(libelle[i].text)
for i in range(len(grammage)):    
    liste_grammage.append(grammage[i].text.strip())
for i in range(len(prix)):    
    liste_prix.append(prix[i].text.strip())


file_list = [liste_marque,liste_libelle,liste_grammage,liste_prix,liste_magasin]
exported = zip_longest(*file_list)
with open("C:/Users/Lenovo/Desktop/test/produit_table.csv","w",newline="") as myfile:
    wr = csv.writer(myfile,delimiter=";")
    wr.writerow(['marque',  'libelle',   'grammage',   'prix','nomMagasin' ])
    wr.writerows(exported) 

#confiture fraise
result44 = requests.get(" https://courses.monoprix.tn/bardo/confitures/16378-confiture.html")
src44 = result44.content
soup44 = BeautifulSoup(src44,"lxml")


marque = soup44.find_all("div",{"class":"marque"})

libelle = soup44.find_all("h1",{"class":"productpage_title"})

grammage = soup44.find_all("dd",{"class":"value"},limit=1)

prix =soup44.find_all("span",{"content":"4.52"})

nomMagasin=str('monoprix')
liste_magasin.append(nomMagasin)

for i in range(len(marque)):
    liste_marque.append(marque[i].text)
for i in range(len(libelle)): 
    liste_libelle.append(libelle[i].text)
for i in range(len(grammage)):    
    liste_grammage.append(grammage[i].text.strip())
for i in range(len(prix)):    
    liste_prix.append(prix[i].text.strip())


file_list = [liste_marque,liste_libelle,liste_grammage,liste_prix,liste_magasin]
exported = zip_longest(*file_list)
with open("C:/Users/Lenovo/Desktop/test/produit_table.csv","w",newline="") as myfile:
    wr = csv.writer(myfile,delimiter=";")
    wr.writerow(['marque',  'libelle',   'grammage',   'prix','nomMagasin' ])
    wr.writerows(exported) 

#pomme de terre 
result45 = requests.get("https://courses.monoprix.tn/bardo/l%C3%A9gumes-frais/20016-pomme-de-terre-nouvelle.html")
src45 = result45.content
soup45 = BeautifulSoup(src45,"lxml")


marque = soup45.find_all("div",{"class":"marque"})

libelle = soup45.find_all("h1",{"class":"productpage_title"})

grammage = soup45.find_all("dd",{"class":"value"})

prix =soup45.find_all("span",{"content":"1.74"})

nomMagasin=str('monoprix')
liste_magasin.append(nomMagasin)

for i in range(len(marque)):
    liste_marque.append(marque[i].text)
for i in range(len(libelle)): 
    liste_libelle.append(libelle[i].text)
for i in range(len(grammage)):    
    liste_grammage.append(grammage[i].text.strip())
for i in range(len(prix)):    
    liste_prix.append(prix[i].text.strip())


file_list = [liste_marque,liste_libelle,liste_grammage,liste_prix,liste_magasin]
exported = zip_longest(*file_list)
with open("C:/Users/Lenovo/Desktop/test/produit_table.csv","w",newline="") as myfile:
    wr = csv.writer(myfile,delimiter=";")
    wr.writerow(['marque',  'libelle',   'grammage',   'prix','nomMagasin'  ])
    wr.writerows(exported) 


# jus poire
result46 = requests.get("https://courses.monoprix.tn/bardo/nectar-de-fruits/19187-nectar.html")
src46 = result46.content
soup46 = BeautifulSoup(src46,"lxml")


marque = soup46.find_all("div",{"class":"marque"})

libelle = soup46.find_all("h1",{"class":"productpage_title"})

grammage = soup46.find_all("dd",{"class":"value"} , limit=1)

prix =soup46.find_all("span",{"content":"3.8"})

nomMagasin=str('monoprix')
liste_magasin.append(nomMagasin)

for i in range(len(marque)):
    liste_marque.append(marque[i].text)
for i in range(len(libelle)): 
    liste_libelle.append(libelle[i].text)
for i in range(len(grammage)):    
    liste_grammage.append(grammage[i].text.strip())
for i in range(len(prix)):    
    liste_prix.append(prix[i].text.strip())


file_list = [liste_marque,liste_libelle,liste_grammage,liste_prix,liste_magasin]
exported = zip_longest(*file_list)
with open("C:/Users/Lenovo/Desktop/test/produit_table.csv","w",newline="") as myfile:
    wr = csv.writer(myfile,delimiter=";")
    wr.writerow(['marque',  'libelle',   'grammage',   'prix','nomMagasin'  ])
    wr.writerows(exported) 

# oeufs chaia
result47 = requests.get("https://courses.monoprix.tn/bardo/oeufs/29253-%C5%93ufs.html")
src47 = result47.content
soup47 = BeautifulSoup(src47,"lxml")


marque = soup47.find_all("div",{"class":"marque"})

libelle = soup47.find_all("h1",{"class":"productpage_title"})

grammage = soup47.find_all("dd",{"class":"value"} , limit=1)

prix =soup47.find_all("span",{"content":"18.19"})

nomMagasin=str('monoprix')
liste_magasin.append(nomMagasin)

for i in range(len(marque)):
    liste_marque.append(marque[i].text)
for i in range(len(libelle)): 
    liste_libelle.append(libelle[i].text)
for i in range(len(grammage)):    
    liste_grammage.append(grammage[i].text.strip())
for i in range(len(prix)):    
    liste_prix.append(prix[i].text.strip())


file_list = [liste_marque,liste_libelle,liste_grammage,liste_prix,liste_magasin]
exported = zip_longest(*file_list)
with open("C:/Users/Lenovo/Desktop/test/produit_table.csv","w",newline="") as myfile:
    wr = csv.writer(myfile,delimiter=";")
    wr.writerow(['marque',  'libelle',   'grammage',   'prix' ,'nomMagasin' ])
    wr.writerows(exported) 
# oeufs mazraa
result48 = requests.get("https://courses.monoprix.tn/bardo/oeufs/19263-%C5%93ufs.html")
src48 = result48.content
soup48 = BeautifulSoup(src48,"lxml")


marque = soup48.find_all("div",{"class":"marque"})

libelle = soup48.find_all("h1",{"class":"productpage_title"})

grammage = soup48.find_all("dd",{"class":"value"} , limit=1)

prix =soup48.find_all("span",{"content":"14.7"})

nomMagasin=str('monoprix')
liste_magasin.append(nomMagasin)

for i in range(len(marque)):
    liste_marque.append(marque[i].text)
for i in range(len(libelle)): 
    liste_libelle.append(libelle[i].text)
for i in range(len(grammage)):    
    liste_grammage.append(grammage[i].text.strip())
for i in range(len(prix)):    
    liste_prix.append(prix[i].text.strip())


file_list = [liste_marque,liste_libelle,liste_grammage,liste_prix,liste_magasin]
exported = zip_longest(*file_list)
with open("C:/Users/Lenovo/Desktop/test/produit_table.csv","w",newline="") as myfile:
    wr = csv.writer(myfile,delimiter=";")
    wr.writerow(['marque',  'libelle',   'grammage',   'prix' ,'nomMagasin'  ])
    wr.writerows(exported) 

#chamia 
result49 = requests.get("https://courses.monoprix.tn/bardo/chamia/17177-chamia.html")
src49 = result49.content
soup49 = BeautifulSoup(src49,"lxml")


marque = soup49.find_all("div",{"class":"marque"})

libelle = soup49.find_all("h1",{"class":"productpage_title"})

grammage = soup49.find_all("dd",{"class":"value"} , limit=1)

prix =soup49.find_all("span",{"content":"4.29"})

nomMagasin=str('monoprix')
liste_magasin.append(nomMagasin)

for i in range(len(marque)):
    liste_marque.append(marque[i].text)
for i in range(len(libelle)): 
    liste_libelle.append(libelle[i].text)
for i in range(len(grammage)):    
    liste_grammage.append(grammage[i].text.strip())
for i in range(len(prix)):    
    liste_prix.append(prix[i].text.strip())


file_list = [liste_marque,liste_libelle,liste_grammage,liste_prix,liste_magasin]
exported = zip_longest(*file_list)
with open("C:/Users/Lenovo/Desktop/test/produit_table.csv","w",newline="") as myfile:
    wr = csv.writer(myfile,delimiter=";")
    wr.writerow(['marque',  'libelle',   'grammage',   'prix' ,'nomMagasin' ])
    wr.writerows(exported) 

#olives vert 
result50 = requests.get("https://courses.monoprix.tn/bardo/cornichonsolives-et-condiments/20825-olives-vertes-slices.html")
src50 = result50.content
soup50= BeautifulSoup(src50,"lxml")


marque = soup50.find_all("div",{"class":"marque"})

libelle = soup50.find_all("h1",{"class":"productpage_title"})

grammage = soup50.find_all("dd",{"class":"value"} , limit=1)

prix =soup50.find_all("span",{"content":"15"})

nomMagasin=str('monoprix')
liste_magasin.append(nomMagasin)

for i in range(len(marque)):
    liste_marque.append(marque[i].text)
for i in range(len(libelle)): 
    liste_libelle.append(libelle[i].text)
for i in range(len(grammage)):    
    liste_grammage.append(grammage[i].text.strip())
for i in range(len(prix)):    
    liste_prix.append(prix[i].text.strip())


file_list = [liste_marque,liste_libelle,liste_grammage,liste_prix,liste_magasin]
exported = zip_longest(*file_list)
with open("C:/Users/Lenovo/Desktop/test/produit_table.csv","w",newline="") as myfile:
    wr = csv.writer(myfile,delimiter=";")
    wr.writerow(['marque',  'libelle',   'grammage',   'prix' ,'nomMagasin'  ])
    wr.writerows(exported) 

#miel 
result500= requests.get("https://courses.monoprix.tn/bardo/miels/16451-miel.html")
src500 = result500.content
soup500= BeautifulSoup(src500,"lxml")


marque = soup500.find_all("div",{"class":"marque"})

libelle = soup500.find_all("h1",{"class":"productpage_title"})

grammage = soup500.find_all("dd",{"class":"value"} , limit=1)

prix =soup500.find_all("span",{"content":"9.15"})

nomMagasin=str('monoprix')
liste_magasin.append(nomMagasin)

for i in range(len(marque)):
    liste_marque.append(marque[i].text)
for i in range(len(libelle)): 
    liste_libelle.append(libelle[i].text)
for i in range(len(grammage)):    
    liste_grammage.append(grammage[i].text.strip())
for i in range(len(prix)):    
    liste_prix.append(prix[i].text.strip())


file_list = [liste_marque,liste_libelle,liste_grammage,liste_prix,liste_magasin]
exported = zip_longest(*file_list)
with open("C:/Users/Lenovo/Desktop/test/produit_table.csv","w",newline="") as myfile:
    wr = csv.writer(myfile,delimiter=";")
    wr.writerow(['marque',  'libelle',   'grammage',   'prix','nomMagasin'  ])
    wr.writerows(exported) 

#tomate petit paris 
result51 = requests.get("https://courses.monoprix.tn/bardo/tomates/22998-tomate-concass%C3%A9e.html?search_query=tomate%20petit%20p&fast_search=fs")
src51 = result51.content
soup51= BeautifulSoup(src51,"lxml")


marque = soup51.find_all("div",{"class":"marque"})

libelle = soup51.find_all("h1",{"class":"productpage_title"})

grammage = soup51.find_all("dd",{"class":"value"} , limit=1)

prix =soup51.find_all("span",{"content":"2.29"})

nomMagasin=str('monoprix')
liste_magasin.append(nomMagasin)

for i in range(len(marque)):
    liste_marque.append(marque[i].text)
for i in range(len(libelle)): 
    liste_libelle.append(libelle[i].text)
for i in range(len(grammage)):    
    liste_grammage.append(grammage[i].text.strip())
for i in range(len(prix)):    
    liste_prix.append(prix[i].text.strip())


file_list = [liste_marque,liste_libelle,liste_grammage,liste_prix,liste_magasin]
exported = zip_longest(*file_list)
with open("C:/Users/Lenovo/Desktop/test/produit_table.csv","w",newline="") as myfile:
    wr = csv.writer(myfile,delimiter=";")
    wr.writerow(['marque',  'libelle',   'grammage',   'prix','nomMagasin'  ])
    wr.writerows(exported) 

#cuisse poulets

result53 = requests.get("https://courses.monoprix.tn/bardo/volaille-et-lapin/20157-haut-de-cuisse-de-poulet.html")
src53 = result53.content
soup53= BeautifulSoup(src53,"lxml")


marque = soup53.find_all("div",{"class":"marque"})

libelle = soup53.find_all("h1",{"class":"productpage_title"})

grammage = soup53.find_all("dd",{"class":"value"} , limit=1)

prix =soup53.find_all("span",{"content":"12.3"})

nomMagasin=str('monoprix')
liste_magasin.append(nomMagasin)

for i in range(len(marque)):
    liste_marque.append(marque[i].text)
for i in range(len(libelle)): 
    liste_libelle.append(libelle[i].text)
for i in range(len(grammage)):    
    liste_grammage.append(grammage[i].text.strip())
for i in range(len(prix)):    
    liste_prix.append(prix[i].text.strip())


file_list = [liste_marque,liste_libelle,liste_grammage,liste_prix,liste_magasin]
exported = zip_longest(*file_list)
with open("C:/Users/Lenovo/Desktop/test/produit_table.csv","w",newline="") as myfile:
    wr = csv.writer(myfile,delimiter=";")
    wr.writerow(['marque',  'libelle',   'grammage',   'prix' ,'nomMagasin' ])
    wr.writerows(exported) 


#bouteilles d'eau fourat

result52 = requests.get("https://courses.monoprix.tn/bardo/eaux-plates/16886-eau-min%C3%A9rale.html?search_query=eau%20mineral%20&fast_search=fs")
src52 = result52.content
soup52= BeautifulSoup(src52,"lxml")


marque = soup52.find_all("div",{"class":"marque"})

libelle = soup52.find_all("h1",{"class":"productpage_title"})

grammage = soup52.find_all("dd",{"class":"value"} , limit=1)

prix =soup52.find_all("span",{"content":"0.65"})

nomMagasin=str('monoprix')
liste_magasin.append(nomMagasin)

for i in range(len(marque)):
    liste_marque.append(marque[i].text)
for i in range(len(libelle)): 
    liste_libelle.append(libelle[i].text)
for i in range(len(grammage)):    
    liste_grammage.append(grammage[i].text.strip())
for i in range(len(prix)):    
    liste_prix.append(prix[i].text.strip())


file_list = [liste_marque,liste_libelle,liste_grammage,liste_prix,liste_magasin]
exported = zip_longest(*file_list)
with open("C:/Users/Lenovo/Desktop/test/produit_table.csv","w",newline="") as myfile:
    wr = csv.writer(myfile,delimiter=";")
    wr.writerow(['marque',  'libelle',   'grammage',   'prix' ,'nomMagasin'])
    wr.writerows(exported) 

    
#************************geant *************************
#laitue
result55 = requests.get("https://www.geantdrive.tn/tunis-city/salades/23548-salade-laitue.html" , verify=False)
src55 = result55.content
soup55 = BeautifulSoup(src55,"lxml")


marque = soup55.find_all("p",{"class":"manufacturer_product"} ,limit=1)

libelle = soup55.find_all("h1",{"class":"h1 product-head1"})

grammage = soup55.find_all("div",{"id":"product-description-short-23548"})

prix =soup55.find_all("span",{"content":"1.25"})

nomMagasin=str('geant')
liste_magasin.append(nomMagasin)


for i in range(len(marque)):
    liste_marque.append(marque[i].text)
for i in range(len(libelle)): 
    liste_libelle.append(libelle[i].text)
for i in range(len(grammage)):    
    liste_grammage.append(grammage[i].text.strip())
for i in range(len(prix)):    
    liste_prix.append(prix[i].text.strip())


file_list = [liste_marque,liste_libelle,liste_grammage,liste_prix,liste_magasin]
exported = zip_longest(*file_list)
with open("C:/Users/Lenovo/Desktop/test/produit_table.csv","w",newline="") as myfile:
    wr = csv.writer(myfile,delimiter=";")
    wr.writerow(['marque',  'libelle',   'grammage',   'prix' ,'nomMagasin' ])
    wr.writerows(exported)

#tomate
result56 = requests.get("https://www.geantdrive.tn/tunis-city/doubles-concentres-de-tomates/30629-concentre-de-tomate.html" , verify=False)
src56 = result56.content
soup56 = BeautifulSoup(src56,"lxml")


marque = soup56.find_all("p",{"class":"manufacturer_product"} ,limit=1)

libelle = soup56.find_all("h1",{"class":"h1 product-head1"})

grammage = soup56.find_all("div",{"id":"product-description-short-30629"})

prix =soup56.find_all("span",{"content":"1.39"})

nomMagasin=str('geant')
liste_magasin.append(nomMagasin)


for i in range(len(marque)):
    liste_marque.append(marque[i].text)
for i in range(len(libelle)): 
    liste_libelle.append(libelle[i].text)
for i in range(len(grammage)):    
    liste_grammage.append(grammage[i].text.strip())
for i in range(len(prix)):    
    liste_prix.append(prix[i].text.strip())


file_list = [liste_marque,liste_libelle,liste_grammage,liste_prix,liste_magasin]
exported = zip_longest(*file_list)
with open("C:/Users/Lenovo/Desktop/test/produit_table.csv","w",newline="") as myfile:
    wr = csv.writer(myfile,delimiter=";")
    wr.writerow(['marque',  'libelle',   'grammage',   'prix' ,'nomMagasin' ])
    wr.writerows(exported)


#piment de cayenne vert 
result58 = requests.get("https://www.geantdrive.tn/tunis-city/legumes-frais/28313-piment-meski.html" , verify=False)
src58 = result58.content
soup58 = BeautifulSoup(src58,"lxml")


marque = soup58.find_all("p",{"class":"manufacturer_product"} ,limit=1)

libelle = soup58.find_all("h1",{"class":"h1 product-head1"})

grammage = soup58.find_all("div",{"id":"product-description-short-28313"})

prix =soup58.find_all("span",{"content":"3.69"})

nomMagasin=str('geant')
liste_magasin.append(nomMagasin)


for i in range(len(marque)):
    liste_marque.append(marque[i].text)
for i in range(len(libelle)): 
    liste_libelle.append(libelle[i].text)
for i in range(len(grammage)):    
    liste_grammage.append(grammage[i].text.strip())
for i in range(len(prix)):    
    liste_prix.append(prix[i].text.strip())


file_list = [liste_marque,liste_libelle,liste_grammage,liste_prix,liste_magasin]
exported = zip_longest(*file_list)
with open("C:/Users/Lenovo/Desktop/test/produit_table.csv","w",newline="") as myfile:
    wr = csv.writer(myfile,delimiter=";")
    wr.writerow(['marque',  'libelle',   'grammage',   'prix' ,'nomMagasin' ])
    wr.writerows(exported)
    
#petit-pois 
result59 = requests.get("https://www.geantdrive.tn/tunis-city/legumes-frais/28244-petit-pois.html" , verify=False)
src59 = result59.content
soup59 = BeautifulSoup(src59,"lxml")


marque = soup59.find_all("p",{"class":"manufacturer_product"} ,limit=1)

libelle = soup59.find_all("h1",{"class":"h1 product-head1"})

grammage = soup59.find_all("div",{"id":"product-description-short-28244"})

prix =soup59.find_all("span",{"content":"3.8"})

nomMagasin=str('geant')
liste_magasin.append(nomMagasin)


for i in range(len(marque)):
    liste_marque.append(marque[i].text)
for i in range(len(libelle)): 
    liste_libelle.append(libelle[i].text)
for i in range(len(grammage)):    
    liste_grammage.append(grammage[i].text.strip())
for i in range(len(prix)):    
    liste_prix.append(prix[i].text.strip())


file_list = [liste_marque,liste_libelle,liste_grammage,liste_prix,liste_magasin]
exported = zip_longest(*file_list)
with open("C:/Users/Lenovo/Desktop/test/produit_table.csv","w",newline="") as myfile:
    wr = csv.writer(myfile,delimiter=";")
    wr.writerow(['marque',  'libelle',   'grammage',   'prix' ,'nomMagasin' ])
    wr.writerows(exported)
    
#ail
result60 = requests.get("https://www.geantdrive.tn/tunis-city/legumes-frais/28252-ail-rouge-sec-importe.html" , verify=False)
src60 = result60.content
soup60 = BeautifulSoup(src60,"lxml")


marque = soup60.find_all("p",{"class":"manufacturer_product"} ,limit=1)

libelle = soup60.find_all("h1",{"class":"h1 product-head1"})

grammage = soup60.find_all("div",{"id":"product-description-short-28252"})

prix =soup60.find_all("span",{"content":"14.49"})

nomMagasin=str('geant')
liste_magasin.append(nomMagasin)


for i in range(len(marque)):
    liste_marque.append(marque[i].text)
for i in range(len(libelle)): 
    liste_libelle.append(libelle[i].text)
for i in range(len(grammage)):    
    liste_grammage.append(grammage[i].text.strip())
for i in range(len(prix)):    
    liste_prix.append(prix[i].text.strip())


file_list = [liste_marque,liste_libelle,liste_grammage,liste_prix,liste_magasin]
exported = zip_longest(*file_list)
with open("C:/Users/Lenovo/Desktop/test/produit_table.csv","w",newline="") as myfile:
    wr = csv.writer(myfile,delimiter=";")
    wr.writerow(['marque',  'libelle',   'grammage',   'prix' ,'nomMagasin' ])
    wr.writerows(exported)
    
#tete de fenouil
result61 = requests.get("https://www.geantdrive.tn/tunis-city/legumes-frais/28248-tete-de-fenouil.html" , verify=False)
src61 = result61.content
soup61 = BeautifulSoup(src61,"lxml")


marque = soup61.find_all("p",{"class":"manufacturer_product"} ,limit=1)

libelle = soup61.find_all("h1",{"class":"h1 product-head1"})

grammage = soup61.find_all("div",{"id":"product-description-short-28248"})

prix =soup61.find_all("span",{"content":"1.98"})

nomMagasin=str('geant')
liste_magasin.append(nomMagasin)


for i in range(len(marque)):
    liste_marque.append(marque[i].text)
for i in range(len(libelle)): 
    liste_libelle.append(libelle[i].text)
for i in range(len(grammage)):    
    liste_grammage.append(grammage[i].text.strip())
for i in range(len(prix)):    
    liste_prix.append(prix[i].text.strip())


file_list = [liste_marque,liste_libelle,liste_grammage,liste_prix,liste_magasin]
exported = zip_longest(*file_list)
with open("C:/Users/Lenovo/Desktop/test/produit_table.csv","w",newline="") as myfile:
    wr = csv.writer(myfile,delimiter=";")
    wr.writerow(['marque',  'libelle',   'grammage',   'prix' ,'nomMagasin' ])
    wr.writerows(exported)
    
#persil 
result62 = requests.get("https://www.geantdrive.tn/tunis-city/herbes-aromatiques/23571-persil.html" , verify=False)
src62 = result62.content
soup62 = BeautifulSoup(src62,"lxml")


marque = soup62.find_all("p",{"class":"manufacturer_product"} ,limit=1)

libelle = soup62.find_all("h1",{"class":"h1 product-head1"})

grammage = soup62.find_all("div",{"id":"product-description-short-23571"})

prix =soup62.find_all("span",{"content":"0.37"})

nomMagasin=str('geant')
liste_magasin.append(nomMagasin)


for i in range(len(marque)):
    liste_marque.append(marque[i].text)
for i in range(len(libelle)): 
    liste_libelle.append(libelle[i].text)
for i in range(len(grammage)):    
    liste_grammage.append(grammage[i].text.strip())
for i in range(len(prix)):    
    liste_prix.append(prix[i].text.strip())


file_list = [liste_marque,liste_libelle,liste_grammage,liste_prix,liste_magasin]
exported = zip_longest(*file_list)
with open("C:/Users/Lenovo/Desktop/test/produit_table.csv","w",newline="") as myfile:
    wr = csv.writer(myfile,delimiter=";")
    wr.writerow(['marque',  'libelle',   'grammage',   'prix' ,'nomMagasin' ])
    wr.writerows(exported)
    
#pois de chiche fins
result63 = requests.get("https://www.geantdrive.tn/tunis-city/legumes-frais/28244-petit-pois.html" , verify=False)
src63 = result63.content
soup63 = BeautifulSoup(src63,"lxml")


marque = soup63.find_all("p",{"class":"manufacturer_product"} ,limit=1)

libelle = soup63.find_all("h1",{"class":"h1 product-head1"})

grammage = soup63.find_all("div",{"id":"product-description-short-28244"})

prix =soup63.find_all("span",{"content":"3.8"})

nomMagasin=str('geant')
liste_magasin.append(nomMagasin)


for i in range(len(marque)):
    liste_marque.append(marque[i].text)
for i in range(len(libelle)): 
    liste_libelle.append(libelle[i].text)
for i in range(len(grammage)):    
    liste_grammage.append(grammage[i].text.strip())
for i in range(len(prix)):    
    liste_prix.append(prix[i].text.strip())


file_list = [liste_marque,liste_libelle,liste_grammage,liste_prix,liste_magasin]
exported = zip_longest(*file_list)
with open("C:/Users/Lenovo/Desktop/test/produit_table.csv","w",newline="") as myfile:
    wr = csv.writer(myfile,delimiter=";")
    wr.writerow(['marque',  'libelle',   'grammage',   'prix' ,'nomMagasin' ])
    wr.writerows(exported)
    
#haricots
result64 = requests.get("https://www.geantdrive.tn/tunis-city/haricots/28865-haricot-blanc.html" , verify=False)
src64 = result64.content
soup64 = BeautifulSoup(src64,"lxml")


marque = soup64.find_all("p",{"class":"manufacturer_product"} ,limit=1)

libelle = soup64.find_all("h1",{"class":"h1 product-head1"})

grammage = soup64.find_all("div",{"id":"product-description-short-28865"})

prix =soup64.find_all("span",{"content":"2.86"})

nomMagasin=str('geant')
liste_magasin.append(nomMagasin)


for i in range(len(marque)):
    liste_marque.append(marque[i].text)
for i in range(len(libelle)): 
    liste_libelle.append(libelle[i].text)
for i in range(len(grammage)):    
    liste_grammage.append(grammage[i].text.strip())
for i in range(len(prix)):    
    liste_prix.append(prix[i].text.strip())


file_list = [liste_marque,liste_libelle,liste_grammage,liste_prix,liste_magasin]
exported = zip_longest(*file_list)
with open("C:/Users/Lenovo/Desktop/test/produit_table.csv","w",newline="") as myfile:
    wr = csv.writer(myfile,delimiter=";")
    wr.writerow(['marque',  'libelle',   'grammage',   'prix' ,'nomMagasin' ])
    wr.writerows(exported)
    
#confiture fraise 
result65 = requests.get("https://www.geantdrive.tn/tunis-city/confitures/30076-confiture.html" , verify=False)
src65 = result65.content
soup65 = BeautifulSoup(src65,"lxml")


marque = soup65.find_all("p",{"class":"manufacturer_product"} ,limit=1)

libelle = soup65.find_all("h1",{"class":"h1 product-head1"})

grammage = soup65.find_all("div",{"id":"product-description-short-30076"})

prix =soup65.find_all("span",{"content":"7.82"})

nomMagasin=str('geant')
liste_magasin.append(nomMagasin)


for i in range(len(marque)):
    liste_marque.append(marque[i].text)
for i in range(len(libelle)): 
    liste_libelle.append(libelle[i].text)
for i in range(len(grammage)):    
    liste_grammage.append(grammage[i].text.strip())
for i in range(len(prix)):    
    liste_prix.append(prix[i].text.strip())


file_list = [liste_marque,liste_libelle,liste_grammage,liste_prix,liste_magasin]
exported = zip_longest(*file_list)
with open("C:/Users/Lenovo/Desktop/test/produit_table.csv","w",newline="") as myfile:
    wr = csv.writer(myfile,delimiter=";")
    wr.writerow(['marque',  'libelle',   'grammage',   'prix' ,'nomMagasin' ])
    wr.writerows(exported)
    
#pomme de terre 
result66 = requests.get("https://www.geantdrive.tn/tunis-city/legumes-frais/28321-pomme-de-terre-nouvelle.html" , verify=False)
src66 = result66.content
soup66 = BeautifulSoup(src66,"lxml")


marque = soup66.find_all("p",{"class":"manufacturer_product"} ,limit=1)

libelle = soup66.find_all("h1",{"class":"h1 product-head1"})

grammage = soup66.find_all("div",{"id":"product-description-short-28321"})

prix =soup66.find_all("span",{"content":"1.49"})

nomMagasin=str('geant')
liste_magasin.append(nomMagasin)


for i in range(len(marque)):
    liste_marque.append(marque[i].text)
for i in range(len(libelle)): 
    liste_libelle.append(libelle[i].text)
for i in range(len(grammage)):    
    liste_grammage.append(grammage[i].text.strip())
for i in range(len(prix)):    
    liste_prix.append(prix[i].text.strip())


file_list = [liste_marque,liste_libelle,liste_grammage,liste_prix,liste_magasin]
exported = zip_longest(*file_list)
with open("C:/Users/Lenovo/Desktop/test/produit_table.csv","w",newline="") as myfile:
    wr = csv.writer(myfile,delimiter=";")
    wr.writerow(['marque',  'libelle',   'grammage',   'prix' ,'nomMagasin' ])
    wr.writerows(exported)
    
#jus OH 

result67 = requests.get("https://www.geantdrive.tn/tunis-city/sirops-et-concentres-de-sirop/24598-boisson-au-jus.html" , verify=False)
src67 = result67.content
soup67 = BeautifulSoup(src67,"lxml")


marque = soup67.find_all("p",{"class":"manufacturer_product"} ,limit=1)

libelle = soup67.find_all("h1",{"class":"h1 product-head1"})

grammage = soup67.find_all("div",{"id":"product-description-short-24598"})

prix =soup67.find_all("span",{"content":"1.19"})

nomMagasin=str('geant')
liste_magasin.append(nomMagasin)


for i in range(len(marque)):
    liste_marque.append(marque[i].text)
for i in range(len(libelle)): 
    liste_libelle.append(libelle[i].text)
for i in range(len(grammage)):    
    liste_grammage.append(grammage[i].text.strip())
for i in range(len(prix)):    
    liste_prix.append(prix[i].text.strip())


file_list = [liste_marque,liste_libelle,liste_grammage,liste_prix,liste_magasin]
exported = zip_longest(*file_list)
with open("C:/Users/Lenovo/Desktop/test/produit_table.csv","w",newline="") as myfile:
    wr = csv.writer(myfile,delimiter=";")
    wr.writerow(['marque',  'libelle',   'grammage',   'prix' ,'nomMagasin' ])
    wr.writerows(exported)
#chamia gazelle 
result68 = requests.get("https://www.geantdrive.tn/tunis-city/chamia-bsissa-et-zrir/26213-chamia.html" , verify=False)
src68 = result68.content
soup68 = BeautifulSoup(src68,"lxml")


marque = soup68.find_all("p",{"class":"manufacturer_product"} ,limit=1)

libelle = soup68.find_all("h1",{"class":"h1 product-head1"})

grammage = soup68.find_all("div",{"id":"product-description-short-26213"})

prix =soup68.find_all("span",{"content":"4.09"})

nomMagasin=str('geant')
liste_magasin.append(nomMagasin)


for i in range(len(marque)):
    liste_marque.append(marque[i].text)
for i in range(len(libelle)): 
    liste_libelle.append(libelle[i].text)
for i in range(len(grammage)):    
    liste_grammage.append(grammage[i].text.strip())
for i in range(len(prix)):    
    liste_prix.append(prix[i].text.strip())


file_list = [liste_marque,liste_libelle,liste_grammage,liste_prix,liste_magasin]
exported = zip_longest(*file_list)
with open("C:/Users/Lenovo/Desktop/test/produit_table.csv","w",newline="") as myfile:
    wr = csv.writer(myfile,delimiter=";")
    wr.writerow(['marque',  'libelle',   'grammage',   'prix' ,'nomMagasin' ])
    wr.writerows(exported)
    

# miel  
result69 = requests.get("https://www.geantdrive.tn/tunis-city/miels/25977-miel.html" , verify=False)
src69 = result69.content
soup69 = BeautifulSoup(src69,"lxml")


marque = soup69.find_all("p",{"class":"manufacturer_product"} ,limit=1)

libelle = soup69.find_all("h1",{"class":"h1 product-head1"})

grammage = soup69.find_all("div",{"id":"product-description-short-25977"})

prix =soup69.find_all("span",{"content":"9.15"})

nomMagasin=str('geant')
liste_magasin.append(nomMagasin)


for i in range(len(marque)):
    liste_marque.append(marque[i].text)
for i in range(len(libelle)): 
    liste_libelle.append(libelle[i].text)
for i in range(len(grammage)):    
    liste_grammage.append(grammage[i].text.strip())
for i in range(len(prix)):    
    liste_prix.append(prix[i].text.strip())


file_list = [liste_marque,liste_libelle,liste_grammage,liste_prix,liste_magasin]
exported = zip_longest(*file_list)
with open("C:/Users/Lenovo/Desktop/test/produit_table.csv","w",newline="") as myfile:
    wr = csv.writer(myfile,delimiter=";")
    wr.writerow(['marque',  'libelle',   'grammage',   'prix' ,'nomMagasin' ])
    wr.writerows(exported)
    
# olives vertes
result70 = requests.get("https://www.geantdrive.tn/tunis-city/cornichons-olives-et-condiments/51982-olives-vertes-meski-grosses.html" , verify=False)
src70 = result70.content
soup70 = BeautifulSoup(src70,"lxml")


marque = soup70.find_all("p",{"class":"manufacturer_product"} ,limit=1)

libelle = soup70.find_all("h1",{"class":"h1 product-head1"})

grammage = soup70.find_all("div",{"id":"product-description-short-51982"})

prix =soup70.find_all("span",{"content":"8.9"})

nomMagasin=str('geant')
liste_magasin.append(nomMagasin)


for i in range(len(marque)):
    liste_marque.append(marque[i].text)
for i in range(len(libelle)): 
    liste_libelle.append(libelle[i].text)
for i in range(len(grammage)):    
    liste_grammage.append(grammage[i].text.strip())
for i in range(len(prix)):    
    liste_prix.append(prix[i].text.strip())


file_list = [liste_marque,liste_libelle,liste_grammage,liste_prix,liste_magasin]
exported = zip_longest(*file_list)
with open("C:/Users/Lenovo/Desktop/test/produit_table.csv","w",newline="") as myfile:
    wr = csv.writer(myfile,delimiter=";")
    wr.writerow(['marque',  'libelle',   'grammage',   'prix' ,'nomMagasin' ])
    wr.writerows(exported)


#cuisse poulet
result71 = requests.get("https://www.geantdrive.tn/tunis-city/volaille-et-lapin/33788-haut-de-cuisse-de-poulet.html" , verify=False)
src71 = result71.content
soup71 = BeautifulSoup(src71,"lxml")


marque = soup71.find_all("p",{"class":"manufacturer_product"} ,limit=1)

libelle = soup71.find_all("h1",{"class":"h1 product-head1"})

grammage = soup71.find_all("div",{"id":"product-description-short-33788"})

prix =soup71.find_all("span",{"content":"13.54"})

nomMagasin=str('geant')
liste_magasin.append(nomMagasin)


for i in range(len(marque)):
    liste_marque.append(marque[i].text)
for i in range(len(libelle)): 
    liste_libelle.append(libelle[i].text)
for i in range(len(grammage)):    
    liste_grammage.append(grammage[i].text.strip())
for i in range(len(prix)):    
    liste_prix.append(prix[i].text.strip())


file_list = [liste_marque,liste_libelle,liste_grammage,liste_prix,liste_magasin]
exported = zip_longest(*file_list)
with open("C:/Users/Lenovo/Desktop/test/produit_table.csv","w",newline="") as myfile:
    wr = csv.writer(myfile,delimiter=";")
    wr.writerow(['marque',  'libelle',   'grammage',   'prix' ,'nomMagasin' ])
    wr.writerows(exported)

#produits menager 
#msal7a
result72 = requests.get("https://www.carrefour.tn/default/balai-null-6192502700701.html")
src72= result72.content
soup72= BeautifulSoup(src72,"lxml")


marque = soup72.find_all("a",{"class":"cr-brand-name"})

libelle = soup72.find_all("span",{"class":"base"})

grammage = soup72.find_all("div",{"class":"cr-produt-short-description mb-4"})

prix =soup72.find_all("span",{"class":"price"})

nomMagasin =str('carrefour')
liste_magasin.append(nomMagasin)

for i in range(len(marque)):
    liste_marque.append(marque[i].text)
for i in range(len(libelle)): 
    liste_libelle.append(libelle[i].text)
for i in range(len(grammage)):    
    liste_grammage.append(grammage[i].text.strip())
for i in range(len(prix)):    
    liste_prix.append(prix[i].text.strip())
   


file_list = [liste_marque,liste_libelle,liste_grammage,liste_prix,liste_magasin]
exported = zip_longest(*file_list)
with open("C:/Users/Lenovo/Desktop/test/produit_table.csv","w",newline="") as myfile:
    wr = csv.writer(myfile,delimiter=";")
    wr.writerow(['marque',  'libelle',   'grammage',   'prix', 'nomMagasin'])
    wr.writerows(exported)


#raclette
result73 = requests.get("https://www.carrefour.tn/default/raclette-royale-grand-modele-null-6192502700084.html")
src73 = result73.content
soup73 = BeautifulSoup(src73,"lxml")

marque = soup73.find_all("a",{"class":"cr-brand-name"})

libelle = soup73.find_all("span",{"class":"base"})

grammage = soup73.find_all("div",{"class":"cr-produt-short-description mb-4"})

prix =soup73.find_all("span",{"class":"price"})
nomMagasin=str('carrefour')
liste_magasin.append(nomMagasin)

for i in range(len(marque)):
    liste_marque.append(marque[i].text)
for i in range(len(libelle)): 
    liste_libelle.append(libelle[i].text)
for i in range(len(grammage)):    
    liste_grammage.append(grammage[i].text.strip())
for i in range(len(prix)):    
    liste_prix.append(prix[i].text.strip())

file_list = [liste_marque,liste_libelle,liste_grammage,liste_prix,liste_magasin]
exported = zip_longest(*file_list)
with open("C:/Users/Lenovo/Desktop/test/produit_table.csv","w",newline="") as myfile:
    wr = csv.writer(myfile,delimiter=";")
    wr.writerow(['marque',  'libelle',   'grammage',   'prix', 'nomMagasin'])
    wr.writerows(exported)

#lessive fino
result74 = requests.get("https://www.carrefour.tn/default/lessive-en-poudre-rose-300g-6192430014932.html")
src74 = result74.content
soup74 = BeautifulSoup(src74,"lxml")

marque = soup74.find_all("a",{"class":"cr-brand-name"})

libelle = soup74.find_all("span",{"class":"base"})

grammage = soup74.find_all("div",{"class":"cr-produt-short-description mb-4"})

prix =soup74.find_all("span",{"class":"price"})
nomMagasin=str('carrefour')
liste_magasin.append(nomMagasin)

for i in range(len(marque)):
    liste_marque.append(marque[i].text)
for i in range(len(libelle)): 
    liste_libelle.append(libelle[i].text)
for i in range(len(grammage)):    
    liste_grammage.append(grammage[i].text.strip())
for i in range(len(prix)):    
    liste_prix.append(prix[i].text.strip())

file_list = [liste_marque,liste_libelle,liste_grammage,liste_prix,liste_magasin]
exported = zip_longest(*file_list)
with open("C:/Users/Lenovo/Desktop/test/produit_table.csv","w",newline="") as myfile:
    wr = csv.writer(myfile,delimiter=";")
    wr.writerow(['marque',  'libelle',   'grammage',   'prix', 'nomMagasin'])
    wr.writerows(exported)

#lessive lilas
result75 = requests.get("https://www.carrefour.tn/default/lessive-en-poudre-au-savon-de-marseille-1kg-6192477610845.html")
src75 = result75.content
soup75 = BeautifulSoup(src75,"lxml")

marque = soup75.find_all("a",{"class":"cr-brand-name"})

libelle = soup75.find_all("span",{"class":"base"})

grammage = soup75.find_all("div",{"class":"cr-produt-short-description mb-4"})

prix =soup75.find_all("span",{"class":"price"})
nomMagasin=str('carrefour')
liste_magasin.append(nomMagasin)

for i in range(len(marque)):
    liste_marque.append(marque[i].text)
for i in range(len(libelle)): 
    liste_libelle.append(libelle[i].text)
for i in range(len(grammage)):    
    liste_grammage.append(grammage[i].text.strip())
for i in range(len(prix)):    
    liste_prix.append(prix[i].text.strip())

file_list = [liste_marque,liste_libelle,liste_grammage,liste_prix,liste_magasin]
exported = zip_longest(*file_list)
with open("C:/Users/Lenovo/Desktop/test/produit_table.csv","w",newline="") as myfile:
    wr = csv.writer(myfile,delimiter=";")
    wr.writerow(['marque',  'libelle',   'grammage',   'prix','nomMagasin'])
    wr.writerows(exported)    


#savon cartage
result76 = requests.get("https://www.carrefour.tn/default/savon-naturel-500g-6192438500864.html")
src76 = result76.content
soup76= BeautifulSoup(src76,"lxml")

marque = soup76.find_all("a",{"class":"cr-brand-name"})

libelle = soup76.find_all("span",{"class":"base"})

grammage = soup76.find_all("div",{"class":"cr-produt-short-description mb-4"})

prix =soup76.find_all("span",{"class":"price"})
nomMagasin=str('carrefour')
liste_magasin.append(nomMagasin)

for i in range(len(marque)):
    liste_marque.append(marque[i].text)
for i in range(len(libelle)): 
    liste_libelle.append(libelle[i].text)
for i in range(len(grammage)):    
    liste_grammage.append(grammage[i].text.strip())
for i in range(len(prix)):    
    liste_prix.append(prix[i].text.strip())

file_list = [liste_marque,liste_libelle,liste_grammage,liste_prix,liste_magasin]
exported = zip_longest(*file_list)
with open("C:/Users/Lenovo/Desktop/test/produit_table.csv","w",newline="") as myfile:
    wr = csv.writer(myfile,delimiter=";")
    wr.writerow(['marque',  'libelle',   'grammage',   'prix', 'nomMagasin'])
    wr.writerows(exported)        

#assouplissant 3l
result77 = requests.get("https://www.carrefour.tn/default/assouplissant-grand-air-8714789929538.html")
src77= result77.content
soup77 = BeautifulSoup(src77,"lxml")

marque = soup77.find_all("a",{"class":"cr-brand-name"})

libelle = soup77.find_all("span",{"class":"base"})

grammage = soup77.find_all("div",{"class":"cr-produt-short-description mb-4"})

prix =soup77.find_all("span",{"class":"price"})
nomMagasin=str('carrefour')
liste_magasin.append(nomMagasin)

for i in range(len(marque)):
    liste_marque.append(marque[i].text)
for i in range(len(libelle)): 
    liste_libelle.append(libelle[i].text)
for i in range(len(grammage)):    
    liste_grammage.append(grammage[i].text.strip())
for i in range(len(prix)):    
    liste_prix.append(prix[i].text.strip())

file_list = [liste_marque,liste_libelle,liste_grammage,liste_prix,liste_magasin]
exported = zip_longest(*file_list)
with open("C:/Users/Lenovo/Desktop/test/produit_table.csv","w",newline="") as myfile:
    wr = csv.writer(myfile,delimiter=";")
    wr.writerow(['marque',  'libelle',   'grammage',   'prix', 'nomMagasin'])
    wr.writerows(exported)   


#dedorant citron
result78 = requests.get("https://www.carrefour.tn/default/desodorisant-citron-6192000220145.html")
src78= result78.content
soup78= BeautifulSoup(src78,"lxml")

marque = soup78.find_all("a",{"class":"cr-brand-name"})

libelle = soup78.find_all("span",{"class":"base"})

grammage = soup78.find_all("div",{"class":"cr-produt-short-description mb-4"})

prix =soup78.find_all("span",{"class":"price"})
nomMagasin=str('carrefour')
liste_magasin.append(nomMagasin)

for i in range(len(marque)):
    liste_marque.append(marque[i].text)
for i in range(len(libelle)): 
    liste_libelle.append(libelle[i].text)
for i in range(len(grammage)):    
    liste_grammage.append(grammage[i].text.strip())
for i in range(len(prix)):    
    liste_prix.append(prix[i].text.strip())

file_list = [liste_marque,liste_libelle,liste_grammage,liste_prix,liste_magasin]
exported = zip_longest(*file_list)
with open("C:/Users/Lenovo/Desktop/test/produit_table.csv","w",newline="") as myfile:
    wr = csv.writer(myfile,delimiter=";")
    wr.writerow(['marque',  'libelle',   'grammage',   'prix', 'nomMagasin'])
    wr.writerows(exported)   

#diptox 500ml
result79 = requests.get("https://www.carrefour.tn/default/insecticide-6192000220008.html")
src79= result79.content
soup79= BeautifulSoup(src79,"lxml")

marque = soup79.find_all("a",{"class":"cr-brand-name"})

libelle = soup79.find_all("span",{"class":"base"})

grammage = soup79.find_all("div",{"class":"cr-produt-short-description mb-4"})

prix =soup79.find_all("span",{"class":"price"})
nomMagasin=str('carrefour')
liste_magasin.append(nomMagasin)

for i in range(len(marque)):
    liste_marque.append(marque[i].text)
for i in range(len(libelle)): 
    liste_libelle.append(libelle[i].text)
for i in range(len(grammage)):    
    liste_grammage.append(grammage[i].text.strip())
for i in range(len(prix)):    
    liste_prix.append(prix[i].text.strip())

file_list = [liste_marque,liste_libelle,liste_grammage,liste_prix,liste_magasin]
exported = zip_longest(*file_list)
with open("C:/Users/Lenovo/Desktop/test/produit_table.csv","w",newline="") as myfile:
    wr = csv.writer(myfile,delimiter=";")
    wr.writerow(['marque',  'libelle',   'grammage',   'prix', 'nomMagasin'])
    wr.writerows(exported)   

#lance 300ml
result80 = requests.get("https://www.carrefour.tn/default/insecticide-6192401700871.html")
src80= result80.content
soup80= BeautifulSoup(src80,"lxml")

marque = soup80.find_all("a",{"class":"cr-brand-name"})

libelle = soup80.find_all("span",{"class":"base"})

grammage = soup80.find_all("div",{"class":"cr-produt-short-description mb-4"})

prix =soup80.find_all("span",{"class":"price"})
nomMagasin=str('carrefour')
liste_magasin.append(nomMagasin)

for i in range(len(marque)):
    liste_marque.append(marque[i].text)
for i in range(len(libelle)): 
    liste_libelle.append(libelle[i].text)
for i in range(len(grammage)):    
    liste_grammage.append(grammage[i].text.strip())
for i in range(len(prix)):    
    liste_prix.append(prix[i].text.strip())

file_list = [liste_marque,liste_libelle,liste_grammage,liste_prix,liste_magasin]
exported = zip_longest(*file_list)
with open("C:/Users/Lenovo/Desktop/test/produit_table.csv","w",newline="") as myfile:
    wr = csv.writer(myfile,delimiter=";")
    wr.writerow(['marque',  'libelle',   'grammage',   'prix', 'nomMagasin'])
    wr.writerows(exported)   

#papier 2rol
result81 = requests.get("https://www.carrefour.tn/default/essuie-tout-2-plis-2-rouleaux-5601028002882.html")
src81= result81.content
soup81= BeautifulSoup(src81,"lxml")

marque = soup81.find_all("a",{"class":"cr-brand-name"})

libelle = soup81.find_all("span",{"class":"base"})

grammage = soup81.find_all("div",{"class":"cr-produt-short-description mb-4"})

prix =soup81.find_all("span",{"class":"price"})
nomMagasin=str('carrefour')
liste_magasin.append(nomMagasin)

for i in range(len(marque)):
    liste_marque.append(marque[i].text)
for i in range(len(libelle)): 
    liste_libelle.append(libelle[i].text)
for i in range(len(grammage)):    
    liste_grammage.append(grammage[i].text.strip())
for i in range(len(prix)):    
    liste_prix.append(prix[i].text.strip())

file_list = [liste_marque,liste_libelle,liste_grammage,liste_prix,liste_magasin]
exported = zip_longest(*file_list)
with open("C:/Users/Lenovo/Desktop/test/produit_table.csv","w",newline="") as myfile:
    wr = csv.writer(myfile,delimiter=";")
    wr.writerow(['marque',  'libelle',   'grammage',   'prix' , 'nomMagasin'])
    wr.writerows(exported)

#papier 2rol*
result82= requests.get("https://www.carrefour.tn/default/essuie-tout-citron-jumbo-2-rouleaux-6192011810236.html")
src82= result82.content
soup82= BeautifulSoup(src82,"lxml")

marque = soup82.find_all("a",{"class":"cr-brand-name"})

libelle = soup82.find_all("span",{"class":"base"})

grammage = soup82.find_all("div",{"class":"cr-produt-short-description mb-4"})

prix =soup82.find_all("span",{"class":"price"})
nomMagasin=str('carrefour')
liste_magasin.append(nomMagasin)

for i in range(len(marque)):
    liste_marque.append(marque[i].text)
for i in range(len(libelle)): 
    liste_libelle.append(libelle[i].text)
for i in range(len(grammage)):    
    liste_grammage.append(grammage[i].text.strip())
for i in range(len(prix)):    
    liste_prix.append(prix[i].text.strip())

file_list = [liste_marque,liste_libelle,liste_grammage,liste_prix,liste_magasin]
exported = zip_longest(*file_list)
with open("C:/Users/Lenovo/Desktop/test/produit_table.csv","w",newline="") as myfile:
    wr = csv.writer(myfile,delimiter=";")
    wr.writerow(['marque',  'libelle',   'grammage',   'prix', 'nomMagasin'])
    wr.writerows(exported)


#taref
result83= requests.get("https://www.carrefour.tn/default/serpilliere-egouttoir-moyen-modele-6192404900025.html")
src83= result83.content
soup83= BeautifulSoup(src83,"lxml")

marque = soup83.find_all("a",{"class":"cr-brand-name"})

libelle = soup83.find_all("span",{"class":"base"})

grammage = soup83.find_all("div",{"class":"cr-produt-short-description mb-4"})

prix =soup83.find_all("span",{"class":"price"})
nomMagasin=str('carrefour')
liste_magasin.append(nomMagasin)

for i in range(len(marque)):
    liste_marque.append(marque[i].text)
for i in range(len(libelle)): 
    liste_libelle.append(libelle[i].text)
for i in range(len(grammage)):    
    liste_grammage.append(grammage[i].text.strip())
for i in range(len(prix)):    
    liste_prix.append(prix[i].text.strip())

file_list = [liste_marque,liste_libelle,liste_grammage,liste_prix,liste_magasin]
exported = zip_longest(*file_list)
with open("C:/Users/Lenovo/Desktop/test/produit_table.csv","w",newline="") as myfile:
    wr = csv.writer(myfile,delimiter=";")
    wr.writerow(['marque',  'libelle',   'grammage',   'prix', 'nomMagasin'])
    wr.writerows(exported)

#epange
result84= requests.get("https://www.carrefour.tn/default/tampons-a-recurer-tip-top-6192006600354.html")
src84= result84.content
soup84= BeautifulSoup(src84,"lxml")

marque = soup84.find_all("a",{"class":"cr-brand-name"})

libelle = soup84.find_all("span",{"class":"base"})

grammage = soup84.find_all("div",{"class":"cr-produt-short-description mb-4"})

prix =soup84.find_all("span",{"class":"price"})
nomMagasin=str('carrefour')
liste_magasin.append(nomMagasin)

for i in range(len(marque)):
    liste_marque.append(marque[i].text)
for i in range(len(libelle)): 
    liste_libelle.append(libelle[i].text)
for i in range(len(grammage)):    
    liste_grammage.append(grammage[i].text.strip())
for i in range(len(prix)):    
    liste_prix.append(prix[i].text.strip())

file_list = [liste_marque,liste_libelle,liste_grammage,liste_prix,liste_magasin]
exported = zip_longest(*file_list)
with open("C:/Users/Lenovo/Desktop/test/produit_table.csv","w",newline="") as myfile:
    wr = csv.writer(myfile,delimiter=";")
    wr.writerow(['marque',  'libelle',   'grammage',   'prix', 'nomMagasin'])
    wr.writerows(exported)
#7akika 3adia
result85= requests.get("https://www.carrefour.tn/default/tampons-a-recurer-6192006600125.html")
src85= result85.content
soup85= BeautifulSoup(src85,"lxml")

marque = soup85.find_all("a",{"class":"cr-brand-name"})

libelle = soup85.find_all("span",{"class":"base"})

grammage = soup85.find_all("div",{"class":"cr-produt-short-description mb-4"})

prix =soup85.find_all("span",{"class":"price"})
nomMagasin=str('carrefour')
liste_magasin.append(nomMagasin)

for i in range(len(marque)):
    liste_marque.append(marque[i].text)
for i in range(len(libelle)): 
    liste_libelle.append(libelle[i].text)
for i in range(len(grammage)):    
    liste_grammage.append(grammage[i].text.strip())
for i in range(len(prix)):    
    liste_prix.append(prix[i].text.strip())

file_list = [liste_marque,liste_libelle,liste_grammage,liste_prix,liste_magasin]
exported = zip_longest(*file_list)
with open("C:/Users/Lenovo/Desktop/test/produit_table.csv","w",newline="") as myfile:
    wr = csv.writer(myfile,delimiter=";")
    wr.writerow(['marque',  'libelle',   'grammage',   'prix', 'nomMagasin'])
    wr.writerows(exported)


#sac pobel
result86= requests.get("https://www.carrefour.tn/default/sacs-poubelle-de-51l-10-pieces-6191726705981.html")
src86= result86.content
soup86= BeautifulSoup(src86,"lxml")

marque = soup86.find_all("a",{"class":"cr-brand-name"})

libelle = soup86.find_all("span",{"class":"base"})

grammage = soup86.find_all("div",{"class":"cr-produt-short-description mb-4"})

prix =soup86.find_all("span",{"class":"price"})
nomMagasin=str('carrefour')
liste_magasin.append(nomMagasin)

for i in range(len(marque)):
    liste_marque.append(marque[i].text)
for i in range(len(libelle)): 
    liste_libelle.append(libelle[i].text)
for i in range(len(grammage)):    
    liste_grammage.append(grammage[i].text.strip())
for i in range(len(prix)):    
    liste_prix.append(prix[i].text.strip())

file_list = [liste_marque,liste_libelle,liste_grammage,liste_prix,liste_magasin]
exported = zip_longest(*file_list)
with open("C:/Users/Lenovo/Desktop/test/produit_table.csv","w",newline="") as myfile:
    wr = csv.writer(myfile,delimiter=";")
    wr.writerow(['marque',  'libelle',   'grammage',   'prix', 'nomMagasin'])
    wr.writerows(exported)

#javel 3l
result87= requests.get("https://www.carrefour.tn/default/eau-de-javel-parfumee-fleurs-null-6192002403584.html")
src87= result87.content
soup87= BeautifulSoup(src87,"lxml")

marque = soup87.find_all("a",{"class":"cr-brand-name"})

libelle = soup87.find_all("span",{"class":"base"})

grammage = soup87.find_all("div",{"class":"cr-produt-short-description mb-4"})

prix =soup87.find_all("span",{"class":"price"})
nomMagasin=str('carrefour')
liste_magasin.append(nomMagasin)

for i in range(len(marque)):
    liste_marque.append(marque[i].text)
for i in range(len(libelle)): 
    liste_libelle.append(libelle[i].text)
for i in range(len(grammage)):    
    liste_grammage.append(grammage[i].text.strip())
for i in range(len(prix)):    
    liste_prix.append(prix[i].text.strip())

file_list = [liste_marque,liste_libelle,liste_grammage,liste_prix,liste_magasin]
exported = zip_longest(*file_list)
with open("C:/Users/Lenovo/Desktop/test/produit_table.csv","w",newline="") as myfile:
    wr = csv.writer(myfile,delimiter=";")
    wr.writerow(['marque',  'libelle',   'grammage',   'prix', 'nomMagasin'])
    wr.writerows(exported)

#ajaks 500ml
result88= requests.get("https://www.carrefour.tn/default/null-null-6192002402365.html")
src88= result88.content
soup88= BeautifulSoup(src88,"lxml")

marque = soup88.find_all("a",{"class":"cr-brand-name"})

libelle = soup88.find_all("span",{"class":"base"})

grammage = soup88.find_all("div",{"class":"cr-produt-short-description mb-4"})

prix =soup88.find_all("span",{"class":"price"})
nomMagasin=str('carrefour')
liste_magasin.append(nomMagasin)

for i in range(len(marque)):
    liste_marque.append(marque[i].text)
for i in range(len(libelle)): 
    liste_libelle.append(libelle[i].text)
for i in range(len(grammage)):    
    liste_grammage.append(grammage[i].text.strip())
for i in range(len(prix)):    
    liste_prix.append(prix[i].text.strip())

file_list = [liste_marque,liste_libelle,liste_grammage,liste_prix,liste_magasin]
exported = zip_longest(*file_list)
with open("C:/Users/Lenovo/Desktop/test/produit_table.csv","w",newline="") as myfile:
    wr = csv.writer(myfile,delimiter=";")
    wr.writerow(['marque',  'libelle',   'grammage',   'prix','nomMagasin'])
    wr.writerows(exported)

#choc
result89= requests.get("https://www.carrefour.tn/default/detartrant-peche-6192002402938.html")
src89= result89.content
soup89= BeautifulSoup(src89,"lxml")

marque = soup89.find_all("a",{"class":"cr-brand-name"})

libelle = soup89.find_all("span",{"class":"base"})

grammage = soup89.find_all("div",{"class":"cr-produt-short-description mb-4"})

prix =soup89.find_all("span",{"class":"price"})
nomMagasin=str('carrefour')
liste_magasin.append(nomMagasin)

for i in range(len(marque)):
    liste_marque.append(marque[i].text)
for i in range(len(libelle)): 
    liste_libelle.append(libelle[i].text)
for i in range(len(grammage)):    
    liste_grammage.append(grammage[i].text.strip())
for i in range(len(prix)):    
    liste_prix.append(prix[i].text.strip())

file_list = [liste_marque,liste_libelle,liste_grammage,liste_prix,liste_magasin]
exported = zip_longest(*file_list)
with open("C:/Users/Lenovo/Desktop/test/produit_table.csv","w",newline="") as myfile:
    wr = csv.writer(myfile,delimiter=";")
    wr.writerow(['marque',  'libelle',   'grammage',   'prix', 'nomMagasin'])
    wr.writerows(exported)

#wc
result91= requests.get("https://www.carrefour.tn/default/bloc-wc-ocean-bleu-null-9000101354164.html")
src91= result91.content
soup91= BeautifulSoup(src91,"lxml")

marque = soup91.find_all("a",{"class":"cr-brand-name"})

libelle = soup91.find_all("span",{"class":"base"})

grammage = soup91.find_all("div",{"class":"cr-produt-short-description mb-4"})

prix =soup91.find_all("span",{"class":"price"})
nomMagasin=str('carrefour')
liste_magasin.append(nomMagasin)

for i in range(len(marque)):
    liste_marque.append(marque[i].text)
for i in range(len(libelle)): 
    liste_libelle.append(libelle[i].text)
for i in range(len(grammage)):    
    liste_grammage.append(grammage[i].text.strip())
for i in range(len(prix)):    
    liste_prix.append(prix[i].text.strip())

file_list = [liste_marque,liste_libelle,liste_grammage,liste_prix,liste_magasin]
exported = zip_longest(*file_list)
with open("C:/Users/Lenovo/Desktop/test/produit_table.csv","w",newline="") as myfile:
    wr = csv.writer(myfile,delimiter=";")
    wr.writerow(['marque',  'libelle',   'grammage',   'prix', 'nomMagasin'])
    wr.writerows(exported)
#dinol 1.2l
result90= requests.get("https://www.carrefour.tn/default/nettoyant-sol-et-surface-lavande-null-6192002401948.html")
src90= result90.content
soup90= BeautifulSoup(src90,"lxml")

marque = soup90.find_all("a",{"class":"cr-brand-name"})

libelle = soup90.find_all("span",{"class":"base"})

grammage = soup90.find_all("div",{"class":"cr-produt-short-description mb-4"})

prix =soup90.find_all("span",{"class":"price"})
nomMagasin=str('carrefour')
liste_magasin.append(nomMagasin)

for i in range(len(marque)):
    liste_marque.append(marque[i].text)
for i in range(len(libelle)): 
    liste_libelle.append(libelle[i].text)
for i in range(len(grammage)):    
    liste_grammage.append(grammage[i].text.strip())
for i in range(len(prix)):    
    liste_prix.append(prix[i].text.strip())

file_list = [liste_marque,liste_libelle,liste_grammage,liste_prix,liste_magasin]
exported = zip_longest(*file_list)
with open("C:/Users/Lenovo/Desktop/test/produit_table.csv","w",newline="") as myfile:
    wr = csv.writer(myfile,delimiter=";")
    wr.writerow(['marque',  'libelle',   'grammage',   'prix', 'nomMagasin'])
    wr.writerows(exported)

#dinol 1.5l
result92= requests.get("https://www.carrefour.tn/default/null-null-6192477621308.html")
src92= result92.content
soup92= BeautifulSoup(src92,"lxml")

marque = soup92.find_all("a",{"class":"cr-brand-name"})

libelle = soup92.find_all("span",{"class":"base"})

grammage = soup92.find_all("div",{"class":"cr-produt-short-description mb-4"})

prix =soup92.find_all("span",{"class":"price"})
nomMagasin=str('carrefour')
liste_magasin.append(nomMagasin)

for i in range(len(marque)):
    liste_marque.append(marque[i].text)
for i in range(len(libelle)): 
    liste_libelle.append(libelle[i].text)
for i in range(len(grammage)):    
    liste_grammage.append(grammage[i].text.strip())
for i in range(len(prix)):    
    liste_prix.append(prix[i].text.strip())

file_list = [liste_marque,liste_libelle,liste_grammage,liste_prix,liste_magasin]
exported = zip_longest(*file_list)
with open("C:/Users/Lenovo/Desktop/test/produit_table.csv","w",newline="") as myfile:
    wr = csv.writer(myfile,delimiter=";")
    wr.writerow(['marque',  'libelle',   'grammage',   'prix', 'nomMagasin'])
    wr.writerows(exported)   



#citrol 580ml
result93= requests.get("https://www.carrefour.tn/default/liquide-vaisselle-framboise-6192002401726.html")
src93= result93.content
soup93= BeautifulSoup(src93,"lxml")

marque = soup93.find_all("a",{"class":"cr-brand-name"})

libelle = soup93.find_all("span",{"class":"base"})

grammage = soup93.find_all("div",{"class":"cr-produt-short-description mb-4"})

prix =soup93.find_all("span",{"class":"price"})
nomMagasin=str('carrefour')
liste_magasin.append(nomMagasin)

for i in range(len(marque)):
    liste_marque.append(marque[i].text)
for i in range(len(libelle)): 
    liste_libelle.append(libelle[i].text)
for i in range(len(grammage)):    
    liste_grammage.append(grammage[i].text.strip())
for i in range(len(prix)):    
    liste_prix.append(prix[i].text.strip())

file_list = [liste_marque,liste_libelle,liste_grammage,liste_prix,liste_magasin]
exported = zip_longest(*file_list)
with open("C:/Users/Lenovo/Desktop/test/produit_table.csv","w",newline="") as myfile:
    wr = csv.writer(myfile,delimiter=";")
    wr.writerow(['marque',  'libelle',   'grammage',   'prix', 'nomMagasin'])
    wr.writerows(exported)        

#citrol 960ml
result94= requests.get("https://www.carrefour.tn/default/liquide-vaisselle-citron-5-en-1-null-6192430015557.html")
src94= result94.content
soup94= BeautifulSoup(src94,"lxml")

marque = soup94.find_all("a",{"class":"cr-brand-name"})

libelle = soup94.find_all("span",{"class":"base"})

grammage = soup94.find_all("div",{"class":"cr-produt-short-description mb-4"})

prix =soup94.find_all("span",{"class":"price"})
nomMagasin=str('carrefour')
liste_magasin.append(nomMagasin)

for i in range(len(marque)):
    liste_marque.append(marque[i].text)
for i in range(len(libelle)): 
    liste_libelle.append(libelle[i].text)
for i in range(len(grammage)):    
    liste_grammage.append(grammage[i].text.strip())
for i in range(len(prix)):    
    liste_prix.append(prix[i].text.strip())

file_list = [liste_marque,liste_libelle,liste_grammage,liste_prix,liste_magasin]
exported = zip_longest(*file_list)
with open("C:/Users/Lenovo/Desktop/test/produit_table.csv","w",newline="") as myfile:
    wr = csv.writer(myfile,delimiter=";")
    wr.writerow(['marque',  'libelle',   'grammage',   'prix', 'nomMagasin'])
    wr.writerows(exported)            


#monoprix
################################################################################################
#lessive fino
result95 = requests.get("https://courses.monoprix.tn/bardo/savons-de-m%C3%A9nage-liquides-et-poudres-mains/24832-poudre-mains.html")
src95 = result95.content
soup95 = BeautifulSoup(src95,"lxml")

marque = soup95.find_all("div",{"class":"marque"})

libelle = soup95.find_all("h1",{"class":"productpage_title"})

grammage = soup95.find_all("dd",{"class":"value"},limit=1)

prix =soup95.find_all("span",{"content":"1.85"})
nomMagasin =str('monoprix')
liste_magasin.append(nomMagasin)

for i in range(len(marque)):
    liste_marque.append(marque[i].text)
for i in range(len(libelle)): 
    liste_libelle.append(libelle[i].text)
for i in range(len(grammage)):    
    liste_grammage.append(grammage[i].text.strip())
for i in range(len(prix)):    
    liste_prix.append(prix[i].text.strip())

file_list = [liste_marque,liste_libelle,liste_grammage,liste_prix,liste_magasin]
exported = zip_longest(*file_list)
with open("C:/Users/Lenovo/Desktop/test/produit_table.csv","w",newline="") as myfile:
    wr = csv.writer(myfile,delimiter=";")
    wr.writerow(['marque',  'libelle',   'grammage',   'prix', 'nomMagasin'])
    wr.writerows(exported)

#lessive lilas
result96= requests.get("https://courses.monoprix.tn/bardo/savons-de-m%C3%A9nage-liquides-et-poudres-mains/29221-poudre-mains.html")
src96= result96.content
soup96= BeautifulSoup(src96,"lxml")

marque = soup96.find_all("div",{"class":"marque"})

libelle = soup96.find_all("h1",{"class":"productpage_title"})

grammage = soup96.find_all("dd",{"class":"value"},limit=1)

prix =soup96.find_all("span",{"content":"8.99"})
nomMagasin =str('monoprix')
liste_magasin.append(nomMagasin)

for i in range(len(marque)):
    liste_marque.append(marque[i].text)
for i in range(len(libelle)): 
    liste_libelle.append(libelle[i].text)
for i in range(len(grammage)):    
    liste_grammage.append(grammage[i].text.strip())
for i in range(len(prix)):    
    liste_prix.append(prix[i].text.strip())

file_list = [liste_marque,liste_libelle,liste_grammage,liste_prix,liste_magasin]
exported = zip_longest(*file_list)
with open("C:/Users/Lenovo/Desktop/test/produit_table.csv","w",newline="") as myfile:
    wr = csv.writer(myfile,delimiter=";")
    wr.writerow(['marque',  'libelle',   'grammage',   'prix', 'nomMagasin'])
    wr.writerows(exported)


#savon cartage
result260 = requests.get("https://courses.monoprix.tn/bardo/savons-de-m%C3%A9nage-liquides-et-poudres-mains/22941-savons-de-lavage.html")
src260 = result260.content
soup260 = BeautifulSoup(src260,"lxml")

marque = soup260.find_all("div",{"class":"marque"})

libelle = soup260.find_all("h1",{"class":"productpage_title"})

grammage = soup260.find_all("dd",{"class":"value"},limit=1)

prix =soup260.find_all("span",{"content":"4.99"})
nomMagasin =str('monoprix')
liste_magasin.append(nomMagasin)

for i in range(len(marque)):
    liste_marque.append(marque[i].text)
for i in range(len(libelle)): 
    liste_libelle.append(libelle[i].text)
for i in range(len(grammage)):    
    liste_grammage.append(grammage[i].text.strip())
for i in range(len(prix)):    
    liste_prix.append(prix[i].text.strip())

file_list = [liste_marque,liste_libelle,liste_grammage,liste_prix,liste_magasin]
exported = zip_longest(*file_list)
with open("C:/Users/Lenovo/Desktop/test/produit_table.csv","w",newline="") as myfile:
    wr = csv.writer(myfile,delimiter=";")
    wr.writerow(['marque',  'libelle',   'grammage',   'prix', 'nomMagasin'])
    wr.writerows(exported)    

#assouplissant 3l
result280 = requests.get("https://courses.monoprix.tn/bardo/assouplissants-et-d%C3%A9tachants/18516-assouplissant.html")
src280 = result280.content
soup280 = BeautifulSoup(src280,"lxml")

marque = soup280.find_all("div",{"class":"marque"})

libelle = soup280.find_all("h1",{"class":"productpage_title"})

grammage = soup280.find_all("dd",{"class":"value"},limit=1)

prix =soup280.find_all("span",{"content":"12.19"})
nomMagasin =str('monoprix')
liste_magasin.append(nomMagasin)

for i in range(len(marque)):
    liste_marque.append(marque[i].text)
for i in range(len(libelle)): 
    liste_libelle.append(libelle[i].text)
for i in range(len(grammage)):    
    liste_grammage.append(grammage[i].text.strip())
for i in range(len(prix)):    
    liste_prix.append(prix[i].text.strip())

file_list = [liste_marque,liste_libelle,liste_grammage,liste_prix,liste_magasin]
exported = zip_longest(*file_list)
with open("C:/Users/Lenovo/Desktop/test/produit_table.csv","w",newline="") as myfile:
    wr = csv.writer(myfile,delimiter=";")
    wr.writerow(['marque',  'libelle',   'grammage',   'prix', 'nomMagasin'])
    wr.writerows(exported)        

#dedorant citron
result290 = requests.get("https://courses.monoprix.tn/bardo/desodorisants/17574-d%C3%A9sodorisant-air.html")
src290= result290.content
soup290 = BeautifulSoup(src290,"lxml")

marque = soup290.find_all("div",{"class":"marque"})

libelle = soup290.find_all("h1",{"class":"productpage_title"})

grammage = soup290.find_all("dd",{"class":"value"},limit=1)

prix =soup290.find_all("span",{"content":"4.99"})
nomMagasin =str('monoprix')
liste_magasin.append(nomMagasin)

for i in range(len(marque)):
    liste_marque.append(marque[i].text)
for i in range(len(libelle)): 
    liste_libelle.append(libelle[i].text)
for i in range(len(grammage)):    
    liste_grammage.append(grammage[i].text.strip())
for i in range(len(prix)):    
    liste_prix.append(prix[i].text.strip())

file_list = [liste_marque,liste_libelle,liste_grammage,liste_prix,liste_magasin]
exported = zip_longest(*file_list)
with open("C:/Users/Lenovo/Desktop/test/produit_table.csv","w",newline="") as myfile:
    wr = csv.writer(myfile,delimiter=";")
    wr.writerow(['marque',  'libelle',   'grammage',   'prix', 'nomMagasin'])
    wr.writerows(exported)            

#diptox 500ml
result300 = requests.get("https://courses.monoprix.tn/bardo/insecticides/17566-insecticide.html")
src300 = result300.content
soup300 = BeautifulSoup(src300,"lxml")

marque = soup300.find_all("div",{"class":"marque"})

libelle = soup300.find_all("h1",{"class":"productpage_title"})

grammage = soup300.find_all("dd",{"class":"value"},limit=1)

prix =soup300.find_all("span",{"content":"5.5"})
nomMagasin =str('monoprix')
liste_magasin.append(nomMagasin)
for i in range(len(marque)):
    liste_marque.append(marque[i].text)
for i in range(len(libelle)): 
    liste_libelle.append(libelle[i].text)
for i in range(len(grammage)):    
    liste_grammage.append(grammage[i].text.strip())
for i in range(len(prix)):    
    liste_prix.append(prix[i].text.strip())

file_list = [liste_marque,liste_libelle,liste_grammage,liste_prix,liste_magasin]
exported = zip_longest(*file_list)
with open("C:/Users/Lenovo/Desktop/test/produit_table.csv","w",newline="") as myfile:
    wr = csv.writer(myfile,delimiter=";")
    wr.writerow(['marque',  'libelle',   'grammage',   'prix', 'nomMagasin'])
    wr.writerows(exported)                

#lance 300ml
result310 = requests.get("https://courses.monoprix.tn/bardo/insecticides/29233-insecticide-anti-volant.html")
src310 = result310.content
soup310 = BeautifulSoup(src310,"lxml")

marque = soup310.find_all("div",{"class":"marque"})

libelle = soup310.find_all("h1",{"class":"productpage_title"})

grammage = soup310.find_all("dd",{"class":"value"},limit=1)

prix =soup310.find_all("span",{"content":"4.69"})
nomMagasin =str('monoprix')
liste_magasin.append(nomMagasin)

for i in range(len(marque)):
    liste_marque.append(marque[i].text)
for i in range(len(libelle)): 
    liste_libelle.append(libelle[i].text)
for i in range(len(grammage)):    
    liste_grammage.append(grammage[i].text.strip())
for i in range(len(prix)):    
    liste_prix.append(prix[i].text.strip())

file_list = [liste_marque,liste_libelle,liste_grammage,liste_prix,liste_magasin]
exported = zip_longest(*file_list)
with open("C:/Users/Lenovo/Desktop/test/produit_table.csv","w",newline="") as myfile:
    wr = csv.writer(myfile,delimiter=";")
    wr.writerow(['marque',  'libelle',   'grammage',   'prix', 'nomMagasin'])
    wr.writerows(exported)        

#javel 3l
result320 = requests.get("https://courses.monoprix.tn/bardo/eau-de-javel/17613-eau-de-javel-parfum%C3%A9.html")
src320 = result320.content
soup320 = BeautifulSoup(src320,"lxml")

marque = soup320.find_all("div",{"class":"marque"})

libelle = soup320.find_all("h1",{"class":"productpage_title"})

grammage = soup320.find_all("dd",{"class":"value"},limit=1)

prix =soup320.find_all("span",{"content":"4.92"})
nomMagasin =str('monoprix')
liste_magasin.append(nomMagasin)

for i in range(len(marque)):
    liste_marque.append(marque[i].text)
for i in range(len(libelle)): 
    liste_libelle.append(libelle[i].text)
for i in range(len(grammage)):    
    liste_grammage.append(grammage[i].text.strip())
for i in range(len(prix)):    
    liste_prix.append(prix[i].text.strip())

file_list = [liste_marque,liste_libelle,liste_grammage,liste_prix,liste_magasin]
exported = zip_longest(*file_list)
with open("C:/Users/Lenovo/Desktop/test/produit_table.csv","w",newline="") as myfile:
    wr = csv.writer(myfile,delimiter=";")
    wr.writerow(['marque',  'libelle',   'grammage',   'prix','nomMagasin'])
    wr.writerows(exported)    

#ajax 500ml
result330 = requests.get("https://courses.monoprix.tn/bardo/nettoyants-divers/18561-nettoyant-vitre.html")
src330 = result330.content
soup330 = BeautifulSoup(src330,"lxml")

marque = soup330.find_all("div",{"class":"marque"})

libelle = soup330.find_all("h1",{"class":"productpage_title"})

grammage = soup330.find_all("dd",{"class":"value"},limit=1)

prix =soup330.find_all("span",{"content":"4.95"})
nomMagasin =str('monoprix')
liste_magasin.append(nomMagasin)
for i in range(len(marque)):
    liste_marque.append(marque[i].text)
for i in range(len(libelle)): 
    liste_libelle.append(libelle[i].text)
for i in range(len(grammage)):    
    liste_grammage.append(grammage[i].text.strip())
for i in range(len(prix)):    
    liste_prix.append(prix[i].text.strip())

file_list = [liste_marque,liste_libelle,liste_grammage,liste_prix,liste_magasin]
exported = zip_longest(*file_list)
with open("C:/Users/Lenovo/Desktop/test/produit_table.csv","w",newline="") as myfile:
    wr = csv.writer(myfile,delimiter=";")
    wr.writerow(['marque',  'libelle',   'grammage',   'prix', 'nomMagasin'])
    wr.writerows(exported)  

#choc
result340 = requests.get("https://courses.monoprix.tn/bardo/cuisine-et-salle-de-bain/21421-gel-d%C3%A9tartrant.html")
src340 = result340.content
soup340 = BeautifulSoup(src340,"lxml")

marque = soup340.find_all("div",{"class":"marque"})

libelle = soup340.find_all("h1",{"class":"productpage_title"})

grammage = soup340.find_all("dd",{"class":"value"},limit=1)

prix =soup340.find_all("span",{"content":"5.65"})
nomMagasin =str('monoprix')
liste_magasin.append(nomMagasin)

for i in range(len(marque)):
    liste_marque.append(marque[i].text)
for i in range(len(libelle)): 
    liste_libelle.append(libelle[i].text)
for i in range(len(grammage)):    
    liste_grammage.append(grammage[i].text.strip())
for i in range(len(prix)):    
    liste_prix.append(prix[i].text.strip())

file_list = [liste_marque,liste_libelle,liste_grammage,liste_prix,liste_magasin]
exported = zip_longest(*file_list)
with open("C:/Users/Lenovo/Desktop/test/produit_table.csv","w",newline="") as myfile:
    wr = csv.writer(myfile,delimiter=";")
    wr.writerow(['marque',  'libelle',   'grammage',   'prix', 'nomMagasin'])
    wr.writerows(exported)   

#wc
result350 = requests.get("https://courses.monoprix.tn/bardo/cuisine-et-salle-de-bain/19895-bloc-cuvette-solide.html")
src350 = result350.content
soup350 = BeautifulSoup(src350,"lxml")

marque = soup350.find_all("div",{"class":"marque"})

libelle = soup350.find_all("h1",{"class":"productpage_title"})

grammage = soup350.find_all("dd",{"class":"value"},limit=1)

prix =soup350.find_all("span",{"content":"5.09"})
nomMagasin =str('monoprix')
liste_magasin.append(nomMagasin)

for i in range(len(marque)):
    liste_marque.append(marque[i].text)
for i in range(len(libelle)): 
    liste_libelle.append(libelle[i].text)
for i in range(len(grammage)):    
    liste_grammage.append(grammage[i].text.strip())
for i in range(len(prix)):    
    liste_prix.append(prix[i].text.strip())

file_list = [liste_marque,liste_libelle,liste_grammage,liste_prix,liste_magasin]
exported = zip_longest(*file_list)
with open("C:/Users/Lenovo/Desktop/test/produit_table.csv","w",newline="") as myfile:
    wr = csv.writer(myfile,delimiter=";")
    wr.writerow(['marque',  'libelle',   'grammage',   'prix', 'nomMagasin'])
    wr.writerows(exported)   

#dinol 1.2l
result360 = requests.get("https://courses.monoprix.tn/bardo/sols-et-carrelages/19618-nettoyant-sols-et-surfaces.html")
src360 = result360.content
soup360= BeautifulSoup(src360,"lxml")

marque = soup360.find_all("div",{"class":"marque"})

libelle = soup360.find_all("h1",{"class":"productpage_title"})

grammage = soup360.find_all("dd",{"class":"value"},limit=1)

prix =soup360.find_all("span",{"content":"7.69"})
nomMagasin =str('monoprix')
liste_magasin.append(nomMagasin)

for i in range(len(marque)):
    liste_marque.append(marque[i].text)
for i in range(len(libelle)): 
    liste_libelle.append(libelle[i].text)
for i in range(len(grammage)):    
    liste_grammage.append(grammage[i].text.strip())
for i in range(len(prix)):    
    liste_prix.append(prix[i].text.strip())

file_list = [liste_marque,liste_libelle,liste_grammage,liste_prix,liste_magasin]
exported = zip_longest(*file_list)
with open("C:/Users/Lenovo/Desktop/test/produit_table.csv","w",newline="") as myfile:
    wr = csv.writer(myfile,delimiter=";")
    wr.writerow(['marque',  'libelle',   'grammage',   'prix', 'nomMagasin'])
    wr.writerows(exported)      

#dinol 1.5l
result370 = requests.get("https://courses.monoprix.tn/bardo/sols-et-carrelages/21667-nettoyant-sol-et-surface.html")
src370 = result370.content
soup370 = BeautifulSoup(src370,"lxml")

marque = soup370.find_all("div",{"class":"marque"})

libelle = soup370.find_all("h1",{"class":"productpage_title"})

grammage = soup370.find_all("dd",{"class":"value"},limit=1)

prix =soup370.find_all("span",{"content":"5.99"})
nomMagasin =str('monoprix')
liste_magasin.append(nomMagasin)

for i in range(len(marque)):
    liste_marque.append(marque[i].text)
for i in range(len(libelle)): 
    liste_libelle.append(libelle[i].text)
for i in range(len(grammage)):    
    liste_grammage.append(grammage[i].text.strip())
for i in range(len(prix)):    
    liste_prix.append(prix[i].text.strip())

file_list = [liste_marque,liste_libelle,liste_grammage,liste_prix,liste_magasin]
exported = zip_longest(*file_list)
with open("C:/Users/Lenovo/Desktop/test/produit_table.csv","w",newline="") as myfile:
    wr = csv.writer(myfile,delimiter=";")
    wr.writerow(['marque',  'libelle',   'grammage',   'prix', 'nomMagasin'])
    wr.writerows(exported)     

#citrol 580ml
result380= requests.get("https://courses.monoprix.tn/bardo/pour-vaisselles-mains/24641-liquide-vaisselle-mains.html")
src380 = result380.content
soup380 = BeautifulSoup(src380,"lxml")

marque = soup380.find_all("div",{"class":"marque"})

libelle = soup380.find_all("h1",{"class":"productpage_title"})

grammage = soup380.find_all("dd",{"class":"value"},limit=1)

prix =soup380.find_all("span",{"content":"2.75"})
nomMagasin =str('monoprix')
liste_magasin.append(nomMagasin)

for i in range(len(marque)):
    liste_marque.append(marque[i].text)
for i in range(len(libelle)): 
    liste_libelle.append(libelle[i].text)
for i in range(len(grammage)):    
    liste_grammage.append(grammage[i].text.strip())
for i in range(len(prix)):    
    liste_prix.append(prix[i].text.strip())

file_list = [liste_marque,liste_libelle,liste_grammage,liste_prix,liste_magasin]
exported = zip_longest(*file_list)
with open("C:/Users/Lenovo/Desktop/test/produit_table.csv","w",newline="") as myfile:
    wr = csv.writer(myfile,delimiter=";")
    wr.writerow(['marque',  'libelle',   'grammage',   'prix', 'nomMagasin'])
    wr.writerows(exported) 

#citrol 960ml
result390= requests.get("https://courses.monoprix.tn/bardo/pour-vaisselles-mains/19742-liquide-vaiselle-main-5en1.html")
src390 = result390.content
soup390 = BeautifulSoup(src390,"lxml")

marque = soup390.find_all("div",{"class":"marque"})

libelle = soup390.find_all("h1",{"class":"productpage_title"})

grammage = soup390.find_all("dd",{"class":"value"},limit=1)

prix =soup390.find_all("span",{"content":"7.39"})
nomMagasin =str('monoprix')
liste_magasin.append(nomMagasin)

for i in range(len(marque)):
    liste_marque.append(marque[i].text)
for i in range(len(libelle)): 
    liste_libelle.append(libelle[i].text)
for i in range(len(grammage)):    
    liste_grammage.append(grammage[i].text.strip())
for i in range(len(prix)):    
    liste_prix.append(prix[i].text.strip())

file_list = [liste_marque,liste_libelle,liste_grammage,liste_prix,liste_magasin]
exported = zip_longest(*file_list)
with open("C:/Users/Lenovo/Desktop/test/produit_table.csv","w",newline="") as myfile:
    wr = csv.writer(myfile,delimiter=";")
    wr.writerow(['marque',  'libelle',   'grammage',   'prix','nomMagasin'])
    wr.writerows(exported)      

#msal7a
result400= requests.get("https://courses.monoprix.tn/bardo/absorbant-essuyage-et-brosserie/20537-balai.html")
src400 = result400.content
soup400= BeautifulSoup(src400,"lxml")

marque = soup400.find_all("div",{"class":"marque"})

libelle = soup400.find_all("h1",{"class":"productpage_title"})

grammage = soup400.find_all("dd",{"class":"value"},limit=1)

prix =soup400.find_all("span",{"content":"4.99"})
nomMagasin =str('monoprix')
liste_magasin.append(nomMagasin)

for i in range(len(marque)):
    liste_marque.append(marque[i].text)
for i in range(len(libelle)): 
    liste_libelle.append(libelle[i].text)
for i in range(len(grammage)):    
    liste_grammage.append(grammage[i].text.strip())
for i in range(len(prix)):    
    liste_prix.append(prix[i].text.strip())

file_list = [liste_marque,liste_libelle,liste_grammage,liste_prix,liste_magasin]
exported = zip_longest(*file_list)
with open("C:/Users/Lenovo/Desktop/test/produit_table.csv","w",newline="") as myfile:
    wr = csv.writer(myfile,delimiter=";")
    wr.writerow(['marque',  'libelle',   'grammage',   'prix', 'nomMagasin'])
    wr.writerows(exported)                 

#raclette
result410= requests.get("https://courses.monoprix.tn/bardo/produits-m%C3%A9nagers/17492-raclette.html")
src410 = result410.content
soup410 = BeautifulSoup(src410,"lxml")

marque = soup410.find_all("div",{"class":"marque"})

libelle = soup410.find_all("h1",{"class":"productpage_title"})

grammage = soup410.find_all("dd",{"class":"value"},limit=1)

prix =soup410.find_all("span",{"content":"5.29"})
nomMagasin =str('monoprix')
liste_magasin.append(nomMagasin)

for i in range(len(marque)):
    liste_marque.append(marque[i].text)
for i in range(len(libelle)): 
    liste_libelle.append(libelle[i].text)
for i in range(len(grammage)):    
    liste_grammage.append(grammage[i].text.strip())
for i in range(len(prix)):    
    liste_prix.append(prix[i].text.strip())

file_list = [liste_marque,liste_libelle,liste_grammage,liste_prix,liste_magasin]
exported = zip_longest(*file_list)
with open("C:/Users/Lenovo/Desktop/test/produit_table.csv","w",newline="") as myfile:
    wr = csv.writer(myfile,delimiter=";")
    wr.writerow(['marque',  'libelle',   'grammage',   'prix' ,'nomMagasin'])
    wr.writerows(exported) 

#tarf
result420= requests.get("https://courses.monoprix.tn/bardo/absorbant-essuyage-et-brosserie/20328-serpilli%C3%A8re.html")
src420= result420.content
soup420 = BeautifulSoup(src420,"lxml")

marque = soup420.find_all("div",{"class":"marque"})

libelle = soup420.find_all("h1",{"class":"productpage_title"})

grammage = soup420.find_all("dd",{"class":"value"},limit=1)

prix =soup420.find_all("span",{"content":"2.69"})
nomMagasin =str('monoprix')
liste_magasin.append(nomMagasin)

for i in range(len(marque)):
    liste_marque.append(marque[i].text)
for i in range(len(libelle)): 
    liste_libelle.append(libelle[i].text)
for i in range(len(grammage)):    
    liste_grammage.append(grammage[i].text.strip())
for i in range(len(prix)):    
    liste_prix.append(prix[i].text.strip())

file_list = [liste_marque,liste_libelle,liste_grammage,liste_prix,liste_magasin]
exported = zip_longest(*file_list)
with open("C:/Users/Lenovo/Desktop/test/produit_table.csv","w",newline="") as myfile:
    wr = csv.writer(myfile,delimiter=";")
    wr.writerow(['marque',  'libelle',   'grammage',   'prix', 'nomMagasin'])
    wr.writerows(exported) 

#eponge  
result430= requests.get("https://courses.monoprix.tn/bardo/eponges-et-tampons/17522-tampons-%C3%A9ponge-%C3%A0-r%C3%A9cur.html")
src430 = result430.content
soup430 = BeautifulSoup(src430,"lxml")

marque = soup430.find_all("div",{"class":"marque"})

libelle = soup430.find_all("h1",{"class":"productpage_title"})

grammage = soup430.find_all("dd",{"class":"value"},limit=1)

prix =soup430.find_all("span",{"content":"4.59"})
nomMagasin =str('monoprix')
liste_magasin.append(nomMagasin)

for i in range(len(marque)):
    liste_marque.append(marque[i].text)
for i in range(len(libelle)): 
    liste_libelle.append(libelle[i].text)
for i in range(len(grammage)):    
    liste_grammage.append(grammage[i].text.strip())
for i in range(len(prix)):    
    liste_prix.append(prix[i].text.strip())

file_list = [liste_marque,liste_libelle,liste_grammage,liste_prix,liste_magasin]
exported = zip_longest(*file_list)
with open("C:/Users/Lenovo/Desktop/test/produit_table.csv","w",newline="") as myfile:
    wr = csv.writer(myfile,delimiter=";")
    wr.writerow(['marque',  'libelle',   'grammage',   'prix' ,'nomMagasin'])
    wr.writerows(exported)
#7akika 3adya   
result440= requests.get("https://courses.monoprix.tn/bardo/absorbant-essuyage-et-brosserie/25537-tampon-%C3%A0-r%C3%A9curer.html")
src440= result440.content
soup440= BeautifulSoup(src440,"lxml")

marque = soup440.find_all("div",{"class":"marque"})

libelle = soup440.find_all("h1",{"class":"productpage_title"})

grammage = soup440.find_all("dd",{"class":"value"},limit=1)

prix =soup440.find_all("span",{"content":"3.19"})
nomMagasin =str('monoprix')
liste_magasin.append(nomMagasin)

for i in range(len(marque)):
    liste_marque.append(marque[i].text)
for i in range(len(libelle)): 
    liste_libelle.append(libelle[i].text)
for i in range(len(grammage)):    
    liste_grammage.append(grammage[i].text.strip())
for i in range(len(prix)):    
    liste_prix.append(prix[i].text.strip())

file_list = [liste_marque,liste_libelle,liste_grammage,liste_prix,liste_magasin]
exported = zip_longest(*file_list)
with open("C:/Users/Lenovo/Desktop/test/produit_table.csv","w",newline="") as myfile:
    wr = csv.writer(myfile,delimiter=";")
    wr.writerow(['marque',  'libelle',   'grammage',   'prix', 'nomMagasin'])
    wr.writerows(exported)          

#papier 2rol*
result450= requests.get("https://courses.monoprix.tn/bardo/essuie-tout-et-serviettes-en-papier/18254-essuie-tout.html")
src450 = result450.content
soup450= BeautifulSoup(src450,"lxml")

marque = soup450.find_all("div",{"class":"marque"})

libelle = soup450.find_all("h1",{"class":"productpage_title"})

grammage = soup450.find_all("dd",{"class":"value"},limit=1)

prix =soup450.find_all("span",{"content":"11.39"})
nomMagasin =str('monoprix')
liste_magasin.append(nomMagasin)

for i in range(len(marque)):
    liste_marque.append(marque[i].text)
for i in range(len(libelle)): 
    liste_libelle.append(libelle[i].text)
for i in range(len(grammage)):    
    liste_grammage.append(grammage[i].text.strip())
for i in range(len(prix)):    
    liste_prix.append(prix[i].text.strip())

file_list = [liste_marque,liste_libelle,liste_grammage,liste_prix,liste_magasin]
exported = zip_longest(*file_list)
with open("C:/Users/Lenovo/Desktop/test/produit_table.csv","w",newline="") as myfile:
    wr = csv.writer(myfile,delimiter=";")
    wr.writerow(['marque',  'libelle',   'grammage',   'prix', 'nomMagasin'])
    wr.writerows(exported)    

#papier 2rol
result460= requests.get("https://courses.monoprix.tn/bardo/essuie-tout-et-serviettes-en-papier/25824-essuie-tout.html")
src460 = result460.content
soup460 = BeautifulSoup(src460,"lxml")

marque = soup460.find_all("div",{"class":"marque"})

libelle = soup460.find_all("h1",{"class":"productpage_title"})

grammage = soup460.find_all("dd",{"class":"value"},limit=1)

prix =soup460.find_all("span",{"content":"5.89"})
nomMagasin =str('monoprix')
liste_magasin.append(nomMagasin)

for i in range(len(marque)):
    liste_marque.append(marque[i].text)
for i in range(len(libelle)): 
    liste_libelle.append(libelle[i].text)
for i in range(len(grammage)):    
    liste_grammage.append(grammage[i].text.strip())
for i in range(len(prix)):    
    liste_prix.append(prix[i].text.strip())

file_list = [liste_marque,liste_libelle,liste_grammage,liste_prix],liste_magasin
exported = zip_longest(*file_list)
with open("C:/Users/Lenovo/Desktop/test/produit_table.csv","w",newline="") as myfile:
    wr = csv.writer(myfile,delimiter=";")
    wr.writerow(['marque',  'libelle',   'grammage',   'prix','nomMagasin'])
    wr.writerows(exported)     

#sac poubell
result470= requests.get("https://courses.monoprix.tn/bardo/sacs-poubelles-et-autres-sacs/17528-sacs-poubelle.html")
src470= result470.content
soup470= BeautifulSoup(src470,"lxml")

marque = soup470.find_all("div",{"class":"marque"})

libelle = soup470.find_all("h1",{"class":"productpage_title"})

grammage = soup470.find_all("dd",{"class":"value"},limit=1)

prix =soup470.find_all("span",{"content":"2.99"})
nomMagasin =str('monoprix')
liste_magasin.append(nomMagasin)

for i in range(len(marque)):
    liste_marque.append(marque[i].text)
for i in range(len(libelle)): 
    liste_libelle.append(libelle[i].text)
for i in range(len(grammage)):    
    liste_grammage.append(grammage[i].text.strip())
for i in range(len(prix)):    
    liste_prix.append(prix[i].text.strip())

file_list = [liste_marque,liste_libelle,liste_grammage,liste_prix,liste_magasin]
exported = zip_longest(*file_list)
with open("C:/Users/Lenovo/Desktop/test/produit_table.csv","w",newline="") as myfile:
    wr = csv.writer(myfile,delimiter=";")
    wr.writerow(['marque',  'libelle',   'grammage',   'prix','nomMagasin'])
    wr.writerows(exported)             


#geant
##############################################################################################    
#lessive fino
result480 = requests.get("https://www.geantdrive.tn/azur-city/poudres-mains/37950-poudre-mains.html",verify=False)
src480= result480.content
soup480 = BeautifulSoup(src480,"lxml")

marque = soup480.find_all("p",{"class":"manufacturer_product"},limit=1)

libelle = soup480.find_all("h1",{"class":"h1 product-head1"})

grammage = soup480.find_all("div",{"id":"product-description-short-37950"})

prix =soup480.find_all("span",{"content":"6.2"})
nomMagasin =str('geant')
liste_magasin.append(nomMagasin)

for i in range(len(marque)):
    liste_marque.append(marque[i].text)
for i in range(len(libelle)): 
    liste_libelle.append(libelle[i].text)
for i in range(len(grammage)):    
    liste_grammage.append(grammage[i].text.strip())
for i in range(len(prix)):    
    liste_prix.append(prix[i].text.strip())

file_list = [liste_marque,liste_libelle,liste_grammage,liste_prix,liste_magasin]
exported = zip_longest(*file_list)
with open("C:/Users/Lenovo/Desktop/test/produit_table.csv","w",newline="") as myfile:
    wr = csv.writer(myfile,delimiter=";")
    wr.writerow(['marque',  'libelle',   'grammage',   'prix', 'nomMagasin'])
    wr.writerows(exported)

#lessive lilas
result490 = requests.get("https://www.geantdrive.tn/azur-city/poudres-mains/61971-poudre-mains.html",verify=False)
src490 = result490.content
soup490 = BeautifulSoup(src490,"lxml")

marque = soup490.find_all("p",{"class":"manufacturer_product"},limit=1)

libelle = soup490.find_all("h1",{"class":"h1 product-head1"})

grammage = soup490.find_all("div",{"id":"product-description-short-61971"})

prix =soup490.find_all("span",{"content":"8.99"})
nomMagasin =str('geant')
liste_magasin.append(nomMagasin)

for i in range(len(marque)):
    liste_marque.append(marque[i].text)
for i in range(len(libelle)): 
    liste_libelle.append(libelle[i].text)
for i in range(len(grammage)):    
    liste_grammage.append(grammage[i].text.strip())
for i in range(len(prix)):    
    liste_prix.append(prix[i].text.strip())

file_list = [liste_marque,liste_libelle,liste_grammage,liste_prix,liste_magasin]
exported = zip_longest(*file_list)
with open("C:/Users/Lenovo/Desktop/test/produit_table.csv","w",newline="") as myfile:
    wr = csv.writer(myfile,delimiter=";")
    wr.writerow(['marque',  'libelle',   'grammage',   'prix', 'nomMagasin'])
    wr.writerows(exported)

#savon cartage
result501 = requests.get("https://www.geantdrive.tn/azur-city/savons-de-menage/23324-savons-de-lavage.html",verify=False)
src501 = result501.content
soup501= BeautifulSoup(src501,"lxml")

marque = soup501.find_all("p",{"class":"manufacturer_product"},limit=1)

libelle = soup501.find_all("h1",{"class":"h1 product-head1"})

grammage = soup501.find_all("div",{"id":"product-description-short-23324"})

prix =soup501.find_all("span",{"content":"4.34"})
nomMagasin =str('geant')
liste_magasin.append(nomMagasin)

for i in range(len(marque)):
    liste_marque.append(marque[i].text)
for i in range(len(libelle)): 
    liste_libelle.append(libelle[i].text)
for i in range(len(grammage)):    
    liste_grammage.append(grammage[i].text.strip())
for i in range(len(prix)):    
    liste_prix.append(prix[i].text.strip())

file_list = [liste_marque,liste_libelle,liste_grammage,liste_prix,liste_magasin]
exported = zip_longest(*file_list)
with open("C:/Users/Lenovo/Desktop/test/produit_table.csv","w",newline="") as myfile:
    wr = csv.writer(myfile,delimiter=";")
    wr.writerow(['marque',  'libelle',   'grammage',   'prix', 'nomMagasin'])
    wr.writerows(exported)      

#assouplissant 3l
result510 = requests.get("https://www.geantdrive.tn/azur-city/assouplissants/23263-assouplissant.html",verify=False)
src510 = result510.content
soup510 = BeautifulSoup(src510,"lxml")

marque = soup510.find_all("p",{"class":"manufacturer_product"},limit=1)

libelle = soup510.find_all("h1",{"class":"h1 product-head1"})

grammage = soup510.find_all("div",{"id":"product-description-short-23263"})

prix =soup510.find_all("span",{"content":"12.19"})
nomMagasin =str('geant')
liste_magasin.append(nomMagasin)

for i in range(len(marque)):
    liste_marque.append(marque[i].text)
for i in range(len(libelle)): 
    liste_libelle.append(libelle[i].text)
for i in range(len(grammage)):    
    liste_grammage.append(grammage[i].text.strip())
for i in range(len(prix)):    
    liste_prix.append(prix[i].text.strip())

file_list = [liste_marque,liste_libelle,liste_grammage,liste_prix,liste_magasin]
exported = zip_longest(*file_list)
with open("C:/Users/Lenovo/Desktop/test/produit_table.csv","w",newline="") as myfile:
    wr = csv.writer(myfile,delimiter=";")
    wr.writerow(['marque',  'libelle',   'grammage',   'prix', 'nomMagasin'])
    wr.writerows(exported)

#dedorant citron
result520 = requests.get("https://www.geantdrive.tn/azur-city/desodorisants/24091-desodorisant-air.html",verify=False)
src520 = result520.content
soup520 = BeautifulSoup(src520,"lxml")

marque = soup520.find_all("p",{"class":"manufacturer_product"},limit=1)

libelle = soup520.find_all("h1",{"class":"h1 product-head1"})

grammage = soup520.find_all("div",{"id":"product-description-short-24091"})

prix =soup520.find_all("span",{"content":"4.77"})
nomMagasin =str('geant')
liste_magasin.append(nomMagasin)

for i in range(len(marque)):
    liste_marque.append(marque[i].text)
for i in range(len(libelle)): 
    liste_libelle.append(libelle[i].text)
for i in range(len(grammage)):    
    liste_grammage.append(grammage[i].text.strip())
for i in range(len(prix)):    
    liste_prix.append(prix[i].text.strip())

file_list = [liste_marque,liste_libelle,liste_grammage,liste_prix,liste_magasin]
exported = zip_longest(*file_list)
with open("C:/Users/Lenovo/Desktop/test/produit_table.csv","w",newline="") as myfile:
    wr = csv.writer(myfile,delimiter=";")
    wr.writerow(['marque',  'libelle',   'grammage',   'prix', 'nomMagasin'])
    wr.writerows(exported)                

#diptox 500ml
result530 = requests.get("https://www.geantdrive.tn/azur-city/toutes-insectes/27606-insecticide.html",verify=False)
src530 = result530.content
soup530 = BeautifulSoup(src530,"lxml")

marque = soup530.find_all("p",{"class":"manufacturer_product"},limit=1)

libelle = soup530.find_all("h1",{"class":"h1 product-head1"})

grammage = soup530.find_all("div",{"id":"product-description-short-27606"})

prix =soup530.find_all("span",{"content":"5.39"})
nomMagasin =str('geant')
liste_magasin.append(nomMagasin)

for i in range(len(marque)):
    liste_marque.append(marque[i].text)
for i in range(len(libelle)): 
    liste_libelle.append(libelle[i].text)
for i in range(len(grammage)):    
    liste_grammage.append(grammage[i].text.strip())
for i in range(len(prix)):    
    liste_prix.append(prix[i].text.strip())

file_list = [liste_marque,liste_libelle,liste_grammage,liste_prix,liste_magasin]
exported = zip_longest(*file_list)
with open("C:/Users/Lenovo/Desktop/test/produit_table.csv","w",newline="") as myfile:
    wr = csv.writer(myfile,delimiter=";")
    wr.writerow(['marque',  'libelle',   'grammage',   'prix', 'nomMagasin'])
    wr.writerows(exported) 

#lance 300ml
result540 = requests.get("https://www.geantdrive.tn/azur-city/toutes-insectes/34790-insecticide-anti-volant.html",verify=False)
src540= result540.content
soup540 = BeautifulSoup(src540,"lxml")

marque = soup540.find_all("p",{"class":"manufacturer_product"},limit=1)

libelle = soup540.find_all("h1",{"class":"h1 product-head1"})

grammage = soup540.find_all("div",{"id":"product-description-short-34790"})

prix =soup540.find_all("span",{"content":"3.85"})
nomMagasin =str('geant')
liste_magasin.append(nomMagasin)

for i in range(len(marque)):
    liste_marque.append(marque[i].text)
for i in range(len(libelle)): 
    liste_libelle.append(libelle[i].text)
for i in range(len(grammage)):    
    liste_grammage.append(grammage[i].text.strip())
for i in range(len(prix)):    
    liste_prix.append(prix[i].text.strip())

file_list = [liste_marque,liste_libelle,liste_grammage,liste_prix,liste_magasin]
exported = zip_longest(*file_list)
with open("C:/Users/Lenovo/Desktop/test/produit_table.csv","w",newline="") as myfile:
    wr = csv.writer(myfile,delimiter=";")
    wr.writerow(['marque',  'libelle',   'grammage',   'prix', 'nomMagasin'])
    wr.writerows(exported) 

#javel 3l
result550 = requests.get("https://www.geantdrive.tn/azur-city/javels/23729-eau-de-javel-parfume.html",verify=False)
src550 = result550.content
soup550 = BeautifulSoup(src550,"lxml")

marque = soup550.find_all("p",{"class":"manufacturer_product"},limit=1)

libelle = soup550.find_all("h1",{"class":"h1 product-head1"})

grammage = soup550.find_all("div",{"id":"product-description-short-23729"})

prix =soup550.find_all("span",{"content":"5.59"})
nomMagasin =str('geant')
liste_magasin.append(nomMagasin)

for i in range(len(marque)):
    liste_marque.append(marque[i].text)
for i in range(len(libelle)): 
    liste_libelle.append(libelle[i].text)
for i in range(len(grammage)):    
    liste_grammage.append(grammage[i].text.strip())
for i in range(len(prix)):    
    liste_prix.append(prix[i].text.strip())

file_list = [liste_marque,liste_libelle,liste_grammage,liste_prix,liste_magasin]
exported = zip_longest(*file_list)
with open("C:/Users/Lenovo/Desktop/test/produit_table.csv","w",newline="") as myfile:
    wr = csv.writer(myfile,delimiter=";")
    wr.writerow(['marque',  'libelle',   'grammage',   'prix', 'nomMagasin'])
    wr.writerows(exported) 

#ajax 500ml
result560 = requests.get("https://www.geantdrive.tn/azur-city/vitres-et-glaces/23171-nettoyant-vitre.html",verify=False)
src560 = result560.content
soup560 = BeautifulSoup(src560,"lxml")

marque = soup560.find_all("p",{"class":"manufacturer_product"},limit=1)

libelle = soup560.find_all("h1",{"class":"h1 product-head1"})

grammage = soup560.find_all("div",{"id":"product-description-short-23171"})

prix =soup560.find_all("span",{"content":"4.69"})
nomMagasin =str('geant')
liste_magasin.append(nomMagasin)

for i in range(len(marque)):
    liste_marque.append(marque[i].text)
for i in range(len(libelle)): 
    liste_libelle.append(libelle[i].text)
for i in range(len(grammage)):    
    liste_grammage.append(grammage[i].text.strip())
for i in range(len(prix)):    
    liste_prix.append(prix[i].text.strip())

file_list = [liste_marque,liste_libelle,liste_grammage,liste_prix,liste_magasin]
exported = zip_longest(*file_list)
with open("C:/Users/Lenovo/Desktop/test/produit_table.csv","w",newline="") as myfile:
    wr = csv.writer(myfile,delimiter=";")
    wr.writerow(['marque',  'libelle',   'grammage',   'prix', 'nomMagasin'])
    wr.writerows(exported)    

#choc
result570 = requests.get("https://www.geantdrive.tn/azur-city/cuisines-et-salles-de-bain/24676-gel-detartrant.html",verify=False)
src570 = result570.content
soup570 = BeautifulSoup(src570,"lxml")

marque = soup570.find_all("p",{"class":"manufacturer_product"},limit=1)

libelle = soup570.find_all("h1",{"class":"h1 product-head1"})

grammage = soup570.find_all("div",{"id":"product-description-short-24676"})

prix =soup570.find_all("span",{"content":"5.65"})
nomMagasin =str('geant')
liste_magasin.append(nomMagasin)

for i in range(len(marque)):
    liste_marque.append(marque[i].text)
for i in range(len(libelle)): 
    liste_libelle.append(libelle[i].text)
for i in range(len(grammage)):    
    liste_grammage.append(grammage[i].text.strip())
for i in range(len(prix)):    
    liste_prix.append(prix[i].text.strip())

file_list = [liste_marque,liste_libelle,liste_grammage,liste_prix,liste_magasin]
exported = zip_longest(*file_list)
with open("C:/Users/Lenovo/Desktop/test/produit_table.csv","w",newline="") as myfile:
    wr = csv.writer(myfile,delimiter=";")
    wr.writerow(['marque',  'libelle',   'grammage',   'prix', 'nomMagasin'])
    wr.writerows(exported)            

#wc
result580 = requests.get("https://www.geantdrive.tn/azur-city/cuisines-et-salles-de-bain/23182-bloc-de-cuvette-solide.html",verify=False)
src580 = result580.content
soup580= BeautifulSoup(src580,"lxml")

marque = soup580.find_all("p",{"class":"manufacturer_product"},limit=1)

libelle = soup580.find_all("h1",{"class":"h1 product-head1"})

grammage = soup580.find_all("div",{"id":"product-description-short-23182"})

prix =soup580.find_all("span",{"content":"4.65"})
nomMagasin =str('geant')
liste_magasin.append(nomMagasin)

for i in range(len(marque)):
    liste_marque.append(marque[i].text)
for i in range(len(libelle)): 
    liste_libelle.append(libelle[i].text)
for i in range(len(grammage)):    
    liste_grammage.append(grammage[i].text.strip())
for i in range(len(prix)):    
    liste_prix.append(prix[i].text.strip())

file_list = [liste_marque,liste_libelle,liste_grammage,liste_prix,liste_magasin]
exported = zip_longest(*file_list)
with open("C:/Users/Lenovo/Desktop/test/produit_table.csv","w",newline="") as myfile:
    wr = csv.writer(myfile,delimiter=";")
    wr.writerow(['marque',  'libelle',   'grammage',   'prix', 'nomMagasin'])
    wr.writerows(exported)    

#dinol 1.2l
result590 = requests.get("https://www.geantdrive.tn/azur-city/sols-et-carrelages/23122-nettoyant-sol-et-surface.html",verify=False)
src590 = result590.content
soup590 = BeautifulSoup(src590,"lxml")

marque = soup590.find_all("p",{"class":"manufacturer_product"},limit=1)

libelle = soup590.find_all("h1",{"class":"h1 product-head1"})

grammage = soup590.find_all("div",{"id":"product-description-short-23122"})

prix =soup590.find_all("span",{"content":"7.49"})
nomMagasin =str('geant')
liste_magasin.append(nomMagasin)

for i in range(len(marque)):
    liste_marque.append(marque[i].text)
for i in range(len(libelle)): 
    liste_libelle.append(libelle[i].text)
for i in range(len(grammage)):    
    liste_grammage.append(grammage[i].text.strip())
for i in range(len(prix)):    
    liste_prix.append(prix[i].text.strip())

file_list = [liste_marque,liste_libelle,liste_grammage,liste_prix,liste_magasin]
exported = zip_longest(*file_list)
with open("C:/Users/Lenovo/Desktop/test/produit_table.csv","w",newline="") as myfile:
    wr = csv.writer(myfile,delimiter=";")
    wr.writerow(['marque',  'libelle',   'grammage',   'prix', 'nomMagasin'])
    wr.writerows(exported)    

#dinol 1.5l
result600 = requests.get("https://www.geantdrive.tn/azur-city/sols-et-carrelages/27895-nettoyant-sol-et-surface.html",verify=False)
src600 = result600.content
soup600 = BeautifulSoup(src600,"lxml")

marque = soup600.find_all("p",{"class":"manufacturer_product"},limit=1)

libelle = soup600.find_all("h1",{"class":"h1 product-head1"})

grammage = soup600.find_all("div",{"id":"product-description-short-27895"})

prix =soup600.find_all("span",{"content":"5.99"})
nomMagasin =str('geant')
liste_magasin.append(nomMagasin)

for i in range(len(marque)):
    liste_marque.append(marque[i].text)
for i in range(len(libelle)): 
    liste_libelle.append(libelle[i].text)
for i in range(len(grammage)):    
    liste_grammage.append(grammage[i].text.strip())
for i in range(len(prix)):    
    liste_prix.append(prix[i].text.strip())

file_list = [liste_marque,liste_libelle,liste_grammage,liste_prix,liste_magasin]
exported = zip_longest(*file_list)
with open("C:/Users/Lenovo/Desktop/test/produit_table.csv","w",newline="") as myfile:
    wr = csv.writer(myfile,delimiter=";")
    wr.writerow(['marque',  'libelle',   'grammage',   'prix', 'nomMagasin'])
    wr.writerows(exported)

#citrol 580ml
result610 = requests.get("https://www.geantdrive.tn/azur-city/pour-vaisselles-mains/34090-lave-vaisselle-mains.html",verify=False)
src610 = result610.content
soup610 = BeautifulSoup(src610,"lxml")

marque = soup610.find_all("p",{"class":"manufacturer_product"},limit=1)

libelle = soup610.find_all("h1",{"class":"h1 product-head1"})

grammage = soup610.find_all("div",{"id":"product-description-short-34090"})

prix =soup610.find_all("span",{"content":"2.75"})
nomMagasin =str('geant')
liste_magasin.append(nomMagasin)

for i in range(len(marque)):
    liste_marque.append(marque[i].text)
for i in range(len(libelle)): 
    liste_libelle.append(libelle[i].text)
for i in range(len(grammage)):    
    liste_grammage.append(grammage[i].text.strip())
for i in range(len(prix)):    
    liste_prix.append(prix[i].text.strip())

file_list = [liste_marque,liste_libelle,liste_grammage,liste_prix,liste_magasin]
exported = zip_longest(*file_list)
with open("C:/Users/Lenovo/Desktop/test/produit_table.csv","w",newline="") as myfile:
    wr = csv.writer(myfile,delimiter=";")
    wr.writerow(['marque',  'libelle',   'grammage',   'prix', 'nomMagasin'])
    wr.writerows(exported)

#citrol 960ml
result620 = requests.get("https://www.geantdrive.tn/azur-city/pour-vaisselles-mains/34092-lave-vaisselle-mains.html",verify=False)
src620 = result620.content
soup620 = BeautifulSoup(src620,"lxml")

marque = soup620.find_all("p",{"class":"manufacturer_product"},limit=1)

libelle = soup620.find_all("h1",{"class":"h1 product-head1"})

grammage = soup620.find_all("div",{"id":"product-description-short-34092"})

prix =soup620.find_all("span",{"content":"5.59"})
nomMagasin =str('geant')
liste_magasin.append(nomMagasin)

for i in range(len(marque)):
    liste_marque.append(marque[i].text)
for i in range(len(libelle)): 
    liste_libelle.append(libelle[i].text)
for i in range(len(grammage)):    
    liste_grammage.append(grammage[i].text.strip())
for i in range(len(prix)):    
    liste_prix.append(prix[i].text.strip())

file_list = [liste_marque,liste_libelle,liste_grammage,liste_prix,liste_magasin]
exported = zip_longest(*file_list)
with open("C:/Users/Lenovo/Desktop/test/produit_table.csv","w",newline="") as myfile:
    wr = csv.writer(myfile,delimiter=";")
    wr.writerow(['marque',  'libelle',   'grammage',   'prix', 'nomMagasin'])
    wr.writerows(exported)     

#msal7a
result630 = requests.get("https://www.geantdrive.tn/azur-city/balais/29292-balai-flouka.html",verify=False)
src630 = result630.content
soup630 = BeautifulSoup(src630,"lxml")

marque = soup630.find_all("p",{"class":"manufacturer_product"},limit=1)

libelle = soup630.find_all("h1",{"class":"h1 product-head1"})

grammage = soup630.find_all("div",{"id":"product-description-short-29292"})

prix =soup630.find_all("span",{"content":"4.55"})
nomMagasin =str('geant')
liste_magasin.append(nomMagasin)

for i in range(len(marque)):
    liste_marque.append(marque[i].text)
for i in range(len(libelle)): 
    liste_libelle.append(libelle[i].text)
for i in range(len(grammage)):    
    liste_grammage.append(grammage[i].text.strip())
for i in range(len(prix)):    
    liste_prix.append(prix[i].text.strip())

file_list = [liste_marque,liste_libelle,liste_grammage,liste_prix,liste_magasin]
exported = zip_longest(*file_list)
with open("C:/Users/Lenovo/Desktop/test/produit_table.csv","w",newline="") as myfile:
    wr = csv.writer(myfile,delimiter=";")
    wr.writerow(['marque',  'libelle',   'grammage',   'prix', 'nomMagasin'])
    wr.writerows(exported)

#raclette
result640 = requests.get("https://www.geantdrive.tn/azur-city/balais/26680-raclette.html",verify=False)
src640 = result640.content
soup640 = BeautifulSoup(src640,"lxml")

marque = soup640.find_all("p",{"class":"manufacturer_product"},limit=1)

libelle = soup640.find_all("h1",{"class":"h1 product-head1"})

grammage = soup640.find_all("div",{"id":"product-description-short-26680"})

prix =soup640.find_all("span",{"content":"4.99"})
nomMagasin =str('geant')
liste_magasin.append(nomMagasin)

for i in range(len(marque)):
    liste_marque.append(marque[i].text)
for i in range(len(libelle)): 
    liste_libelle.append(libelle[i].text)
for i in range(len(grammage)):    
    liste_grammage.append(grammage[i].text.strip())
for i in range(len(prix)):    
    liste_prix.append(prix[i].text.strip())

file_list = [liste_marque,liste_libelle,liste_grammage,liste_prix,liste_magasin]
exported = zip_longest(*file_list)
with open("C:/Users/Lenovo/Desktop/test/produit_table.csv","w",newline="") as myfile:
    wr = csv.writer(myfile,delimiter=";")
    wr.writerow(['marque',  'libelle',   'grammage',   'prix', 'nomMagasin'])
    wr.writerows(exported)

#tarf
result650 = requests.get("https://www.geantdrive.tn/azur-city/serpilleres/23996-serpillere.html",verify=False)
src650 = result650.content
soup650 = BeautifulSoup(src650,"lxml")

marque = soup650.find_all("p",{"class":"manufacturer_product"},limit=1)

libelle = soup650.find_all("h1",{"class":"h1 product-head1"})

grammage = soup650.find_all("div",{"id":"product-description-short-23996"})

prix =soup650.find_all("span",{"content":"2.5"})
nomMagasin =str('geant')
liste_magasin.append(nomMagasin)

for i in range(len(marque)):
    liste_marque.append(marque[i].text)
for i in range(len(libelle)): 
    liste_libelle.append(libelle[i].text)
for i in range(len(grammage)):    
    liste_grammage.append(grammage[i].text.strip())
for i in range(len(prix)):    
    liste_prix.append(prix[i].text.strip())

file_list = [liste_marque,liste_libelle,liste_grammage,liste_prix,liste_magasin]
exported = zip_longest(*file_list)
with open("C:/Users/Lenovo/Desktop/test/produit_table.csv","w",newline="") as myfile:
    wr = csv.writer(myfile,delimiter=";")
    wr.writerow(['marque',  'libelle',   'grammage',   'prix', 'nomMagasin'])
    wr.writerows(exported) 

#eponge
result660 = requests.get("https://www.geantdrive.tn/azur-city/eponges-et-tampons/24040-tampons-eponge-a-recurer.html",verify=False)
src660 = result660.content
soup660 = BeautifulSoup(src660,"lxml")

marque = soup660.find_all("p",{"class":"manufacturer_product"},limit=1)

libelle = soup660.find_all("h1",{"class":"h1 product-head1"})

grammage = soup660.find_all("div",{"id":"product-description-short-24040"})

prix =soup660.find_all("span",{"content":"3.89"})
nomMagasin =str('geant')
liste_magasin.append(nomMagasin)

for i in range(len(marque)):
    liste_marque.append(marque[i].text)
for i in range(len(libelle)): 
    liste_libelle.append(libelle[i].text)
for i in range(len(grammage)):    
    liste_grammage.append(grammage[i].text.strip())
for i in range(len(prix)):    
    liste_prix.append(prix[i].text.strip())

file_list = [liste_marque,liste_libelle,liste_grammage,liste_prix,liste_magasin]
exported = zip_longest(*file_list)
with open("C:/Users/Lenovo/Desktop/test/produit_table.csv","w",newline="") as myfile:
    wr = csv.writer(myfile,delimiter=";")
    wr.writerow(['marque',  'libelle',   'grammage',   'prix', 'nomMagasin'])
    wr.writerows(exported)

#7akika 3adya
result670 = requests.get("https://www.geantdrive.tn/azur-city/eponges-et-tampons/30192-tampon-a-recurer.html",verify=False)
src670 = result670.content
soup670 = BeautifulSoup(src670,"lxml")

marque = soup670.find_all("p",{"class":"manufacturer_product"},limit=1)

libelle = soup670.find_all("h1",{"class":"h1 product-head1"})

grammage = soup670.find_all("div",{"id":"product-description-short-30192"})

prix =soup670.find_all("span",{"content":"3.2"})
nomMagasin =str('geant')
liste_magasin.append(nomMagasin)

for i in range(len(marque)):
    liste_marque.append(marque[i].text)
for i in range(len(libelle)): 
    liste_libelle.append(libelle[i].text)
for i in range(len(grammage)):    
    liste_grammage.append(grammage[i].text.strip())
for i in range(len(prix)):    
    liste_prix.append(prix[i].text.strip())

file_list = [liste_marque,liste_libelle,liste_grammage,liste_prix,liste_magasin]
exported = zip_longest(*file_list)
with open("C:/Users/Lenovo/Desktop/test/produit_table.csv","w",newline="") as myfile:
    wr = csv.writer(myfile,delimiter=";")
    wr.writerow(['marque',  'libelle',   'grammage',   'prix', 'nomMagasin'])
    wr.writerows(exported)    

#papier 2rol*
result680 = requests.get("https://www.geantdrive.tn/azur-city/essuies-tout-et-serviettes-en-papier/27650-essuie-tout.html",verify=False)
src680 = result680.content
soup680 = BeautifulSoup(src680,"lxml")

marque = soup680.find_all("p",{"class":"manufacturer_product"},limit=1)

libelle = soup680.find_all("h1",{"class":"h1 product-head1"})

grammage = soup680.find_all("div",{"id":"product-description-short-27650"})

prix =soup680.find_all("span",{"content":"10.99"})
nomMagasin =str('geant')
liste_magasin.append(nomMagasin)

for i in range(len(marque)):
    liste_marque.append(marque[i].text)
for i in range(len(libelle)): 
    liste_libelle.append(libelle[i].text)
for i in range(len(grammage)):    
    liste_grammage.append(grammage[i].text.strip())
for i in range(len(prix)):    
    liste_prix.append(prix[i].text.strip())

file_list = [liste_marque,liste_libelle,liste_grammage,liste_prix,liste_magasin]
exported = zip_longest(*file_list)
with open("C:/Users/Lenovo/Desktop/test/produit_table.csv","w",newline="") as myfile:
    wr = csv.writer(myfile,delimiter=";")
    wr.writerow(['marque',  'libelle',   'grammage',   'prix', 'nomMagasin'])
    wr.writerows(exported)

#papier 2rol
result690 = requests.get("https://www.geantdrive.tn/azur-city/essuies-tout-et-serviettes-en-papier/33988-essuie-tout.html",verify=False)
src690 = result690.content
soup690 = BeautifulSoup(src690,"lxml")

marque = soup690.find_all("p",{"class":"manufacturer_product"},limit=1)

libelle = soup690.find_all("h1",{"class":"h1 product-head1"})

grammage = soup690.find_all("div",{"id":"product-description-short-33988"})

prix =soup690.find_all("span",{"content":"5.09"})
nomMagasin =str('geant')
liste_magasin.append(nomMagasin)

for i in range(len(marque)):
    liste_marque.append(marque[i].text)
for i in range(len(libelle)): 
    liste_libelle.append(libelle[i].text)
for i in range(len(grammage)):    
    liste_grammage.append(grammage[i].text.strip())
for i in range(len(prix)):    
    liste_prix.append(prix[i].text.strip())

file_list = [liste_marque,liste_libelle,liste_grammage,liste_prix,liste_magasin]
exported = zip_longest(*file_list)
with open("C:/Users/Lenovo/Desktop/test/produit_table.csv","w",newline="") as myfile:
    wr = csv.writer(myfile,delimiter=";")
    wr.writerow(['marque',  'libelle',   'grammage',   'prix', 'nomMagasin'])
    wr.writerows(exported)

#sac poubelle
result700 = requests.get("https://www.geantdrive.tn/azur-city/sacs-poubelles/26805-sacs-poubelle.html",verify=False)
src700 = result700.content
soup700= BeautifulSoup(src700,"lxml")

marque = soup700.find_all("p",{"class":"manufacturer_product"},limit=1)

libelle = soup700.find_all("h1",{"class":"h1 product-head1"})

grammage = soup700.find_all("div",{"id":"product-description-short-26805"})

prix =soup700.find_all("span",{"content":"2.9"})
nomMagasin =str('geant')
liste_magasin.append(nomMagasin)

for i in range(len(marque)):
    liste_marque.append(marque[i].text)
for i in range(len(libelle)): 
    liste_libelle.append(libelle[i].text)
for i in range(len(grammage)):    
    liste_grammage.append(grammage[i].text.strip())
for i in range(len(prix)):    
    liste_prix.append(prix[i].text.strip())

file_list = [liste_marque,liste_libelle,liste_grammage,liste_prix,liste_magasin]
exported = zip_longest(*file_list)
with open("C:/Users/Lenovo/Desktop/test/produit_table.csv","w",newline="") as myfile:
    wr = csv.writer(myfile,delimiter=";")
    wr.writerow(['marque',  'libelle',   'grammage',   'prix', 'nomMagasin'])
    wr.writerows(exported) 











    


    




    
