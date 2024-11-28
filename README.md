# **Progetto di Prenotazione Laboratori di Cucina**

## **Descrizione del Progetto**
Il progetto permette di prenotare laboratori di cucina, gestire cuochi, partecipanti e amministratori, e aggiungere lezioni a ciascun laboratorio. Utilizza una web app basata su servlet per la gestione delle operazioni e si appoggia su un database MySQL.

## **Strumenti e Tecnologie Utilizzate**
- **Backend**: Servlet Java
- **Frontend**: HTML, CSS, JavaScript
- **Database**: MySQL (gestito tramite phpMyAdmin in XAMPP)
- **IDE**: Eclipse
- **Server Web**: Apache Tomcat
- **Connettore MySQL**: MySQL Connector/J

## **Installazione e Configurazione**

### **1. Installazione di XAMPP**

1. Vai su [XAMPP](https://www.apachefriends.org/index.html) e scarica la versione compatibile con il tuo sistema operativo.
2. Avvia il file di installazione e segui le istruzioni.
3. Dopo l'installazione, apri il **XAMPP Control Panel** e avvia i servizi **Apache** e **MySQL**.
4. Verifica l'installazione aprendo il browser e navigando su:
   - [http://localhost/](http://localhost/) per verificare Apache.
   - [http://localhost/phpmyadmin/](http://localhost/phpmyadmin/) per accedere a phpMyAdmin.

### **2. Installazione di Eclipse IDE**

1. Vai su [Eclipse](https://www.eclipse.org/downloads/) e scarica "Eclipse IDE for Java Developers".
2. Installa Eclipse seguendo le istruzioni.
3. Avvia Eclipse e seleziona la **workspace** per i progetti.
4. Importa il progetto nel workspace:
   - Vai su **File > Open Project from File System** e seleziona la cartella del progetto.

### **3. Configurazione del Database**

1. Vai su **http://localhost/phpmyadmin/** e crea un nuovo database chiamato `cucina_corso`.
2. Esegui lo script SQL per creare le tabelle necessarie (disponibile nel file allegato o fornito nel progetto).

### **4. Configurazione di Eclipse per il Progetto Web**

1. **Configurazione di Tomcat**:
   - Vai su **Window > Preferences > Server > Runtime Environments**.
   - Aggiungi **Apache Tomcat** selezionando il percorso dove hai scaricato Tomcat (disponibile nel progetto).
   - Associa Tomcat al progetto tramite **Add and Remove**.
   
2. **Aggiungi le librerie necessarie**:
   - Scarica il file **mysql-connector-java-9.1.0.jar** o utilizza quello fornito.
   - Aggiungi il JAR al **Build Path** di Eclipse.

### **5. Esecuzione del Progetto**

1. **Avvia il Server Tomcat**:
   - Clicca con il tasto destro sul progetto in **Project Explorer** e seleziona **Run on Server**.
   - Scegli **Tomcat** e avvia il server.
   
2. **Verifica il Funzionamento del Progetto**:
   - Accedi all'applicazione navigando su **http://localhost:8080/ProgettoEsame**.
   - Usa le seguenti credenziali per il login:
     - **Partecipante**: mario.rossi@gmail.com / password123
     - **Cuoco**: anna.neri@gmail.com / cuocopass
     - **Amministratore**: giovanni.verdi@gmail.com / adminpass
   
3. **Test Funzionalità**:
   - Registrati come utente e fai login.
   - Prenota un laboratorio, cancella una prenotazione come amministratore.
   - Aggiungi lezioni come cuoco.

## **Problemi Comuni e Risoluzioni**

### **Problemi di Connessione al Database**
- Verifica che **MySQL** sia in esecuzione nel pannello di controllo di XAMPP.
- Assicurati che il database `cucina_corso` e le tabelle siano state create correttamente.

### **Errore ClassNotFoundException**
- Assicurati di aver aggiunto il connettore MySQL JAR al **Build Path** di Eclipse.

### **Pagina non trovata (404 Error)**
- Verifica il percorso del progetto, assicurandoti che il nome della cartella sia corretto.
