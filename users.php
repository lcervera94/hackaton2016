<?php
class student {
	var $id;
	var $name;
	var $address;
	var $email;

	public function __construct($id, $name, $address, $email) {
		$this->id = $id;
		$this->name = $name;
		$this->address = $address;
		$this->email = $emai;

	}

}

class teacher extends student {
	var $curriculum;
	var $lattes;
	var $wallet;

	public function __construct($id, $name, $address, $email, $curriculum, $lattes, $wallet) {
		parent::__construct($id, $name, $address, $email);
	}
}
?>