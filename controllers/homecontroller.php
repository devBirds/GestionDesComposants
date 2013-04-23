<?php
require_once "classes/maincontroller.php";
require_once "classes/view.php";
class HomeController extends MainController
{
	public function __construct($action,$params)
	{
		parent::__construct($action,$params);
		require "models/homemodel.php";
		$this->model = new HomeModel();
	}
	
	protected function index()
	{
		$title = $this->model->getPageTitle();
		$this->view = new View(get_class($this),$this->action);
		$this->view->show($title);
	}
}
?>