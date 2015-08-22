<?php  

header("Content-type: text/html; charset=utf-8");     

class AES {
	private static $key = "set_key_here";
	private static $iv = "setup_gIv_here11";

	public static function encrypt($string) {
		$encrypted = mcrypt_encrypt(MCRYPT_RIJNDAEL_128, self::$key, $string, MCRYPT_MODE_CBC, self::$iv);
		return base64_encode($encrypted);
	}

	public static function decrypt($string) {
		$encryptedData = base64_decode($string);
		$decrypted = mcrypt_decrypt(MCRYPT_RIJNDAEL_128, self::$key, $encryptedData, MCRYPT_MODE_CBC, self::$iv);
		return $decrypted;
	}

}

if(isset($_GET['data'])) {
	//解密客户端数据
	$decode_str = AES::decrypt($_GET['data']);

	//处理客户端数据
	$decode_str =  trim($decode_str)." append another data";

	//返回处理结果
	echo AES::encrypt($decode_str);
}

?>