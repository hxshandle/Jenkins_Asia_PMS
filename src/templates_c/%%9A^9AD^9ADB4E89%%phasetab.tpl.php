<?php /* Smarty version 2.6.19, created on 2012-03-10 14:37:55
         compiled from phasetab.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'dispstatus', 'phasetab.tpl', 18, false),array('function', 'eval', 'phasetab.tpl', 21, false),array('modifier', 'truncate', 'phasetab.tpl', 22, false),)), $this); ?>
<div class="phaseMenualBar">
  <button id="btnAddPhase"><?php echo $this->_config[0]['vars']['addphase']; ?>
</button>
</div>
<div id="addPhaseDlg" class="modalContainer">
  <?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "dlgmodal.tpl", 'smarty_include_vars' => array('templateName' => "addphase.tpl",'title' => 'add phase')));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
</div>
<div class="phaseList">
  <table style="width: 100%" cellspadding=0 cellspacing=0>
  <?php unset($this->_sections['phase']);
$this->_sections['phase']['name'] = 'phase';
$this->_sections['phase']['loop'] = is_array($_loop=$this->_tpl_vars['phaseTab']) ? count($_loop) : max(0, (int)$_loop); unset($_loop);
$this->_sections['phase']['show'] = true;
$this->_sections['phase']['max'] = $this->_sections['phase']['loop'];
$this->_sections['phase']['step'] = 1;
$this->_sections['phase']['start'] = $this->_sections['phase']['step'] > 0 ? 0 : $this->_sections['phase']['loop']-1;
if ($this->_sections['phase']['show']) {
    $this->_sections['phase']['total'] = $this->_sections['phase']['loop'];
    if ($this->_sections['phase']['total'] == 0)
        $this->_sections['phase']['show'] = false;
} else
    $this->_sections['phase']['total'] = 0;
if ($this->_sections['phase']['show']):

            for ($this->_sections['phase']['index'] = $this->_sections['phase']['start'], $this->_sections['phase']['iteration'] = 1;
                 $this->_sections['phase']['iteration'] <= $this->_sections['phase']['total'];
                 $this->_sections['phase']['index'] += $this->_sections['phase']['step'], $this->_sections['phase']['iteration']++):
$this->_sections['phase']['rownum'] = $this->_sections['phase']['iteration'];
$this->_sections['phase']['index_prev'] = $this->_sections['phase']['index'] - $this->_sections['phase']['step'];
$this->_sections['phase']['index_next'] = $this->_sections['phase']['index'] + $this->_sections['phase']['step'];
$this->_sections['phase']['first']      = ($this->_sections['phase']['iteration'] == 1);
$this->_sections['phase']['last']       = ($this->_sections['phase']['iteration'] == $this->_sections['phase']['total']);
?>
    <tr>
      <td><?php echo $this->_tpl_vars['phaseTab'][$this->_sections['phase']['index']]['name']; ?>
</td>
      <td>
        <table style="width:100%">
      <?php unset($this->_sections['deliverable']);
$this->_sections['deliverable']['name'] = 'deliverable';
$this->_sections['deliverable']['loop'] = is_array($_loop=$this->_tpl_vars['phaseTab'][$this->_sections['phase']['index']]['deliverableItems']) ? count($_loop) : max(0, (int)$_loop); unset($_loop);
$this->_sections['deliverable']['show'] = true;
$this->_sections['deliverable']['max'] = $this->_sections['deliverable']['loop'];
$this->_sections['deliverable']['step'] = 1;
$this->_sections['deliverable']['start'] = $this->_sections['deliverable']['step'] > 0 ? 0 : $this->_sections['deliverable']['loop']-1;
if ($this->_sections['deliverable']['show']) {
    $this->_sections['deliverable']['total'] = $this->_sections['deliverable']['loop'];
    if ($this->_sections['deliverable']['total'] == 0)
        $this->_sections['deliverable']['show'] = false;
} else
    $this->_sections['deliverable']['total'] = 0;
if ($this->_sections['deliverable']['show']):

            for ($this->_sections['deliverable']['index'] = $this->_sections['deliverable']['start'], $this->_sections['deliverable']['iteration'] = 1;
                 $this->_sections['deliverable']['iteration'] <= $this->_sections['deliverable']['total'];
                 $this->_sections['deliverable']['index'] += $this->_sections['deliverable']['step'], $this->_sections['deliverable']['iteration']++):
$this->_sections['deliverable']['rownum'] = $this->_sections['deliverable']['iteration'];
$this->_sections['deliverable']['index_prev'] = $this->_sections['deliverable']['index'] - $this->_sections['deliverable']['step'];
$this->_sections['deliverable']['index_next'] = $this->_sections['deliverable']['index'] + $this->_sections['deliverable']['step'];
$this->_sections['deliverable']['first']      = ($this->_sections['deliverable']['iteration'] == 1);
$this->_sections['deliverable']['last']       = ($this->_sections['deliverable']['iteration'] == $this->_sections['deliverable']['total']);
?>
        <tr>
          <td><?php echo $this->_tpl_vars['phaseTab'][$this->_sections['phase']['index']]['deliverableItems'][$this->_sections['deliverable']['index']]['name']; ?>
</td>
          <?php ob_start(); ?>
            <?php echo display_status(array('statusId' => $this->_tpl_vars['phaseTab'][$this->_sections['phase']['index']]['deliverableItems'][$this->_sections['deliverable']['index']]['status']), $this);?>

          <?php $this->_smarty_vars['capture']['st'] = ob_get_contents();  $this->assign('stname', ob_get_contents());ob_end_clean(); ?>
          
          <td><?php echo smarty_function_eval(array('var' => $this->_tpl_vars['stname']), $this);?>
</td>
          <td><?php echo ((is_array($_tmp=$this->_tpl_vars['phaseTab'][$this->_sections['phase']['index']]['deliverableItems'][$this->_sections['deliverable']['index']]['start_date'])) ? $this->_run_mod_handler('truncate', true, $_tmp, '10', "") : smarty_modifier_truncate($_tmp, '10', "")); ?>
</td>
          <td><?php echo ((is_array($_tmp=$this->_tpl_vars['phaseTab'][$this->_sections['phase']['index']]['deliverableItems'][$this->_sections['deliverable']['index']]['end_date'])) ? $this->_run_mod_handler('truncate', true, $_tmp, '10', "") : smarty_modifier_truncate($_tmp, '10', "")); ?>
</td>
        </tr>
      <?php endfor; endif; ?>
      </table>
      </td>
    </tr>
  <?php endfor; endif; ?>
  </table>
</div>

<?php echo '
<script type="text/javascript">
  if(!window.__addPhaseDlgContent){
    window.__addPhaseDlgContent=$("addPhaseDlg").innerHTML;
    $("addPhaseDlg").remove(); 
  }
  new Control.Modal("btnAddPhase",{
                                "contents":window.__addPhaseDlgContent,
                                fade:true,
                                opacity: 0.8,
                                containerClassName: \'dlgmodal\',
                                overlayClassName: \'tasksoverlay\'
                             });
          
</script>
'; ?>