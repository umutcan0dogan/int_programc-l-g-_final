-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 20 Oca 2022, 18:18:07
-- Sunucu sürümü: 10.4.22-MariaDB
-- PHP Sürümü: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `umutcan`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `yemekler`
--

CREATE TABLE `yemekler` (
  `id` int(11) NOT NULL,
  `yemek_adi` varchar(255) NOT NULL,
  `malzeme_listesi` text NOT NULL,
  `tarif` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `yemekler`
--

INSERT INTO `yemekler` (`id`, `yemek_adi`, `malzeme_listesi`, `tarif`) VALUES
(13, 'Menemen Tarifi', '2 Yemek Kaşığı Sıvı Yağ|3 adet Domates|2 adet Yeşil Biber|2 adet Yumurta', 'Sıvı yağı ve biberleri tavaya alarak biberlerin rengi dönünceye kadar kavurun.\r\nÜzerine kabukları soyulup küçük küçük doğranmış domatesleri ilave edin.\r\nKısık ocakta tavanın kapağını kapatarak domateslerin iyice pişmesini bekleyin.\r\nDomatesler çok suyu değil, tavaya yapışıyorsa birazcık kaynar su ekleyebilirsiniz. Genellikle de bu duruma gerek kalmayacaktır.\r\nFotoğraftaki gibi domatesler piştikten sonra yumurtaları kırabilirsiniz. Yumurtaları ister ayrı bir kapta çırpıp ekleyin isterseniz de benim gibi tavaya kırıp tavada karıştırabilirsiniz.\r\nÜzerine tuz ve dilediğiniz baharatları ekleyerek yumurtalar pişene kadar bekleyin.\r\nKaşar peyniri eklemek istiyorsanız bu aşamada peynirleri de ilave edebilirsiniz. Menemeni sıcak olarak servis yapın.'),
(14, 'Sucuklu Kaşarlı Tost', '4 Dilim Kaşar Peyniri|8 Dilim Sucuk|1 Çay Kaşığı Tereyağı|1 Adet Domates', 'İkişer tost ekmeğinin üzerine ikişet kaşar peyniri dilimini ve dörder sucuğu yerleştirin ve üstlerini kalan ekmeklerle kapatın. Önceden ısıtmaya başladığınız tost makinesine yerleştirin. Pişerken üzerine tereyağı sürün ve domatesle servis edin. İşte bu kadar kolay.');

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `yemekler`
--
ALTER TABLE `yemekler`
  ADD PRIMARY KEY (`id`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `yemekler`
--
ALTER TABLE `yemekler`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
