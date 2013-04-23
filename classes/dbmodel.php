<?php
require_once "config.php";

abstract class DbModel
{
	protected $c;
	
	public function __construct()
	{
		$c = new Config();
	}
	
	public function __destruct()
	{
		//mysql_close();
	}
	
	//public protected function index();
}
?>