<div class="container-fluid">
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">Data Permintaan Perbaikan</h1>
                    </div>
                        <div class="card">
                            <div class="card-header">
                                Form Permintaan perbaikan IT
                            </div>
                            <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>No.</th>
                                            <th>Nama Ruangan</th>
                                            <th>Nilai Yi</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>No.</th>
                                            <th>Nama Ruangan</th>
                                            <th>Nilai Yi</th>
                                            <th>Action</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        <?php
                                            foreach($permintaan_it as $key=>$rows){ 
                                            $no=$key+1; 
                                            ?>
                                        <tr>
                                            <td><?= $no; ?></td>
                                            <td><?= $rows->unit; ?></td>
                                            <td><?= $rows->nilai_yi?></td>
                                            <td><?php echo anchor('admin/admin_permintaan/', 'Detail', 'class = "btn btn-success"'); ?> </td>
                                        </tr>
                                        <?php } ?>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        </div>
                </div>
            </div>
       