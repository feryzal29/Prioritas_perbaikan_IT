<?php

class Permintaan_m extends CI_Model{

    public function insert_permintaan($data){
        $this->db->insert('permintaan_user',$data);
    }

    public function get_permintaan($where){
        $this->db->select('permintaan_user.id_permintaan,petugas.id_petugas, unit.nm_unit, permintaan_user.waktu_permintaan,permintaan_user.stts_lanjut');
        $this->db->from('permintaan_user');
        $this->db->join('petugas','petugas.id_petugas = permintaan_user.id_petugas');
        $this->db->join('pegawai','pegawai.nip = petugas.nip');
        $this->db->join('unit','unit.kd_unit = pegawai.kd_unit');
        $this->db->like('petugas.id_petugas',$where);
        $query = $this->db->get();
        return $query;
	}

    public function get_permintaan_it(){
        $this->db->select('*');
        $this->db->from('v_nilai_permintaan');
        $query = $this->db->get();
        return $query;
    }

    public function get_permintaan_admin($where){
        $this->db->select('permintaan_user.id_permintaan,unit.nm_unit, petugas.id_petugas, permintaan_user.keterangan, permintaan_user.waktu_permintaan');
        $this->db->from('permintaan_user');
        $this->db->join('petugas','petugas.id_petugas = permintaan_user.id_petugas');
        $this->db->join('pegawai','pegawai.nip = petugas.nip');
        $this->db->join('unit','unit.kd_unit = pegawai.kd_unit');
        $this->db->where('permintaan_user.id_permintaan',$where);
        $query = $this->db->get();
        return $query;
    }

    public function insert_permintaan_admin($data){
        $this->db->insert('permintaan_it',$data);
    }

    public function get_perangkingan(){
        $this->db->select('*');
        $this->db->from('v_perangkingan');
        $query = $this->db->get();
        return $query;
    }
}