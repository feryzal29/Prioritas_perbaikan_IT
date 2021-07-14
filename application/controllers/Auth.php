<?php

class Auth extends CI_Controller{
    function __construct(){
        parent::__construct();
        $this->load->helper('url');
        $this->load->helper('form');
        $this->load->model('auth_m');
    }

    public function login(){
        check_already_login();
       $this->load->view('auth/login');
    }

    public function login_process(){
        $nip = $this->input->post('nip');
        $pass = $this->input->post('pass');
        $query = $this->auth_m->login($nip,$pass);
        //echo $query->num_rows();
        if ($query->num_rows() > 0) {
            $rows = $query->row();
            $param = array(
                'nip' => $rows->nip,
                'level' => $rows->level
            );
            $this->session->set_userdata($param);
            
            echo "
                <script>
                alert('login berhasil');
                window.location='".base_url('dashboard')."';
                </script>
            ";
        } else {
            echo "
                <script>
                alert('Username atau password salah');
                window.location='".base_url('auth/login')."';
                </script>
            ";
        }
    }

    public function logout(){
        session_destroy();
        
        redirect('auth/login');
        
    }

}