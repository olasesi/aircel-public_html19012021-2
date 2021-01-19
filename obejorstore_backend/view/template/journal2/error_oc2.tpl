<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
<style> body > #container { min-height: 100%; } </style>
<div class="container-fluid">
  <div class="panel panel-default">
    <div class="panel-heading">
      <h3 class="panel-title"><i class="fa fa-exclamation-triangle"></i> Journal2 - <?php echo $journal_error_title; ?></h3>
    </div>
    <div class="panel-body">
      <p><?php echo $journal_error_message; ?></p>
    </div>
  </div>
</div>
<?php echo $footer; ?>