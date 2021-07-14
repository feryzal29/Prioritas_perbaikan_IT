<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Admin extends CI_Controller {
    function __construct(){
        parent::__construct();
        $this->load->helper('url');
        $this->load->helper('form');
        $this->load->model('permintaan_m');
    }

    public function admin_permintaan(){
		$this->load->view('layout/header');
		$id_permintaan = $this->uri->segment(3); 
		$data['permintaan_user'] = $this->permintaan_m->get_permintaan_admin($id_permintaan)->result();
		$this->load->view('admin/admin_permintaan',$data);
		$this->load->view('layout/footer');
    }

	public function admin_data_permintaan(){
		$this->load->view('layout/header');
		$data['permintaan_it'] = $this->permintaan_m->get_perangkingan()->result();
		$this->load->view('admin/admin_data_permintaan',$data);
		$this->load->view('layout/footer');
	}

	public function insert_permintaan(){
		$id_permintaan = $this->input->post('id_permintaan');
		$kd_jp = $this->input->post('kd_jp');
		$waktu_permintaan = $this->input->post('waktu_permintaan');
		$stts_lanjut = "1";
		$data = array(
			'id_permintaan' => $id_permintaan,
			'kd_jp' =>$kd_jp,
			'waktu_permintaan' => $waktu_permintaan,
			'stts_lanjut' => $stts_lanjut
		);
		$insert = $this->permintaan_m->insert_permintaan_admin($data);
			echo "
			<script>
			alert('Permintaan sudah dibuat');
			window.location='".base_url('admin/admin_data_permintaan')."';
			</script>
		";
	}


}
