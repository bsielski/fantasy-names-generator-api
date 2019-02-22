module IndianFemale

  NAMES = [
    "Aanchal","Aarthika","Aarti","Abburi","Abha","Abhati","Abheri","Abhibha","Abhidhya",
    "Abhidya","Abhigurti","Abhijiti","Abhijna","Abhikya","Abhilasa","Abhilasin","Abhiniti",
    "Abhipri","Abhipriti","Abhipuspam","Abhiraksa","Abhirati","Abhirka","Abhiruci","Abhisri","Abhisvara",
    "Abhiti","Abhivadaka","Abhivibha","Abhraganga","Abhramu","Abhranti","Abhrayanti","Abhumukhi","Abja",
    "Abjini","Aboli","Acala","Acaryanandana","Acaryaputra","Acaryatanaya","Acchoda","Achit",
    "Acira","Adapa","Adarna","Adevi",
    "Adhimuhya","Adhrsya","Adibuddha","Adilakshmi","Adita","Aditya","Adityabandhu","Adlakha","Adrika",
    "Adrsyanti","Adusumilli","Advaitavadini","Agnajita","Agnayi","Agneyi","Agnimukhi","Agnivardini",
    "Agraja","Agrayi","Ahalya","Ahana","Ahanti","Ahdita","Ahi","Ahilya","Ahimsa",
    "Ahladita","Ahu","Ahuti","Aiksvaki","Aisvarya","Aiyah","Aja","Ajai","Ajamukhhi",
    "Ajani","Ajanta","Ajara","Ajatashatru","Ajathya","Ajaya","Aji","Ajinder",
    "Ajitha","Ajmani","Ajoy","Ajwani","Akaash","Akaliki","Akalka","Akanksa",
    "Akasadipa","Akasaganga","Akasi","Akella","Akkina","Akkiraju","Akolekar","Akranti","Akriti",
    "Akrti","Aksasutra","Aksi","Aksiti","Akupara","Akuti","Alagar","Alaka",
    "Alakaravati","Alambusa","Alamelu","Alapini","Alisa","Alishah","Alka","Alkesh","Alla",
    "Alpa","Alpana","Alwar","Amal","Amala","Amani","Amaraja","Amaranagana","Amaratatini",
    "Amaravati","Amardeep","Amari","Amarta","Amati","Amavasya","Amba","Ambady",
    "Ambala","Ambali","Ambalika","Ambaraprabha","Ambatipudi","Ambaya","Ambhoji",
    "Ambhojini","Ambi","Ambika","Ambrish","Ambuj","Ambujakshi","Ambujanana","Ambumati","Ambupadma",
    "Ambuvahini","Ameena","Ameet","Ami","Amiksh","Amina","Amisa","Amita",
    "Amitesvari","Amiti","Amiya","Ammu","Amodini","Amoghaksi","Amohanika","Amramanjari","Amrit",
    "Amrita","Amritama","Amritansh","Amritendu","Amruth","Amsel","Amutha","Anabhra","Anadya",
    "Anaga","Anamika","Anamra","Ananda","Anandadevi","Anandalakshmi","Anandamayi","Anandaparna",
    "Anandaprabha","Anantalakshmi","Ananya","Anati",
    "Anavadya","Anavi","Anay","Andala","Andika","Aneesh","Angad","Angada","Angaja",
    "Angana","Angaravati","Angarita","Anguri","Anhati","Anhiti","Anil","Anila",
    "Anima","Aninda","Anindini","Anindita","Anindya","Anisa","Anita","Anjalika","Anjanam",
    "Anjasi","Anji","Anjini","Anjna","Anju","Anjum","Anjuman","Ankan","Ankita",
    "Ankitha","Ankolika","Annamalai","Annanya","Anni","Anokhi","Anoma","Anritam",
    "Ansuiya","Ansumala","Ansumati","Antika","Antini","Antur","Anu","Anubha","Anugita","Anuka","Anukanksa",
    "Anula","Anulekha","Anuli","Anumodita","Anunayika","Anunita","Anuniti","Anupallavi","Anuprahba",
    "Anupriya","Anuradha","Anurakti","Anurati","Anurima","Anusara","Anushree","Anusna",
    "Anusobhini","Anusri","Anutapta","Anvakriti","Anvita","Anviti","Anya","Apaciti","Apaga",
    "Apala","Aparajita","Aparananda","Aparna","Apaya","Apeksita","Apti","Apurani","Apurva",
    "Aqsa","Ara","Aradhana","Aradhita","Araja","Arani","Arasu","Arati",
    "Aravamudan","Aravas","Aravindini","Arcana","Archana","Archna",
    "Arcismati","Ardhaganga","Arhana","Arhantika","Arihan","Arikta","Arindam","Aripra","Arja",
    "Arkasuta","Arnab","Aroga","Arohi","Arpana","Arpita","Arthana","Artika",
    "Aruja","Aruksita","Aruna","Arunabha","Aruni","Arunika","Arunima","Arupa","Arusi",
    "Arvanti","Arya","Aryamani","Asa","Asadhika","Asali","Asanjini","Asanni","Asija",
    "Asika","Asikni","Asira","Asirvatham","Asisa","Askini","Asmaki","Asmati",
    "Asmi","Asna","Asokari","Asta","Astha","Asthula","Asti","Astriti","Asura","Asutosh","Asvattha",
    "Asvika","Atchut","Atchuta","Atharvan","Athavale","Athawale","Athreya","Atibala","Atimoda",
    "Atiriya","Atmadhika","Atmajyoti","Atmodbhava","Atyuha","Aurjitya","Ausinari","Auvvayar",
    "Avabha","Avachat","Avadhanam","Avajiti","Avalur","Avanati","Avani","Avanthika","Avanti",
    "Avantika","Avantivati","Avaraja","Avasarala","Avatansa","Avatika","Aviral","Avisi","Avisya",
    "Ayati","Ayodhika","Ayugu","Babhru","Babita","Bachendri","Badani","Badarayani",
    "Badari","Badithe","Badsah","Bagade","Bagesri",
    "Bagga","Bahughanda","Bahuli","Bahulika","Bahumati","Bahuratna","Bahvisvara","Baiju","Baindur",
    "Bakavati","Bakula","Bakulamala","Bakulika","Bala","Balada","Balaja","Balaji",
    "Balakunda","Balandhara","Balapuspika","Balasandhya","Balavati","Balki","Banaganga","Banasri","Banasuta",
    "Bandaru","Bandhini","Bandhumati","Bandhupriya","Bandhura","Bandlish","Bano","Bansuri","Baratam",
    "Barhayita","Barhina","Barhisa","Basanti","Basha","Baskaran","Basude","Basvangoud",
    "Batakrishna","Bawa","Bawara","Baxi",
    "Bayya","Bbusoowy","Beddhu","Beena","Beerud","Behari","Bekkem","Bela","Beli",
    "Bellamkonda","Bellare","Belur","Bemra","Betanabhatla","Bettadapura","Bettadpur","Bhabani",
    "Bhabra","Bhadrabhusana","Bhadramukhi","Bhadrarupa","Bhadrasvapna","Bhadravalli","Bhadrika","Bhagavanti","Bhagavatula",
    "Bhagra","Bhagya","Bhaina","Bhalli","Bhamidipati","Bhamini","Bhanap","Bhanavi","Bhandana",
    "Bhanot","Bhanuja","Bhanumati","Bhanupriya","Bhanusri","Bharadvaji","Bharadwaj","Bharani",
    "Bharati","Bharava",
    "Bhardwaj","Bhargavi","Bharti","Bharu","Bhasi","Bhati","Bhattini","Bhauma","Bhavaja",
    "Bhavana","Bhavangama","Bhavanika","Bhavanti","Bhavapuspa","Bhaviki","Bhavitra","Bhimavarapu",
    "Bhishma","Bhogya","Bhomira","Bhoopathi","Bhraji","Bhramambika","Bhramarika","Bhrami","Bhrigu",
    "Bhrngari","Bhubaneswar","Bhumralkar","Bhurji","Bhusa","Bhuva","Bhuvanagiri","Bhuvanamati","Bhuvanesani",
    "Bhuvani","Bhuvis","Bidalika","Bijaharini","Bijaksara","Bijal","Bijli","Bijoy",
    "Biju","Bikramjit","Billoo","Bimbi",
    "Bimbini","Bina","Bindiya","Bindu","Bindumati","Bindurekha","Binita","Birewar","Bisala",
    "Bisaria","Bishnu","Bishu","Bisini","Biswanath","Bodhini","Boppana","Boreda",
    "Brahmanjali","Brhadyuti","Brhanmati","Bridgnandan","Brij","Brijesh","Brinda","Buddhidevi","Buddhimatika",
    "Bula","Bulusu","Burjiz","Cahana","Caitali","Caitri","Cakramardika","Caksani","Caksusi",
    "Canaya","Candakirana","Candani","Candrabala","Candragauri","Candragolika","Candrakali","Candramati",
    "Candramukha","Candramukhi",
    "Candrasila","Candrasri","Candrasubha","Candravadana","Candravasa","Candri","Candrima","Candrupa","Carani",
    "Carnapurna","Carubala","Carucitra","Carudarsana","Carulata","Carulocana","Carusila","Carutama",
    "Casukhela","Casula","Caturika","Cauvery","Cchandra","Celana","Cesta","Cetana","Chadaga",
    "Chaitanya","Chaitra","Chakradhar","Chakrapani","Chalamala","Chalana","Chalasani","Challa","Chand",
    "Chanda","Chandra","Chandrakanta","Chandralekha","Chaund","Chava","Chavi","Chhaya",
    "Chinna","Chinta",
    "Chintala","Chintam","Chinya","Chitra","Chitta","Chundra","Cinta","Citrai","Citrajyoti",
    "Citrali","Citramaya","Citramayi","Citrarati","Citrini","Citrita","Citta","Cittii",
    "Cudala","Cumba","Cumban","Cunni","Daga","Dahanolka","Daksayaninya","Dalaja","Damodari",
    "Dandapani","Danti","Darpanika","Darsatasri","Dasamalika","Dattadevi","Datti","Dayadi","Dayanvita",
    "Dayavati","Dayita","Dayumnahuti","Deena","Deepali","Deepika","Desna","Devaki",
    "Devamani","Devamati","Devamayi","Devanganga",
    "Devapratima","Devaradhana","Devarapalli","Devasmita","Devavani","Devavati","Devaviti","Devayosa","Devi",
    "Devika","Deviki","Devina","Dhamani","Dhanavati","Dhanistha","Dhanvanya","Dhanyamala",
    "Dharmini","Dhilati","Dhita","Dhiti","Dhrtavati","Dhulika","Dhulipala","Dhulipalla","Didhi",
    "Dinaprabha","Dipa","Dipakalika","Dipaksi","Dipali","Dipamala","Dipanjali","Dipanwita","Dipavali",
    "Dipmani","Dipra","Dipsikha","Disti","Divija","Divolka","Divyadevi","Divyajyoti",
    "Divyakriti","Drdhamati",
    "Drgbhu","Drsika","Druhi","Druti","Dulari","Durgila","Duvasvati","Dyotana","Dyuksa",
    "Edha","Ekabhakti","Ekacarini","Ekadasi","Ekadhana","Ekaja","Ekakini","Ekamati",
    "Ekangika","Ekanta","Ekisa","Eloksi","Enaksi","Eneela","Eni","Enipada","Esa",
    "Esanika","Eta","Etaha","Eti","Gaganecara","Gajagamani","Gajagati","Gajalakshmi","Gajamukta",
    "Gajapathi","Gajaweera","Gajra","Gamati","Gamin","Ganda","Gandhaja","Gangangini",
    "Ganjan","Ganmanya","Garbhagrha","Gargi","Gathika","Gaurang","Gavah","Gayanti",
    "Gayathri","Gayatri","Gayatrini","Geeta","Geetha","Geethanjali","Gera","Gesna","Ghanivalli",
    "Ghanivallika","Ghosavati","Ghugari","Girisma","Girni","Gita","Gitali","Gitanjali",
    "Giti","Gitika","Gopa","Gopabala","Gopaja","Goparasa","Gorocana","Gouri","Gowri",
    "Gulal","Gulika","Gulmini","Gunamaya","Gunavini","Gunca","Guncaka","Gundu","Guneeta",
    "Gunita","Gunjan","Gunnika","Gunti","Gunvati","Gupti","Gurdiya","Gurnika",
    "Gurti","Gurucarana","Guruda","Gurudeva","Gurudipa","Gurumita","Gurumukha",
    "Gurunama","Guruprasada","Gurusarana","Guruvacana","Guruvira","Gutika","Hala","Halima","Haliman",
    "Hansanadini","Hansanandini","Hararvarupa","Haravali","Haribhadra","Harinaksi","Hariprita","Harisri",
    "Harmya","Harsala","Harsavina","Harsi","Harsita","Harsumati","Hasika","Hasumati","Heena",
    "Hela","Hemaksi","Hemamalini","Hemangini","Hemanti","Hemaprabha","Hemavarna","Himasveta","Hiya",
    "Hrada","Ibha","Ibhi","Iccha","Icchavati","Iditri","Iha","Ihita",
    "Ijya","Iksa","Iksenya","Iksulata","Ilaksi",
    "Ilesa","Ilika","Ilisa","Inaksi","Indali","Inderjit","Indira","Indrabala","Indrabha",
    "Indrabhattarika","Indrahuti","Indranilika","Indu","Induvadana","Inika","Ipsa","Ipsita",
    "Iraja","Iravati","Irijaya","Irika","Isa","Isanika","Isika","Istara","Itkila",
    "Iya","Jabala","Jagatna","Jagavi","Jagrati","Jagrti","Jagruti","Jailekha","Jaimala",
    "Jaiman","Jaiprbha","Jaishree","Jaisila","Jaisudha","Jaivanti","Jaivati","Jalabalika",
    "Jalajaksi","Jalajini","Jalalata","Jalambika","Jalanili","Jalarnava",
    "Jalavalika","Jallata","Jama","Jambhalika","Janabalika","Janaki","Janamohini","Janasruti","Janhita",
    "Janki","Januja","Jasalina","Jasarani","Jaswinder","Jatarupa","Jatila","Jatukarna",
    "Jaya","Jayalaksmi","Jayanti","Jayashree","Jayita","Jayitri","Jeendan","Jhala","Jharna",
    "Jhatalika","Jhillika","Jhilmil","Jigisa","Jindan","Jitya","Jivapuspa","Jivika","Jogu",
    "Josa","Josya","Jurni","Justi","Jutika","Jvalita","Jvalitri","Jyota",
    "Jyoti","Jyotiranika","Jyotsna","Jyotsni","Kadhapriya","Kahini",
    "Kailash","Kajal","Kajri","Kakali","Kaksi","Kalahapriya","Kalakanya","Kalamali","Kalandika",
    "Kalapini","Kale","Kalia","Kaliappa","Kalidindi","Kalipi","Kalli","Kalmesika",
    "Kalpana","Kalpavati","Kalyani","Kama","Kamadyu","Kamala","Kamalah","Kamalalocana","Kamalanayani",
    "Kamalata","Kamaleksana","Kamalika","Kamana","Kamandaki","Kamarekha","Kamayani","Kamini","Kamita",
    "Kamlesh","Kamma","Kamna","Kamni","Kamra","Kamya","Kana","Kanakalata",
    "Kanakamanjari","Kanakamudra","Kanakasundari",
    "Kanakavali","Kanakavalli","Kanakvi","Kanam","Kananabala","Kancanabha","Kanchana","Kandarpabala","Kandhara",
    "Kangana","Kani","Kania","Kanici","Kanika","Kanin","Kanistha","Kanita",
    "Kanjari","Kanjira","Kankan","Kankanika","Kanksa","Kanksini","Kannika","Kanta","Kanti",
    "Kanya","Kanyala","Kanyana","Kanyaratna","Kapadia","Kapardika","Karabhoru","Karia","Karika",
    "Karisma","Karisni","Karkari","Karmistha","Karpani","Karpuri","Karsna","Karttiki",
    "Karuna","Karunya","Kasturba","Kasturi","Kasturika",
    "Kasu","Kausalika","Kausalya","Kavika","Kavita","Keyurin","Khatu","Kheli","Kilasla",
    "Kinjala","Kiranamayi","Kirmi","Kishori","Kisori","Kiya","Kour","Kranti",
    "Krpa","Krsana","Krsi","Krsnan","Krsni","Ksa","Ksamamati","Ksamya","Ksanada",
    "Ksatriyani","Ksirasagara","Ksunu","Kuladevi","Kulanari","Kulangana","Kumari","Kumaria","Kumud",
    "Kumudika","Kumudini","Kundamala","Kundini","Kunja","Kunjalata","Kunsi","Kurangaksi",
    "Kurira","Kusumanjali","Kusumavati","Kusumaya","Kusumita","Kuthodari",
    "Kuvalayadhrs","Kuvalayini","Kuvalayita","Kuvarini","Laboni","Laduri","Lakshmi","Lakshmikantan","Lakshminarashimhan",
    "Lakshminaraya","Lakshminarayanan","Laxmi","Laxmikant","Laxminarasimha","Leela","Leena","Lela",
    "Madhavi","Madhu","Madhucchandra","Madhukar","Madhulika","Madhumati","Madhumita","Madhumitra","Madhur",
    "Madhuri","Madhusree","Madhusudhan","Madhusudhana","Madhusudhanan","Makara","Mala","Malar","Malathi",
    "Malati","Malini","Mandara","Mangla","Manglani","Mani","Manika","Manish",
    "Manisha","Meena","Meera","Mehadi","Mena","Menaka","Mesha","Meshal","Minda",
    "Mira","Mita","Mohana","Mohani","Mohini","Mohit","Munakshi","Mungela",
    "Natesa","Natisa","Nayantara","Nimai","Nimi","Nimmi","Ninderjit","Nisha","Nishchint",
    "Padma","Padmaja","Padmavati","Padmini","Pandita","Pari","Parimal","Parimala","Parmeshwarii",
    "Parminder","Paro","Pinga","Pollyam","Pom","Poonam","Poornima","Pratibha",
    "Preia","Prema","Premila","Premlata","Priya","Promila","Pupul","Purna","Purnima","Pushpa",
    "Puspa","Radhe","Radhika","Rajalakshmi","Raje","Raji","Rajni","Rakesh","Rani",
    "Rati","Reena","Renu","Rita","Ritu","Rochana","Rohana","Rohena",
    "Rupinder","Sahana","Sahera","Sakara","Sakari","Sakyamuni","Sala","Sandhya","Santosh",
    "Sarala","Saroj","Saroja","Sarojini","Sateesh","Satheesh","Sathya","Satish","Satya",
    "Satyam","Saura","Savita","Savitha","Savitri","Seema","Seeta","Seetha",
    "Sepatha","Shabana","Shaila","Shakti","Shakuntala","Shalini","Shanta","Shantanu","Shanthi","Shanti","Sharad",
    "Sharada","Sharath","Sharmila","Shashi","Sheela","Sheila","Shoba","Shobha","Shobhana",
    "Shobhna","Shobu","Shreya","Shri","Shyama","Shyamala","Shyamani","Siddartha",
    "Sidharth","Smriti","Sneh","Soochet","Sri","Suja","Sujata","Sujatha","Sumant",
    "Sumanth","Sumantra","Sumantu","Sumathi","Sumati","Sumit","Sumita","Sumitra","Sumitro",
    "Suneet","Suneetha","Sunit","Sunita","Sunitha","Suniti","Surajit","Sureshta",
    "Surjit","Sushila","Sushma","Swaran","Tara","Uma","Umi","Urmila","Urmilla","Urvashi",
    "Urvasi","Usha","Vanmala","Vasanta","Vasundara","Vasundhara","Vimala","Vimi","Vimla",
    "Zubeida",
	]

end
