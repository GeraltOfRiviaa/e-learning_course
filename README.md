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
