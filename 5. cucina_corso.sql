-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Nov 28, 2024 alle 15:11
-- Versione del server: 10.4.32-MariaDB
-- Versione PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cucina_corso`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `laboratorio`
--

CREATE TABLE `laboratorio` (
  `ID` int(11) NOT NULL,
  `Titolo` varchar(100) NOT NULL,
  `Descrizione` varchar(255) NOT NULL,
  `Posti` int(11) NOT NULL,
  `Quota` decimal(10,2) NOT NULL,
  `IDCuoco` int(11) DEFAULT NULL,
  `AmministratoreID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `laboratorio`
--

INSERT INTO `laboratorio` (`ID`, `Titolo`, `Descrizione`, `Posti`, `Quota`, `IDCuoco`, `AmministratoreID`) VALUES
(1, 'Cucina Italiana', 'Laboratorio sui piatti tradizionali italiani', 16, 50.00, 4, 3),
(2, 'Dolci e Dessert', 'Preparazione di dolci e dessert', 9, 40.00, 5, 14),
(3, 'Cucina Napoletana', 'Scopri la vera pizza napoletana', 19, 60.00, 8, 14),
(4, 'Corso di Cucina Base', 'Un corso per principianti sulla cucina italiana.', 20, 50.00, 9, 14),
(5, 'Corso Avanzato di Pasticceria', 'Corso avanzato sulla preparazione di dolci e torte complesse.', 14, 80.00, 10, 14),
(6, 'Cucina Vegetariana', 'Corso che esplora piatti vegetariani e vegani.', 17, 60.00, 13, 3),
(7, 'Tecniche di Cottura', 'Impara diverse tecniche di cottura per diversi tipi di ingredienti.', 24, 70.00, 12, 3),
(8, 'Corso di Sushi', 'Corso dedicato alla preparazione del sushi e piatti giapponesi.', 11, 100.00, 16, 14);

-- --------------------------------------------------------

--
-- Struttura della tabella `lezione`
--

