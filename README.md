# 📚 E-Learning Database Project

## 🧩 Popis projektu
Tento projekt představuje návrh relační databáze pro **e-learningový systém**, který slouží pro správu kurzů, lekcí, uživatelů a jejich aktivit.  
Cílem je vytvořit robustní a flexibilní databázi, která umožní **učitelům** vytvářet a spravovat kurzy, **studentům** studovat a plánovat lekce, a zároveň zajistí možnost **komunikace** a **společných online lekcí** prostřednictvím integrovaného kalendáře.

---

## 🎯 Cíle systému
Databáze má umožnit:
- správu uživatelů (studentů a učitelů),
- tvorbu a organizaci kurzů a lekcí,
- nahrávání a evidenci studijních příloh,
- plánování lekcí a online schůzek v kalendáři,
- interní chat mezi uživateli,
- udělování certifikátů po dokončení kurzů.

---

## ⚙️ Funkční požadavky

### 👥 Uživatelé
- Dva typy uživatelů: **student** a **učitel**.  
- Každý uživatel má unikátní účet (jméno, e-mail, heslo, role, datum registrace).  
- Mezi uživateli probíhá komunikace prostřednictvím **chatu**.  

### 🎓 Kurzy
- Každý kurz má svého **autora (učitele)**.  
- Obsahuje název, popis, obtížnost, kategorii, datum vytvoření a stav (aktivní/neaktivní).  
- Kurz se skládá z **lekcí**.  

### 📖 Lekce
- Každá lekce patří do jednoho kurzu.  
- Obsahuje název, popis, pořadí, studijní text a volitelné přílohy.  
- Studenti mohou lekci označit jako dokončenou.  

### 📎 Přílohy
- Každá příloha patří k jedné lekci.  
- Obsahuje typ souboru, název, cestu, velikost a datum nahrání.  

### 🗓️ Kalendář (Semi/Globální)
- Kalendář slouží **učitelům i studentům**.  
- **Učitelé** mohou vytvářet **globální události** (např. online lekce, videohovory, konzultace), které se zobrazí studentům přihlášeným do kurzu.  
- **Studenti** si mohou přidávat vlastní individuální záznamy (např. „opakování lekce 2 z kurzu Python“).  
- Události obsahují: datum, čas, odkaz na kurz/lekci, případně odkaz na videohovor (např. Zoom/Meet link).  

### 💬 Chat
- Umožňuje komunikaci mezi studenty a učiteli.  
- Každá zpráva má odesílatele, příjemce, obsah a čas odeslání.  

### 🏅 Certifikáty
- Po dokončení všech lekcí kurzu student získá certifikát.  
- Certifikát obsahuje datum vydání, jméno studenta, název kurzu a unikátní kód certifikátu.  

---

## 🧱 Návrh databáze – Entity a Atributy

### 1. **Uživatel (User)**
| Atribut | Datový typ | Popis |
|----------|-------------|-------|
| ID_uzivatele | INT, PK, AUTO_INCREMENT | Jedinečný identifikátor |
| jmeno | VARCHAR | Křestní jméno |
| prijmeni | VARCHAR | Příjmení |
| email | VARCHAR, UNIQUE | E-mail uživatele |
| heslo | VARCHAR | Heslo (hashováno) |
| role | ENUM('student', 'ucitel') | Typ uživatele |
| datum_registrace | DATE | Datum registrace |

---

### 2. **Kurz (Course)**
| Atribut | Datový typ | Popis |
|----------|-------------|-------|
| ID_kurzu | INT, PK, AUTO_INCREMENT | Identifikátor kurzu |
| nazev | VARCHAR | Název kurzu |
| popis | TEXT | Popis kurzu |
| obtiznost | ENUM('zacatecnik', 'pokrocily', 'expert') | Obtížnost |
| kategorie | VARCHAR | Kategorie kurzu |
| datum_vytvoreni | DATE | Datum vytvoření |
| stav | BOOLEAN | Aktivní/Neaktivní |
| ID_autora | INT, FK → User.ID_uzivatele | Autor kurzu |

