<?php
/*Ce fichier a été généré automatiquement lors de l'installation */
class Config
{
	private $server = "localhost";
	private $db_login = "esprit";
	private $db_password = "esprit";
	private $db_name = "gestioncomposant";
	
	public function connect()
	{
		$l = mysql_connect($this->server,$this->db_login,$this->db_password);
		mysql_select_db($this->db_name);
	}
	
	public function disconnect()
	{
		mysql_close();
	}
	
	/*public function __get($attr)
	{
		$a = array("sv" => $this->server, "login" => $this->db_login, "pwd" => $this->db_password, "dbname" => $this->db_name);
		if(array_key_exists($attr,$a))
		{
			return $a[$attr];
		}
	}*/
}
?>
