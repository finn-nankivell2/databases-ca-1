-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 30, 2023 at 12:47 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `video_rental`
--

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `second_name` varchar(50) NOT NULL,
  `dob` date NOT NULL,
  `address` varchar(150) DEFAULT NULL,
  `membership` enum('Regular','Gold','Platinum') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `first_name`, `second_name`, `dob`, `address`, `membership`) VALUES
(1, 'Roger', 'Woodard', '1977-09-13', '46 Grandison Road, Liverpool', 'Gold'),
(2, 'Conner', 'Friedman', '1967-06-20', '2 Alba Close, Hayes', 'Regular'),
(3, 'Andreas', 'Saunders', '2004-04-02', '2 Ragnall Cottage, Ragnalls Lane, Horton Cum Studley', 'Regular'),
(4, 'Summer', 'Rodgers', '1986-08-17', 'Flat 3A Rear, 3A Prince Of Wales Road, Bournemouth', 'Regular'),
(5, 'Aiza', 'Ayers', '1966-11-19', '25 Shamrock Way, London', 'Regular'),
(6, 'Lorraine', 'Stevenson', '1996-04-21', '51 Randolph Road, Portsmouth, PO2 0SU', 'Gold'),
(7, 'Jim', 'Boyer', '2003-10-15', 'Flat 13, The Beeches, London Road, Mitcham, CR4 4BH', 'Platinum'),
(8, 'Amanda', 'Lawson', '1969-05-25', '27 Ferry Lane, Offenham, WR11 8RT', 'Gold'),
(9, 'Everett', 'Kirk', '1990-06-15', 'Bacons Yard, Aubrey North Farm, Keyhaven, SO41 0TH', 'Regular'),
(10, 'Shannon', 'Fischer', '1966-11-21', '1 Meadow Cottages, Ironbridge Road, Madeley, TF7 5JX', 'Regular'),
(11, 'Sameer', 'Khan', '1972-10-16', '10 Plantation Close, Attleborough, NR17 2LY', 'Regular'),
(12, 'Gareth', 'Ellis', '1977-01-02', 'Gwelfryn, Penysarn, LL69 9YS', 'Platinum'),
(13, 'Emilie', 'Wilkins', '1984-05-02', '2 The Gallery, 38 Ludgate Hill, London, EC4M 7DE', 'Gold'),
(14, 'Safia', 'Watts', '1969-05-08', '3 Noonan Close, Redditch, B97 4NN', 'Regular'),
(15, 'Murray', 'Trujillo', '1997-07-14', '11 Westfield Drive, Crook, DL15 9NX', 'Gold');

-- --------------------------------------------------------

--
-- Table structure for table `customers_movies`
--

CREATE TABLE `customers_movies` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `movie_id` int(11) NOT NULL,
  `return_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers_movies`
--

INSERT INTO `customers_movies` (`id`, `customer_id`, `movie_id`, `return_date`) VALUES
(1, 3, 9, '2023-03-28'),
(2, 6, 1, '2023-03-31'),
(3, 12, 2, '2023-04-03'),
(4, 4, 4, '2023-03-28'),
(5, 1, 12, '2023-03-31'),
(6, 15, 7, '2023-04-03'),
(7, 13, 15, '2023-03-29'),
(8, 13, 3, '2023-03-29'),
(9, 7, 4, '2023-04-04'),
(10, 9, 14, '2023-03-01');

-- --------------------------------------------------------

--
-- Table structure for table `customers_payment_types`
--

CREATE TABLE `customers_payment_types` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `payment_type_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers_payment_types`
--

