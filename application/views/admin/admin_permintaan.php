<div class="container-fluid">
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">Permintaan Perbaikan</h1>
                    </div>
                        <div class="card">
                            <div class="card-header">
                                Form Permintaan perbaikan IT
                            </div>
                            <div class="card-body">
                                <form action="<?php echo site_url('admin/insert_permintaan'); ?>" method="POST">
                                    <?php foreach($permintaan_user as $key=>$rows){ ?>
                                        <input type="hidden" name="id_permintaan" value="<?php echo $rows->id_permintaan; ?>">
                                    <div class="mb-3">
                                        <label for="exampleInputEmail1" class="form-label">Unit</label>
                                        <input type="text" value="<?php echo $rows->nm_unit; ?>" class="form-control" readonly>
                                    </div>
                                    <div class="mb-3">
                                        <label for="exampleInputEmail1" class="form-label">Waktu Permintaan</label>
                                        <input name="waktu_permintaan" type="text" value="<?php echo $rows->waktu_permintaan; ?>" class="form-control" readonly>
                                    </div>
                                    <div class="form-floating">
                                    <label for="exampleInputEmail1" class="form-label">Masukan keluhan</label>
                                    <textarea name="ket" class="form-control" style="height: 100px" readonly><?php echo $rows->keterangan; ?>
                                    </textarea><br>
                                    
                                    <div class="mb-3">
                                    <label for="exampleInputEmail1" class="form-label">Jenis Kerusakan</label>
                                    <select name = "kd_jp" class="form-control" aria-label="Default select example">
                                        <option value="hard">Hardware</option>
                                        <option value="jar">Jaringan</option>
                                        <option value="sim">SIMRS</option>
                                        <option value="soft">Software</option>
                                    </select>
                                    </div>
                                    </div>
                                    <br>
                                    <div style="float:right">
                                    <button type="submit" class="btn btn-primary">Tahap Lanjut</button>
                                    </div>
                                    <?php } ?>
                                </form>
                            </div>
                        </div>
                </div>
            </div>
       