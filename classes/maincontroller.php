<?php
abstract class MainController
{
	protected $params;
	protected $action;
	protected $model;
	protected $view;
	
	public function __construct($action,$params)
	{
		$this->action = $action;
		$this->params = $params;
		
	}
	
	public function executeAction()
	{
		return $this->{$this->action}();
	}
	
	/*protected function returnView($view,$fullview)
	{
		$viewloc = "views/".get_class($this)."/".$this->action.".php";
		if($fullview)
		{
			require("views/mainview.php");
		}
		else
		{
			require($viewloc);
		}
	}*/
}