CREATE TABLE `lezione` (
  `Id` int(255) NOT NULL,
  `Titolo` varchar(255) NOT NULL,
  `LaboratorioID` int(255) DEFAULT NULL,
  `Data` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `lezione`
--

INSERT INTO `lezione` (`Id`, `Titolo`, `LaboratorioID`, `Data`) VALUES
(1, 'Introduzione alla Pasta', 1, '2024-12-05 14:15:00'),
(2, 'Pasta: tecniche avanzate', 1, '2024-12-12 10:00:00'),
(4, 'Panificazione Base', 3, '2024-12-09 14:00:00'),
(5, 'Panificazione Speciale', 3, '2024-12-16 18:00:00'),
(7, 'Panificazione Avanzata: Lievito Madre', 3, '2024-12-20 20:00:00'),
(8, 'Gnocchi Fatti in Casa', 1, '2024-12-22 13:00:00'),
(9, 'Preparazione Babà e Zeppole', 2, '2024-12-18 19:00:00'),
(10, 'Tecniche di Impasto per Pane', 3, '2024-12-23 17:00:00'),
(11, 'Decorazione Dolci Napoletani', 2, '2024-12-26 18:00:00'),
(12, 'Introduzione alla Pasta Fresca', 4, '2024-12-05 10:00:00'),
(13, 'Decorazione di Dolci', 5, '2024-12-06 14:00:00'),
(14, 'Tecniche di Cottura per Vegetariano', 6, '2024-12-07 09:30:00'),
(15, 'Cucina di Pesce', 7, '2024-12-08 15:00:00'),
(16, 'Masterclass di Sushi', 8, '2024-12-09 11:00:00'),
(19, 'Pastiera Napoletana', 1, '2024-11-30 15:00:00'),
(20, 'Taglio del pesce', 8, '2024-12-08 13:30:00'),
(21, 'Biscotto cinese', 8, '2024-12-07 14:00:00'),
(22, 'Lievito', 1, '2024-12-19 14:00:00');

-- --------------------------------------------------------

--
-- Struttura della tabella `prenotazione`
--

CREATE TABLE `prenotazione` (
  `ID` int(11) NOT NULL,
  `IDPartecipante` int(11) NOT NULL,
  `IDLaboratorio` int(11) NOT NULL,
  `DataPrenotazione` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `prenotazione`
--

INSERT INTO `prenotazione` (`ID`, `IDPartecipante`, `IDLaboratorio`, `DataPrenotazione`) VALUES
(1, 1, 1, '2024-11-25 19:15:57'),
(2, 1, 8, '2024-11-26 11:20:08'),
(3, 1, 7, '2024-11-26 11:21:05');

-- --------------------------------------------------------

--
-- Struttura della tabella `specialita`
--

CREATE TABLE `specialita` (
  `ID` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `descrizione` text DEFAULT NULL,
  `cuocoID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `specialita`
--

INSERT INTO `specialita` (`ID`, `nome`, `descrizione`, `cuocoID`) VALUES
(1, 'Pasta Fresca', 'Preparazione di pasta fresca fatta a mano, inclusi ravioli e tortellini.', 4),
(2, 'Dolci Napoletani', 'Specialità dolciarie tradizionali della cucina napoletana, come la sfogliatella e la pastiera.', 5),
(3, 'Pane Artigianale', 'Tecniche di panificazione con lievito madre per un pane rustico e fragrante.', 8),
(4, 'Pizzeria', 'Gestione delle farine', 9),
(5, 'Risotto alla Milanese', 'Un classico risotto italiano con zafferano e brodo di carne', 10),
(6, 'Pizza Margherita', 'Pizza tradizionale con pomodoro, mozzarella e basilico', 12),
(7, 'Lasagna al Forno', 'Lasagna con ragù di carne e besciamella, cotta al forno', 13),
(8, 'Cottura del Pane', 'Gestione delle temperature durante la cottura', 16);

-- --------------------------------------------------------

--
-- Struttura della tabella `utente`
--

CREATE TABLE `utente` (
  `ID` int(11) NOT NULL,
  `Nome` varchar(50) NOT NULL,
  `Cognome` varchar(50) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `Cell` varchar(255) DEFAULT NULL,
  `P.IVA` varchar(255) DEFAULT NULL,
  `Specialita` int(255) DEFAULT NULL,
  `Ruolo` enum('Amministratore','Cuoco','Partecipante') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `utente`
--

INSERT INTO `utente` (`ID`, `Nome`, `Cognome`, `Email`, `Password`, `Cell`, `P.IVA`, `Specialita`, `Ruolo`) VALUES
(1, 'Mario', 'Rossi', 'mario.rossi@gmail.com', '$2a$10$CXe5dLJEXBrCzHZiGcfziu6ZhzcZuLP97iyr3tnKaoo6pUg3Z2Mte', '3334565889', NULL, NULL, 'Partecipante'),
(2, 'Lucia', 'Bianchi', 'lucia.bianchi@gmail.com', '$2a$10$02j4wOncJ6TbI1DhhU8mwuyZ6kEqUgDuhQp7Orfx/srymEQgYpM9K', '3332134556', NULL, NULL, 'Partecipante'),
(3, 'Giovanni', 'Verdi', 'giovanni.verdi@gmail.com', '$2a$10$XfsxxgNyfqeIc0fgHRL6yO/DnUzPe7SK7Fw5HB60uca4ndtyDkA2u', '3346765443', 'IT12345678901', NULL, 'Amministratore'),
(4, 'Anna', 'Neri', 'anna.neri@gmail.com', '$2a$10$rNgDujkQhoNXGpWoFK/ga.FWcJJVKEzJ7SVZwH5GeQw/7fstmNyFC', '3342134778', NULL, 1, 'Cuoco'),
(5, 'Maria', 'Russo', 'mariarusso@gmail.com', '$2a$10$yqwt7AVsVuSMNFdu/L.tkOIKh2iwBwin1qC5W/2BQDRKN/95Ma9za', '3345676555', NULL, 3, 'Cuoco'),
(6, 'Sandro', 'Mallardo', 'sandro@gmail.com', '$2a$10$k93JRMX5tcC6KiPZT99B4uF9MRQ.i2430AHGRwYwswfs93JUAwzYi', '3334578990', NULL, NULL, 'Partecipante'),
(7, 'Paolo', 'Paoloni', 'giovanni@gmail.com', '$2a$10$PsvHZBog4yDe48A3cJHI/eJf5U9yOl52cznQAi2T1CaAZYs/MIoia', '3472486106', NULL, NULL, 'Partecipante'),
(8, 'Giovanni', 'Mallardo', 'gio567full@gmail.com', '$2a$10$uHf5T.ugWvNC4uLYVoObLeejwXtk.hZeXoJXptNTYnkwGgBTrmT0G', '3456748109', NULL, 6, 'Cuoco'),
(9, 'Daniele', 'Granata', 'Daniele@gmail.com', '$2a$10$SoquTIExcJtiuGu/USVuk.tKxGEp2yGreOegx7ERIf7oKnWiQz3fu', '3298765432', NULL, 7, 'Cuoco'),
(10, 'Patrizio', 'Fiscali', 'patrizio@gmail.com', '$2a$10$HTc0GNxQo1Sc0DOnfVeAi.St9gJSUXiULI2BLXHB0/GXpi9VwDlkS', '3459876491', NULL, 4, 'Cuoco'),
(11, 'Martina', 'Pirozzi', 'martina@gmail.com', '$2a$10$RlmPyjqfQfWm57AweirS9eEtzyx1NSVWtoWqz7p4leJDo3BwVpyOe', '3456712345', NULL, NULL, 'Partecipante'),
(12, 'Zora', 'Patrizia', 'zora@gmail.com', '$2a$10$ffKNWWW0mInIeslNltBRxOFQKVDsN2vCJpoQVUv6.uydsdkX.i6EK', '3456754098', NULL, 2, 'Cuoco'),
(13, 'Bruno', 'Barbieri', 'bruno@gmail.com', '$2a$10$6ROVvX1QRQq3wFt2gwrYW.Lt.IjqY0nd.6KprCxvQAmzHEt1qXeFC', '3423454321', NULL, 3, 'Cuoco'),
(14, 'Mario', 'Giordano', 'mario@gmail.com', '$2a$10$ol5FyajrI2yxYE5joTmxjefUb3iXnQ20grCZMMODxikoZcpOjBeke', '3234545678', 'IT4958674390', NULL, 'Amministratore'),
(15, 'Sandro', 'Albertini', 'albertini@gmail.com', '$2a$10$B3wF67FjidhOmUOa7crpMuxpO1/0Tol7QbQLsGhKDJJcTrlKHN6lG', '3334565443', NULL, NULL, 'Partecipante'),
(16, 'Luca', 'Pirozzi', 'luca@gmail.com', '$2a$10$KjeutnNiQQFiwySqMk0/UuOVl8O2/tpN0QQZujbZSe9pC63xfgzBC', '3334509887', NULL, 8, 'Cuoco'),
(17, 'Michele', 'Miraglia', 'michele@gmail.com', '$2a$10$8K1Q87C33ReFg4KVuugMkeNqs.ms5qxtv9mCvq0m72/Suja5jvatu', '3347856773', NULL, NULL, 'Partecipante');

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `laboratorio`
--
ALTER TABLE `laboratorio`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `laboratorio_ibfk_1` (`IDCuoco`),
  ADD KEY `AmministratoreID` (`AmministratoreID`);

--
-- Indici per le tabelle `lezione`
--
ALTER TABLE `lezione`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `lezione_ibfk_1` (`LaboratorioID`);

--
-- Indici per le tabelle `prenotazione`
--
ALTER TABLE `prenotazione`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IDLaboratorio` (`IDLaboratorio`),
  ADD KEY `prenotazione_ibfk_1` (`IDPartecipante`);

--
-- Indici per le tabelle `specialita`
--
ALTER TABLE `specialita`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `cuocoID` (`cuocoID`);

--
-- Indici per le tabelle `utente`
--
ALTER TABLE `utente`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Email` (`Email`),
  ADD UNIQUE KEY `Cell` (`Cell`),
  ADD KEY `Specialita` (`Specialita`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `laboratorio`
--
ALTER TABLE `laboratorio`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT per la tabella `lezione`
--
ALTER TABLE `lezione`
  MODIFY `Id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT per la tabella `prenotazione`
--
ALTER TABLE `prenotazione`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT per la tabella `specialita`
--
ALTER TABLE `specialita`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT per la tabella `utente`
--
ALTER TABLE `utente`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `laboratorio`
--
ALTER TABLE `laboratorio`
  ADD CONSTRAINT `laboratorio_ibfk_1` FOREIGN KEY (`IDCuoco`) REFERENCES `utente` (`ID`) ON DELETE SET NULL,
  ADD CONSTRAINT `laboratorio_ibfk_2` FOREIGN KEY (`AmministratoreID`) REFERENCES `utente` (`ID`);

--
-- Limiti per la tabella `lezione`
--
ALTER TABLE `lezione`
  ADD CONSTRAINT `lezione_ibfk_1` FOREIGN KEY (`LaboratorioID`) REFERENCES `laboratorio` (`ID`);

--
-- Limiti per la tabella `prenotazione`
--
ALTER TABLE `prenotazione`
  ADD CONSTRAINT `prenotazione_ibfk_1` FOREIGN KEY (`IDPartecipante`) REFERENCES `utente` (`ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `prenotazione_ibfk_2` FOREIGN KEY (`IDLaboratorio`) REFERENCES `laboratorio` (`ID`) ON DELETE CASCADE;

--
-- Limiti per la tabella `specialita`
--
ALTER TABLE `specialita`
  ADD CONSTRAINT `specialita_ibfk_1` FOREIGN KEY (`cuocoID`) REFERENCES `utente` (`ID`);

--
-- Limiti per la tabella `utente`
--
ALTER TABLE `utente`
  ADD CONSTRAINT `utente_ibfk_1` FOREIGN KEY (`Specialita`) REFERENCES `specialita` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
