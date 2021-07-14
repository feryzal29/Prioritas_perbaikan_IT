<div class="container-fluid">
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">Permintaan Perbaikan</h1>
                    </div>
                        <div class="card">
                            <div class="card-header">
                                Form Permintaan perbaikan IT
                            </div>
                            <div class="card-body">
                                <form action="<?php echo site_url('user/input_permintaan'); ?>" method="POST">
                                    <div class="mb-3">
                                        <label for="exampleInputEmail1" class="form-label">Unit</label>
                                        <input type="text" value="<?php echo $this->fungsi->user_login()->nm_unit ?>" class="form-control" readonly>
                                    </div>
                                    <div class="form-floating">
                                    <label for="exampleInputEmail1" class="form-label">Masukan keluhan</label>
                                    <textarea name="ket" class="form-control" placeholder="Masukan keluhan anda" id="floatingTextarea2" style="height: 100px"></textarea>
                                    </div><br>
                                    <div style="float:right">
                                    <button type="submit" class="btn btn-primary">Simpan</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                </div>
            </div>
       