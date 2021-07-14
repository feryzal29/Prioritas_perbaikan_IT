<?php

Class Fungsi{
    protected $ci;

    function __construct() {
        $this->ci =& get_instance();
    }

    function user_login(){
        $this->ci->load->model('user_m');
        $nip = $this->ci->session->userdata('nip');
        $user_data = $this->ci->user_m->get_user_where($nip)->row();
        return $user_data;
    }
}