INSERT INTO `customers_payment_types` (`id`, `customer_id`, `payment_type_id`) VALUES
(1, 5, 2),
(2, 8, 2),
(3, 3, 3),
(4, 2, 2),
(5, 13, 1),
(6, 9, 1),
(7, 12, 3),
(8, 7, 2),
(9, 6, 1),
(10, 15, 2),
(11, 1, 3),
(12, 14, 2),
(13, 11, 1),
(14, 10, 1),
(15, 4, 2),
(16, 5, 1),
(17, 15, 3),
(18, 11, 3),
(19, 1, 2),
(20, 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `genres`
--

CREATE TABLE `genres` (
  `id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `genres`
--

INSERT INTO `genres` (`id`, `title`, `description`) VALUES
(1, 'Comedy', 'Movies centered around comedy\r\n'),
(2, 'Animation', 'Classic hand-drawn animated movies\r\n'),
(3, 'Action', 'Action packed blockbusters\r\n'),
(4, 'Drama', 'Tense and dramatic movies\r\n'),
(5, 'Crime', 'A delve into the criminal underword\r\n'),
(6, 'Stop-Motion', 'Stop-Motion animated movies\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `movies`
--

CREATE TABLE `movies` (
  `id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` varchar(300) NOT NULL,
  `age_rating` int(11) NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `genre_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `movies`
--

INSERT INTO `movies` (`id`, `title`, `description`, `age_rating`, `price`, `genre_id`) VALUES
(1, 'The Big Lebowski', 'Ultimate L.A. slacker Jeff \"The Dude\" Lebowski, mistaken for a millionaire of the same name, seeks restitution for a rug ruined by debt collectors, enlisting his bowling buddies for help while trying to find the millionaire\'s missing wife.', 15, '8.99', 1),
(2, 'Fantastic Mr. Fox', 'An urbane fox cannot resist returning to his farm raiding ways and then must help his community survive the farmers\' retaliation.', 8, '7.99', 6),
(3, 'Shark Tale', 'When a son of a gangster shark boss is accidentally killed while on the hunt, his would-be prey and his vegetarian brother decide to use the incident to their own advantage.', 3, '4.99', 5),
(4, 'Princess Mononoke', 'On a journey to find the cure for a Tatarigami\'s curse, Ashitaka finds himself in the middle of a war between the forest gods and Tatara, a mining colony. In this quest he also meets San, the Mononoke Hime.', 12, '9.99', 2),
(5, 'My Neighbour Totoro', 'When two girls move to the country to be near their ailing mother, they have adventures with the wondrous forest spirits who live nearby.', 3, '9.99', 2),
(6, 'Drive My Car', 'A renowned stage actor and director learns to cope with a big personal loss when he receives an offer to direct a production of Uncle Vanya in Hiroshima.', 3, '9.99', 4),
(7, 'A Serious Man', 'Larry Gopnik, a Midwestern physics teacher, watches his life unravel over multiple sudden incidents. Though seeking meaning and answers amidst his turmoils, he seems to keep sinking.', 12, '7.99', 1),
(8, 'Decision To Leave', 'A detective investigating a man\'s death in the mountains meets the dead man\'s mysterious wife in the course of his dogged sleuthing.', 15, '10.99', 4),
(9, 'Banshees of Inisherin', 'Two lifelong friends find themselves at an impasse when one abruptly ends their relationship, with alarming consequences for both of them.', 15, '11.99', 1),
(10, 'Everything Everywhere All At Once', 'A middle-aged Chinese immigrant is swept up into an insane adventure in which she alone can save existence by exploring other universes and connecting with the lives she could have led.', 15, '11.99', 1),
(11, 'The Iron Giant', 'A young boy befriends a giant robot from outer space that a paranoid government agent wants to destroy.', 3, '5.99', 2),
(12, 'The Incredibles', 'While trying to lead a quiet suburban life, a family of undercover superheroes are forced into action to save the world.', 3, '4.99', 3),
(13, 'Hit the Road', 'Follows a chaotic, tender family that is on a road trip across a rugged landscape and fussing over the sick dog and getting on each others\' nerves. Only the mysterious older brother is quiet.', 12, '7.99', 4),
(14, 'Little Miss Sunshine', 'A family determined to get their young daughter into the finals of a beauty pageant take a cross-country trip in their VW bus.', 15, '6.99', 1),
(15, 'Tangled', 'The magically long-haired Rapunzel has spent her entire life in a tower, but now that a runaway thief has stumbled upon her, she is about to discover the world for the first time, and who she really is.', 3, '4.99', 3);

-- --------------------------------------------------------

--
-- Table structure for table `payment_type`
--

CREATE TABLE `payment_type` (
  `id` int(11) NOT NULL,
  `name` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment_type`
--

INSERT INTO `payment_type` (`id`, `name`) VALUES
(1, 'Debit Card'),
(2, 'Cash'),
(3, 'Gift Card');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers_movies`
--
ALTER TABLE `customers_movies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk4` (`customer_id`),
  ADD KEY `fk5` (`movie_id`);

--
-- Indexes for table `customers_payment_types`
--
ALTER TABLE `customers_payment_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk2` (`customer_id`),
  ADD KEY `fk3` (`payment_type_id`);

--
-- Indexes for table `genres`
--
ALTER TABLE `genres`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk1` (`genre_id`);

--
-- Indexes for table `payment_type`
--
ALTER TABLE `payment_type`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `customers_movies`
--
ALTER TABLE `customers_movies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `customers_payment_types`
--
ALTER TABLE `customers_payment_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `genres`
--
ALTER TABLE `genres`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `movies`
--
ALTER TABLE `movies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `payment_type`
--
ALTER TABLE `payment_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `customers_movies`
--
ALTER TABLE `customers_movies`
  ADD CONSTRAINT `fk4` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`),
  ADD CONSTRAINT `fk5` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`);

--
-- Constraints for table `customers_payment_types`
--
ALTER TABLE `customers_payment_types`
  ADD CONSTRAINT `fk2` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`),
  ADD CONSTRAINT `fk3` FOREIGN KEY (`payment_type_id`) REFERENCES `payment_type` (`id`);

--
-- Constraints for table `movies`
--
ALTER TABLE `movies`
  ADD CONSTRAINT `fk1` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
