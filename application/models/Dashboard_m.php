<?php

class Surat_m extends CI_Model{

   

    public function get_user($no_surat3){
        $this->db->select('*');
        $this->db->from('forward_disposisi');
        $this->db->where($no_surat3);
        $query = $this->db->get();
        return $query;
    }

}
