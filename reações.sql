 /* BANCO DE DADOS - FACEBOOK REATIONS 
    AUTOR: Phillipe Martins
    URL: https://phmartins.github.io/
    VERSÃO: 1.0 LITE
 */


-- phpMyAdmin SQL Dump
-- version 4.4.3
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 30, 2016 at 10:50 PM
-- Server version: 5.6.24
-- PHP Version: 5.5.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `Reações`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `posts`
--

CREATE TABLE IF NOT EXISTS `posts` (
  `msg_id` int(11) NOT NULL,
  `post` varchar(200) NOT NULL,
  `uid_fk` int(11) NOT NULL,
  `like_count` int(11) DEFAULT '0',
  `created` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dados da tabela `posts`
--

INSERT INTO `posts` (`msg_id`, `post`, `uid_fk`, `like_count`, `created`) VALUES
(1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut magna est, aliquet eu diam non, hendrerit rutrum libero.', 3, 0, 1459348955),
(2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut magna est, aliquet eu diam non, hendrerit rutrum libero.', 1, 0, 1459348978),
(3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut magna est, aliquet eu diam non, hendrerit rutrum libero.', 2, 0, 1459349005),
(4, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut magna est, aliquet eu diam non, hendrerit rutrum libero.', 1, 0, 1459349027);

-- --------------------------------------------------------

--
-- Estrutura da tabela `post_like`
--

CREATE TABLE IF NOT EXISTS `post_like` (
  `like_id` int(11) NOT NULL,
  `msg_id_fk` int(11) DEFAULT NULL,
  `uid_fk` int(11) NOT NULL,
  `created` int(11) NOT NULL,
  `rid_fk` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=latin1;

--
-- Dados da tabela `post_like`
--

INSERT INTO `post_like` (`like_id`, `msg_id_fk`, `uid_fk`, `created`, `rid_fk`) VALUES
(1, 4, 2, 1459349202, 2),
(3, 2, 3, 1459349254, 1),
(4, 1, 2, 1459349254, 7),
(5, 3, 3, 1459349281, 4),
(6, 4, 3, 1459349281, 8);

-- --------------------------------------------------------

--
-- Estrutura da tabela `reactions`
--

CREATE TABLE IF NOT EXISTS `reactions` (
  `rid` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dados da tabela `reactions`
--

INSERT INTO `reactions` (`rid`, `name`) VALUES
(1, 'Curtir'),
(2, 'Amei'),
(3, 'Haha'),
(4, 'Uau'),
(5, 'Legal'),
(6, 'Confuso'),
(7, 'Triste'),
(8, 'Grr');

-- --------------------------------------------------------

--
-- Estrutura da tabela table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `uid` int(11) NOT NULL,
  `username` varchar(45) DEFAULT NULL,
  `email` varchar(120) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `profile_pic` varchar(200) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dados da tabela `users`
--

INSERT INTO `users` (`uid`, `username`, `email`, `password`, `name`, `profile_pic`) VALUES
(1, 'matheus', 'matheus@mail.com', '63a401a18004e5c6a5b5bd3643fbb1d5', 'Matheus Silva', 'http://www.hayy.net/Content/img/custom/default-avatar.png'),
(2, 'marcos', 'marcos@mail.com', '63a401a18004e5c6a5b5bd3643fbb1d5', 'Marcos Matos', 'http://www.hayy.net/Content/img/custom/default-avatar.png'),
(3, 'felipe', 'felipe@mail.com', '63a401a18004e5c6a5b5bd3643fbb1d5', 'Felipe Martins', 'http://www.hayy.net/Content/img/custom/default-avatar.png');

--
-- Adicionar colunas a tabela
--

--
-- Adicionar coluna `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`msg_id`),
  ADD KEY `uid_fk` (`uid_fk`);

--
-- Adicionar coluna `post_like`
--
ALTER TABLE `post_like`
  ADD PRIMARY KEY (`like_id`),
  ADD KEY `uid_fk` (`uid_fk`),
  ADD KEY `msg_id_fk` (`msg_id_fk`),
  ADD KEY `rid_fk` (`rid_fk`);

--
-- Adicionar coluna `reactions`
--
ALTER TABLE `reactions`
  ADD PRIMARY KEY (`rid`);

--
-- Adicionar coluna `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`uid`);

--
-- AUTO_INCREMENT Para tabelas descartadas
--

--
-- AUTO_INCREMENT para tabela `posts`
--
ALTER TABLE `posts`
  MODIFY `msg_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT para tabela `post_like`
--
ALTER TABLE `post_like`
  MODIFY `like_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=62;
--
-- AUTO_INCREMENT para tabela `reactions`
--
ALTER TABLE `reactions`
  MODIFY `rid` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT para tabela `users`
--
ALTER TABLE `users`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- Restrições para tabela
--

--
-- Restrições para a tabela `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`uid_fk`) REFERENCES `users` (`uid`);

--
-- Restrições para a tabela `post_like`
--
ALTER TABLE `post_like`
  ADD CONSTRAINT `post_like_ibfk_1` FOREIGN KEY (`uid_fk`) REFERENCES `users` (`uid`),
  ADD CONSTRAINT `post_like_ibfk_2` FOREIGN KEY (`msg_id_fk`) REFERENCES `posts` (`msg_id`),
  ADD CONSTRAINT `post_like_ibfk_3` FOREIGN KEY (`rid_fk`) REFERENCES `reactions` (`rid`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
