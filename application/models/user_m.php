<?php

class User_m extends CI_Model{

   
    public function get_user_where($nip){
        $sql = "SELECT petugas.id_petugas,petugas.nip, pegawai.nama, pegawai.alamat, pegawai.tgl_lahir,pegawai.kd_unit,unit.nm_unit,petugas.level FROM petugas inner join pegawai inner join unit
                 on pegawai.nip = petugas.nip and unit.kd_unit = pegawai.kd_unit where petugas.nip = '$nip'";
        return $this->db->query($sql);
    }
}