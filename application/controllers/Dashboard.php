<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Dashboard extends CI_Controller {

    function __construct(){
        parent::__construct();
        $this->load->helper('url');
        $this->load->helper('form');	
    }

	public function index()
	{
		check_not_login();
		$this->load->view('layout/header');
		$where = $this->fungsi->user_login()->nip;

		$this->load->view('dashboard');
		$this->load->view('layout/footer');

	}
}
