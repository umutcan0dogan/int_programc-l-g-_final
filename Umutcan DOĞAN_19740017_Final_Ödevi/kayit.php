<?php
    //! daha önce bir proje için yazdığım trim fonkiyonu örneğim.
    function replace($text) {
        $text = trim($text);
        $search = array('Ç','ç','Ğ','ğ','ı','İ','Ö','ö','Ş','ş','Ü','ü',' ');
        $replace = array('C','c','G','g','i','I','O','o','S','s','U','u','_');
        $new_text = str_replace($search,$replace,$text);
        return $new_text;
    } 
 $yemek_adi = $_POST['yemek_adi'];//?---------------------------------------------------------------------------------------------------------- formdan gelen yemek adı
 $dosya_adi = strtolower(replace($yemek_adi)).'.php';//?--------------------------------------------------------------------------------------- dosya adında kullanmak için trimlenmiş ve küçük harfe dönüştürülmüş yemek adı
 $olcu = $_POST['olcu'];//?-------------------------------------------------------------------------------------------------------------------- formdan gelen ölçü dizisi
 $malzeme_adi = $_POST['malzeme_adi'];//?------------------------------------------------------------------------------------------------------ formdan gelen malzeme adı dizisi
 $tarif = $_POST['yemek_tarifi'];//?----------------------------------------------------------------------------------------------------------- formdan gelen yemek tarifi

    $malzeme = array_combine($olcu,$malzeme_adi);//?------------------------------------------------------------------------------------------- ölçü dizisi ve malzeme adı dizisi array combine ile anahtar ve içerik olarak birleştirildi
    foreach ($malzeme as $olcu => $malzeme){//?------------------------------------------------------------------------------------------------ foreach ile anahtar ölçü değişkenine, içerik ise malzeme değişkenine yazıldı
        if(!isset($malzeme_listesi)){//?------------------------------------------------------------------------------------------------------- malzeme listesi adında bir değişken var mı kontrol edildi    
            $malzeme_listesi = $olcu.' '.$malzeme;//?-------------------------------------------------------------------------------- malzeme listesi değişkeni fwrite ile yazılabilecek şekilde bir array yapısına eşitlendi
        }else{                                                  
            $malzeme_listesi = $malzeme_listesi.'|'.$olcu.' '.$malzeme;//?-------------------------------------------------------------- malzeme listesi değişkeni oluşturulduğu için yeni malzeme eklendi
        }
    }

    //? db bağlantısı
    try {
        $db = new PDO('mysql:host=localhost;dbname=umutcan;charset=utf8', 'root', '');
    } catch (PDOException $e) {
        echo $e->getMessage();
    }

    //?veri kayıt
    if(!empty($yemek_adi) && !empty($olcu) && !empty($malzeme_adi) && !empty($tarif)){
        $query = $db->query("SELECT yemek_adi FROM yemekler where yemek_adi = '$yemek_adi'");
        $yemek = $query->fetch(PDO::FETCH_ASSOC);  
        if(!empty($yemek)){
            echo '<script language="javascript">alert("Bu tarif daha önce eklenmiştir.")</script>';
            header("Refresh:0.1; url=http://localhost");
        }else{
            $traif_ekle = $db->prepare("INSERT INTO yemekler SET 
            yemek_adi = ?, 
            malzeme_listesi = ?, 
            tarif = ?
            ");
            $traif_ekle->execute(array(
                $yemek_adi,
                $malzeme_listesi,
                $tarif
            ));
            if($traif_ekle){
                echo '<script language="javascript">alert("Tarifiniz eklenmiştir. Teşekkür ederiz...")</script>';
                header("Refresh:0.1; url=http://localhost");
            }
        }
        
    }

?>