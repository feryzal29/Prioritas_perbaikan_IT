<?php

class Auth_m extends CI_Model{

    public function login($nip,$pass){
        $this->db->select('*');
        $this->db->from('petugas');
        $this->db->where('nip',$nip);
        $this->db->where('password',sha1($pass));
      //  $this->db->where('pass',$post['pass']);
        $query = $this->db->get();
        return $query;
    }
}