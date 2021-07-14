<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class User extends CI_Controller {
    function __construct(){
        parent::__construct();
        $this->load->helper('url');
        $this->load->helper('form');
        $this->load->model('permintaan_m');
    }

    public function permintaan(){
		$this->load->view('layout/header');
		$this->load->view('user/permintaan');
		$this->load->view('layout/footer');
    }

    public function datapermintaan(){
        $this->load->view('layout/header');
		$id_petugas = $this->fungsi->user_login()->id_petugas;
		$where = array(
			'petugas.id_petugas' => $id_petugas
		);
		$data['datapermintaan'] = $this->permintaan_m->get_permintaan($id_petugas)->result();
		$this->load->view('user/datapermintaan',$data);
		$this->load->view('layout/footer');
    }
	public function datapermintaan2(){
        $this->load->view('layout/header');
		$id_petugas = "";
		$where = array(
			'petugas.id_petugas' => $id_petugas
		);
		$data['datapermintaan'] = $this->permintaan_m->get_permintaan($id_petugas)->result();
		$this->load->view('user/datapermintaan',$data);
		$this->load->view('layout/footer');
    }

    public function input_permintaan(){
        $id_petugas = $this->fungsi->user_login()->id_petugas;
        $ket = $this->input->post('ket');
		$stts_lanjut = "1";
		$data = array(
			'id_petugas' => $id_petugas,
			'keterangan' =>$ket,
			'waktu_permintaan' => date("Y-m-d H:i:s"),
			'stts_lanjut' => $stts_lanjut
		);
		$insert = $this->permintaan_m->insert_permintaan($data);
			echo "
			<script>
			alert('Permintaan sudah dibuat');
			window.location='".base_url('user/datapermintaan')."';
			</script>
		";
    }



}
