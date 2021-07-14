<div class="container-fluid">
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">Data Permintaan Perbaikan</h1>
                    </div>
                        <div class="card">
                            <div class="card-header">
                                Data Permintaan perbaikan
                            </div>
                            <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>No.</th>
                                            <th>UNIT</th>
                                            <th>TANGGAL PERMINTAAN</th>
                                            <th>STATUS</th>
                                            <th>ACTION</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>No.</th>
                                            <th>UNIT</th>
                                            <th>TANGGAL PERMINTAAN</th>
                                            <th>STATUS</th>
                                            <th>ACTION</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        <?php foreach($datapermintaan as $key => $rows){ ?>
                                        <tr>
                                            <td><?php $no = $key+1; echo $no;?></td>
                                            <td><?php echo $rows->nm_unit; ?></td>
                                            <td><?php echo $rows->waktu_permintaan; ?></td>
                                            <td><?php
                                                    $status = $rows->stts_lanjut; 
                                                    if($status == "0"){
                                                        echo "SELESAI";
                                                    } elseif($status == "1"){
                                                        echo "PROSES PENGERJAAN";
                                                    } elseif($status == "2"){
                                                        echo "SELESAI";
                                                    } else {
                                                        echo "ERROR";
                                                    }
                                                ?>
                                            </td>
                                            <td>
                                                <?php echo anchor('admin/admin_permintaan/'.$rows->id_permintaan, 'Lihat', 'class = "btn btn-success"'); ?> 
                                                <a href="http://" class="btn btn-danger">Delete</a>
                                            </td>
                                        </tr>
                                        <?php } ?>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        </div>
                </div>
            </div>
       