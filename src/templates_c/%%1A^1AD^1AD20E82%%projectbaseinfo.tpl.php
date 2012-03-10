<?php /* Smarty version 2.6.19, created on 2012-03-10 13:55:05
         compiled from projectbaseinfo.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('modifier', 'truncate', 'projectbaseinfo.tpl', 93, false),)), $this); ?>
			<div class="headline">
				<a href="javascript:void(0);" id="projectbaseinfo_toggle" class="win_block" onclick = "toggleBlock('projectbaseinfo');"></a>

				<div class="wintools">
					<div class = "progress" id = "progress" style = "display:none;">
						<img src = "templates/standard/images/symbols/loader-cal.gif" />
					</div>
				</div>
				<h2>
					<img src="./templates/standard/images/symbols/projects.png" alt="" /><?php echo $this->_config[0]['vars']['project']; ?>

				</h2>
			</div>
<div  id ="projectbaseinfo" class="block_in_wrapper">
	<h2><?php echo $this->_config[0]['vars']['editproject']; ?>
</h2>
	<form class="main" method="post" action="manageproject.php?action=edit&amp;id=<?php echo $this->_tpl_vars['project']['ID']; ?>
" <?php echo 'onsubmit="return validateCompleteForm(this,\'input_error\');"'; ?>
>
    <fieldset>

	    <div class="row4">
        <label for="name"><?php echo $this->_config[0]['vars']['name']; ?>
:</label>
        <input type="text" class="text" disabled name="name" id="name" required="1" realname="<?php echo $this->_config[0]['vars']['name']; ?>
" value = "<?php echo $this->_tpl_vars['project']['name']; ?>
" />
        <label for="status"><?php echo $this->_config[0]['vars']['status']; ?>
:</label>
        <select id = "projectStatus" name ="projectStatus">
          <?php unset($this->_sections['idx']);
$this->_sections['idx']['name'] = 'idx';
$this->_sections['idx']['loop'] = is_array($_loop=$this->_tpl_vars['projectStatus']) ? count($_loop) : max(0, (int)$_loop); unset($_loop);
$this->_sections['idx']['show'] = true;
$this->_sections['idx']['max'] = $this->_sections['idx']['loop'];
$this->_sections['idx']['step'] = 1;
$this->_sections['idx']['start'] = $this->_sections['idx']['step'] > 0 ? 0 : $this->_sections['idx']['loop']-1;
if ($this->_sections['idx']['show']) {
    $this->_sections['idx']['total'] = $this->_sections['idx']['loop'];
    if ($this->_sections['idx']['total'] == 0)
        $this->_sections['idx']['show'] = false;
} else
    $this->_sections['idx']['total'] = 0;
if ($this->_sections['idx']['show']):

            for ($this->_sections['idx']['index'] = $this->_sections['idx']['start'], $this->_sections['idx']['iteration'] = 1;
                 $this->_sections['idx']['iteration'] <= $this->_sections['idx']['total'];
                 $this->_sections['idx']['index'] += $this->_sections['idx']['step'], $this->_sections['idx']['iteration']++):
$this->_sections['idx']['rownum'] = $this->_sections['idx']['iteration'];
$this->_sections['idx']['index_prev'] = $this->_sections['idx']['index'] - $this->_sections['idx']['step'];
$this->_sections['idx']['index_next'] = $this->_sections['idx']['index'] + $this->_sections['idx']['step'];
$this->_sections['idx']['first']      = ($this->_sections['idx']['iteration'] == 1);
$this->_sections['idx']['last']       = ($this->_sections['idx']['iteration'] == $this->_sections['idx']['total']);
?>
            <?php if ($this->_tpl_vars['projectStatus'][$this->_sections['idx']['index']]['id'] == $this->_tpl_vars['project']['status']): ?>
              <option selected value = "<?php echo $this->_tpl_vars['projectStatus'][$this->_sections['idx']['index']]['id']; ?>
"><?php echo $this->_tpl_vars['projectStatus'][$this->_sections['idx']['index']]['value']; ?>
</option>
            <?php else: ?>
              <option value = "<?php echo $this->_tpl_vars['projectStatus'][$this->_sections['idx']['index']]['id']; ?>
"><?php echo $this->_tpl_vars['projectStatus'][$this->_sections['idx']['index']]['value']; ?>
</option>
            <?php endif; ?>
          <?php endfor; endif; ?>
        </select>
      </div>

	    <div class="row4">
        <label for="projectLevel"><?php echo $this->_config[0]['vars']['projectLevel']; ?>
:</label>
        <select id = "projectLevel" name ="projectLevel">
          <?php unset($this->_sections['idx']);
$this->_sections['idx']['name'] = 'idx';
$this->_sections['idx']['loop'] = is_array($_loop=$this->_tpl_vars['projectLevels']) ? count($_loop) : max(0, (int)$_loop); unset($_loop);
$this->_sections['idx']['show'] = true;
$this->_sections['idx']['max'] = $this->_sections['idx']['loop'];
$this->_sections['idx']['step'] = 1;
$this->_sections['idx']['start'] = $this->_sections['idx']['step'] > 0 ? 0 : $this->_sections['idx']['loop']-1;
if ($this->_sections['idx']['show']) {
    $this->_sections['idx']['total'] = $this->_sections['idx']['loop'];
    if ($this->_sections['idx']['total'] == 0)
        $this->_sections['idx']['show'] = false;
} else
    $this->_sections['idx']['total'] = 0;
if ($this->_sections['idx']['show']):

            for ($this->_sections['idx']['index'] = $this->_sections['idx']['start'], $this->_sections['idx']['iteration'] = 1;
                 $this->_sections['idx']['iteration'] <= $this->_sections['idx']['total'];
                 $this->_sections['idx']['index'] += $this->_sections['idx']['step'], $this->_sections['idx']['iteration']++):
$this->_sections['idx']['rownum'] = $this->_sections['idx']['iteration'];
$this->_sections['idx']['index_prev'] = $this->_sections['idx']['index'] - $this->_sections['idx']['step'];
$this->_sections['idx']['index_next'] = $this->_sections['idx']['index'] + $this->_sections['idx']['step'];
$this->_sections['idx']['first']      = ($this->_sections['idx']['iteration'] == 1);
$this->_sections['idx']['last']       = ($this->_sections['idx']['iteration'] == $this->_sections['idx']['total']);
?>
            <?php if ($this->_tpl_vars['projectLevels'][$this->_sections['idx']['index']]['id'] == $this->_tpl_vars['project']['level']): ?>
              <option selected value = "<?php echo $this->_tpl_vars['projectLevels'][$this->_sections['idx']['index']]['id']; ?>
"><?php echo $this->_tpl_vars['projectLevels'][$this->_sections['idx']['index']]['value']; ?>
</option>
            <?php else: ?>
              <option value = "<?php echo $this->_tpl_vars['projectLevels'][$this->_sections['idx']['index']]['id']; ?>
"><?php echo $this->_tpl_vars['projectLevels'][$this->_sections['idx']['index']]['value']; ?>
</option>
            <?php endif; ?>
          <?php endfor; endif; ?>
        </select>
        <label for="projectPriority"><?php echo $this->_config[0]['vars']['projectPriority']; ?>
:</label>
        <select id = "projectPriority" name ="projectPriority">
          <?php unset($this->_sections['idx']);
$this->_sections['idx']['name'] = 'idx';
$this->_sections['idx']['loop'] = is_array($_loop=$this->_tpl_vars['projectPrioritys']) ? count($_loop) : max(0, (int)$_loop); unset($_loop);
$this->_sections['idx']['show'] = true;
$this->_sections['idx']['max'] = $this->_sections['idx']['loop'];
$this->_sections['idx']['step'] = 1;
$this->_sections['idx']['start'] = $this->_sections['idx']['step'] > 0 ? 0 : $this->_sections['idx']['loop']-1;
if ($this->_sections['idx']['show']) {
    $this->_sections['idx']['total'] = $this->_sections['idx']['loop'];
    if ($this->_sections['idx']['total'] == 0)
        $this->_sections['idx']['show'] = false;
} else
    $this->_sections['idx']['total'] = 0;
if ($this->_sections['idx']['show']):

            for ($this->_sections['idx']['index'] = $this->_sections['idx']['start'], $this->_sections['idx']['iteration'] = 1;
                 $this->_sections['idx']['iteration'] <= $this->_sections['idx']['total'];
                 $this->_sections['idx']['index'] += $this->_sections['idx']['step'], $this->_sections['idx']['iteration']++):
$this->_sections['idx']['rownum'] = $this->_sections['idx']['iteration'];
$this->_sections['idx']['index_prev'] = $this->_sections['idx']['index'] - $this->_sections['idx']['step'];
$this->_sections['idx']['index_next'] = $this->_sections['idx']['index'] + $this->_sections['idx']['step'];
$this->_sections['idx']['first']      = ($this->_sections['idx']['iteration'] == 1);
$this->_sections['idx']['last']       = ($this->_sections['idx']['iteration'] == $this->_sections['idx']['total']);
?>
            <?php if ($this->_tpl_vars['projectPrioritys'][$this->_sections['idx']['index']]['id'] == $this->_tpl_vars['project']['level']): ?>
              <option selected value = "<?php echo $this->_tpl_vars['projectPrioritys'][$this->_sections['idx']['index']]['id']; ?>
"><?php echo $this->_tpl_vars['projectPrioritys'][$this->_sections['idx']['index']]['value']; ?>
</option>
            <?php else: ?>
              <option value = "<?php echo $this->_tpl_vars['projectPrioritys'][$this->_sections['idx']['index']]['id']; ?>
"><?php echo $this->_tpl_vars['projectPrioritys'][$this->_sections['idx']['index']]['value']; ?>
</option>
            <?php endif; ?>
          <?php endfor; endif; ?>
        </select>
      </div>

      <div class="row4">
        <label for="customer"><?php echo $this->_config[0]['vars']['customer']; ?>
</label>
        <input type="text" class="text" name="customer" id="customer" required="1" realname="<?php echo $this->_config[0]['vars']['customer']; ?>
" value = "<?php echo $this->_tpl_vars['project']['customer_name']; ?>
" />
        <label for="supplier"><?php echo $this->_config[0]['vars']['supplier']; ?>
</label>
        <input type="text" class="text" name="supplier" id="suppler" realname="<?php echo $this->_config[0]['vars']['supplier']; ?>
" value = "<?php echo $this->_tpl_vars['project']['supplier']; ?>
" />
      </div>


      <div class="row4">
        <label for="targetFOB"><?php echo $this->_config[0]['vars']['targetFOB']; ?>
</label>
        <input type="text" class="text number targetfob" name="targetFOB" id="targetFOB"  realname="<?php echo $this->_config[0]['vars']['targetFOB']; ?>
" value = "<?php echo $this->_tpl_vars['project']['target_fob']; ?>
" regexp="<?php echo '\\d+'; ?>
" />
        <select id = "targetFOBCurrency" name="targetFOBCurrency" class="currency">
          <?php unset($this->_sections['curr']);
$this->_sections['curr']['name'] = 'curr';
$this->_sections['curr']['loop'] = is_array($_loop=$this->_tpl_vars['currency']) ? count($_loop) : max(0, (int)$_loop); unset($_loop);
$this->_sections['curr']['show'] = true;
$this->_sections['curr']['max'] = $this->_sections['curr']['loop'];
$this->_sections['curr']['step'] = 1;
$this->_sections['curr']['start'] = $this->_sections['curr']['step'] > 0 ? 0 : $this->_sections['curr']['loop']-1;
if ($this->_sections['curr']['show']) {
    $this->_sections['curr']['total'] = $this->_sections['curr']['loop'];
    if ($this->_sections['curr']['total'] == 0)
        $this->_sections['curr']['show'] = false;
} else
    $this->_sections['curr']['total'] = 0;
if ($this->_sections['curr']['show']):

            for ($this->_sections['curr']['index'] = $this->_sections['curr']['start'], $this->_sections['curr']['iteration'] = 1;
                 $this->_sections['curr']['iteration'] <= $this->_sections['curr']['total'];
                 $this->_sections['curr']['index'] += $this->_sections['curr']['step'], $this->_sections['curr']['iteration']++):
$this->_sections['curr']['rownum'] = $this->_sections['curr']['iteration'];
$this->_sections['curr']['index_prev'] = $this->_sections['curr']['index'] - $this->_sections['curr']['step'];
$this->_sections['curr']['index_next'] = $this->_sections['curr']['index'] + $this->_sections['curr']['step'];
$this->_sections['curr']['first']      = ($this->_sections['curr']['iteration'] == 1);
$this->_sections['curr']['last']       = ($this->_sections['curr']['iteration'] == $this->_sections['curr']['total']);
?>
            <?php if ($this->_tpl_vars['currency'][$this->_sections['curr']['index']] == $this->_tpl_vars['project']['target_fob_currency']): ?>
              <option selected  value="<?php echo $this->_tpl_vars['currency'][$this->_sections['curr']['index']]; ?>
"><?php echo $this->_tpl_vars['currency'][$this->_sections['curr']['index']]; ?>
</option>
            <?php else: ?>
              <option value="<?php echo $this->_tpl_vars['currency'][$this->_sections['curr']['index']]; ?>
"><?php echo $this->_tpl_vars['currency'][$this->_sections['curr']['index']]; ?>
</option>
            <?php endif; ?>
          <?php endfor; endif; ?>
        </select>
        <label><?php echo $this->_config[0]['vars']['forecastedAnnualQuality']; ?>
</label>
          <table cellpadding=0 cellspacing=0 class="forecastedAnnualQualityAddTable">
          <tr>
            <th><?php echo $this->_config[0]['vars']['year1']; ?>
</th>
            <th><?php echo $this->_config[0]['vars']['year2']; ?>
</th>
            <th><?php echo $this->_config[0]['vars']['year3']; ?>
</th>
          </tr>
          <tr>
            <td><input type = "text" class="text forecastedAnnualQuality" name = "forecastedAnnualQuality1" id = "forecastedAnnualQuality1" value = "<?php echo $this->_tpl_vars['project']['forecasted_annual_quantity_1']; ?>
"></td>
            <td><input type = "text" class="text forecastedAnnualQuality" name = "forecastedAnnualQuality2" id = "forecastedAnnualQuality2" value = "<?php echo $this->_tpl_vars['project']['forecasted_annual_quantity_2']; ?>
"></td>
            <td><input type = "text" class="text forecastedAnnualQuality" name = "forecastedAnnualQuality3" id = "forecastedAnnualQuality3" value = "<?php echo $this->_tpl_vars['project']['forecasted_annual_quantity_3']; ?>
"></td>
          </tr>
        </table>
      </div>
   
      <div class="row4">
        <label for="start"><?php echo $this->_config[0]['vars']['startDate']; ?>
:</label>
        <input type="text" class="text" name="start"  id="start"  realname="<?php echo $this->_config[0]['vars']['startDate']; ?>
" regexp="<?php echo '\\d{4}-\\d{2}-\\d{2}'; ?>
" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['project']['start_date'])) ? $this->_run_mod_handler('truncate', true, $_tmp, 10, "") : smarty_modifier_truncate($_tmp, 10, "")); ?>
"/>
        <label for="end"><?php echo $this->_config[0]['vars']['due']; ?>
:</label>
        <input type="text" class="text" name="endDate"  id="endDate"  realname="<?php echo $this->_config[0]['vars']['due']; ?>
" regexp="<?php echo '\\d{4}-\\d{2}-\\d{2}'; ?>
" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['project']['end_date'])) ? $this->_run_mod_handler('truncate', true, $_tmp, 10, "") : smarty_modifier_truncate($_tmp, 10, "")); ?>
"/>
      </div>
      
      <div class="datepick">
        <div id = "start_date_picker" class="picker row4pickerLeft" style = "display:none;"></div>
      </div>
      <div class="datepick">
        <div id = "end_date_picker" class="picker row4pickerRight" style = "display:none;"></div>
      </div>
          
		<script type="text/javascript">
		  endCal = new calendar(<?php echo $this->_tpl_vars['theM']; ?>
,<?php echo $this->_tpl_vars['theY']; ?>
);
			endCal.dayNames = ["<?php echo $this->_config[0]['vars']['monday']; ?>
","<?php echo $this->_config[0]['vars']['tuesday']; ?>
","<?php echo $this->_config[0]['vars']['wednesday']; ?>
","<?php echo $this->_config[0]['vars']['thursday']; ?>
","<?php echo $this->_config[0]['vars']['friday']; ?>
","<?php echo $this->_config[0]['vars']['saturday']; ?>
","<?php echo $this->_config[0]['vars']['sunday']; ?>
"];
			endCal.monthNames = ["<?php echo $this->_config[0]['vars']['january']; ?>
","<?php echo $this->_config[0]['vars']['february']; ?>
","<?php echo $this->_config[0]['vars']['march']; ?>
","<?php echo $this->_config[0]['vars']['april']; ?>
","<?php echo $this->_config[0]['vars']['may']; ?>
","<?php echo $this->_config[0]['vars']['june']; ?>
","<?php echo $this->_config[0]['vars']['july']; ?>
","<?php echo $this->_config[0]['vars']['august']; ?>
","<?php echo $this->_config[0]['vars']['september']; ?>
","<?php echo $this->_config[0]['vars']['october']; ?>
","<?php echo $this->_config[0]['vars']['november']; ?>
","<?php echo $this->_config[0]['vars']['december']; ?>
"];
			endCal.relateTo = "endDate";
			endCal.dateFormat = "<?php echo $this->_tpl_vars['settings']['dateformat']; ?>
";
			endCal.getDatepicker("end_date_picker");
      
      startCal = new calendar(<?php echo $this->_tpl_vars['theM']; ?>
,<?php echo $this->_tpl_vars['theY']; ?>
);
			startCal.dayNames = ["<?php echo $this->_config[0]['vars']['monday']; ?>
","<?php echo $this->_config[0]['vars']['tuesday']; ?>
","<?php echo $this->_config[0]['vars']['wednesday']; ?>
","<?php echo $this->_config[0]['vars']['thursday']; ?>
","<?php echo $this->_config[0]['vars']['friday']; ?>
","<?php echo $this->_config[0]['vars']['saturday']; ?>
","<?php echo $this->_config[0]['vars']['sunday']; ?>
"];
			startCal.monthNames = ["<?php echo $this->_config[0]['vars']['january']; ?>
","<?php echo $this->_config[0]['vars']['february']; ?>
","<?php echo $this->_config[0]['vars']['march']; ?>
","<?php echo $this->_config[0]['vars']['april']; ?>
","<?php echo $this->_config[0]['vars']['may']; ?>
","<?php echo $this->_config[0]['vars']['june']; ?>
","<?php echo $this->_config[0]['vars']['july']; ?>
","<?php echo $this->_config[0]['vars']['august']; ?>
","<?php echo $this->_config[0]['vars']['september']; ?>
","<?php echo $this->_config[0]['vars']['october']; ?>
","<?php echo $this->_config[0]['vars']['november']; ?>
","<?php echo $this->_config[0]['vars']['december']; ?>
"];
			startCal.relateTo = "start";
			startCal.dateFormat = "<?php echo $this->_tpl_vars['settings']['dateformat']; ?>
";
			startCal.getDatepicker("start_date_picker");
		</script>      
      
      
          
      <div class="row4">
        <label for="customerLeader"><?php echo $this->_config[0]['vars']['customerLeader']; ?>
</label>
        <input type="text" class="text" name="customerLeader" id="customerLeader" required="1" realname="<?php echo $this->_config[0]['vars']['customerLeader']; ?>
" value = "<?php echo $this->_tpl_vars['project']['customer_leader']; ?>
" />
        <label for="projectLeader"><?php echo $this->_config[0]['vars']['projectLeader']; ?>
</label>
        <input type="text" class="text" name="projectLeader" id="projectLeader" realname="<?php echo $this->_config[0]['vars']['projectLeader']; ?>
" value = "<?php echo $this->_tpl_vars['project']['project_leader']; ?>
" />
      </div>
      
      <div class="row4">
        <label for="supplierLeader"><?php echo $this->_config[0]['vars']['supplierLeader']; ?>
</label>
        <input type="text" class="text" name="supplierLeader" id="supplierLeader" realname="<?php echo $this->_config[0]['vars']['supplierLeader']; ?>
" value = "<?php echo $this->_tpl_vars['project']['supplier_leader']; ?>
" />
      </div>      


    </fieldset>
  </form>
</div>