---

### 3. **Lekce (Lesson)**
| Atribut | Datový typ | Popis |
|----------|-------------|-------|
| ID_lekce | INT, PK, AUTO_INCREMENT | Identifikátor lekce |
| ID_kurzu | INT, FK → Course.ID_kurzu | Kurz, do kterého lekce patří |
| nazev | VARCHAR | Název lekce |
| popis | TEXT | Popis lekce |
| poradi | INT | Pořadí lekce |
| studijni_text | TEXT | Studijní obsah |

---

### 4. **Příloha (Attachment)**
| Atribut | Datový typ | Popis |
|----------|-------------|-------|
| ID_prilohy | INT, PK, AUTO_INCREMENT | Identifikátor přílohy |
| ID_lekce | INT, FK → Lesson.ID_lekce | Příslušná lekce |
| typ_souboru | VARCHAR | Typ (PDF, video, obrázek...) |
| nazev_souboru | VARCHAR | Název souboru |
| cesta | VARCHAR | Cesta k souboru |
| velikost | INT | Velikost v bajtech |
| datum_nahrani | DATETIME | Datum nahrání |

---

### 5. **Kalendář (Calendar)**
| Atribut | Datový typ | Popis |
|----------|-------------|-------|
| ID_udalosti | INT, PK, AUTO_INCREMENT | Identifikátor události |
| ID_vytvoril | INT, FK → User.ID_uzivatele | Autor události (učitel/student) |
| ID_kurzu | INT, FK → Course.ID_kurzu | Odkaz na kurz |
| ID_lekce | INT, FK → Lesson.ID_lekce (nullable) | Odkaz na lekci (pokud existuje) |
| datum | DATE | Datum události |
| cas | TIME | Čas události |
| globalni | BOOLEAN | True = viditelná pro všechny studenty kurzu |
| odkaz_videohovor | VARCHAR | URL na online lekci (např. Zoom/Meet) |

---

### 6. **Chat (Message)**
| Atribut | Datový typ | Popis |
|----------|-------------|-------|
| ID_zpravy | INT, PK, AUTO_INCREMENT | Identifikátor zprávy |
| odesilatel | INT, FK → User.ID_uzivatele | Odesílatel |
| prijemce | INT, FK → User.ID_uzivatele | Příjemce |
| obsah | TEXT | Obsah zprávy |
| datum_odeslani | DATETIME | Datum a čas odeslání |

---

### 7. **Certifikát (Certificate)**
| Atribut | Datový typ | Popis |
|----------|-------------|-------|
| ID_certifikatu | INT, PK, AUTO_INCREMENT | Identifikátor certifikátu |
| ID_studenta | INT, FK → User.ID_uzivatele | Student |
| ID_kurzu | INT, FK → Course.ID_kurzu | Kurz |
| datum_vydani | DATE | Datum vydání |
| kod_certifikatu | VARCHAR, UNIQUE | Jedinečný kód certifikátu |

---

## 🔗 Vztahy mezi entitami
- **User ↔ Course:** 1:N (učitel může vytvořit více kurzů)  
- **Course ↔ Lesson:** 1:N (kurz obsahuje více lekcí)  
- **Lesson ↔ Attachment:** 1:N (lekce může mít více příloh)  
- **User ↔ Calendar:** 1:N (uživatel může vytvářet více událostí)  
- **Calendar (globální)** se může zobrazovat více uživatelům (M:N vztah přes kurz).  
- **User ↔ Chat:** M:N (komunikace mezi uživateli)  
- **User ↔ Certificate:** 1:N (student může získat více certifikátů)  

---

## 🧠 Technologie a formát
Databáze je navržena pro **MySQL/MariaDB**, lze však snadno převést do jiných SQL systémů (PostgreSQL, SQLite).  
ER diagram byl vytvořen v **programu DIA**.

---

## 🖼️ ER Diagram
Součástí repozitáře je soubor:
