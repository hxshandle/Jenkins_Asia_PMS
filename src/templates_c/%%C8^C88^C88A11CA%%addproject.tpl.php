<?php /* Smarty version 2.6.19, created on 2012-03-10 13:54:06
         compiled from addproject.tpl */ ?>
<div class="block_in_wrapper">
<h2><?php echo $this->_config[0]['vars']['addproject']; ?>
</h2>

	<form class="main" method="post" action="admin.php?action=addpro" <?php echo 'onsubmit="return validateCompleteForm(this);"'; ?>
 >
	<fieldset>
		<div class="row"><label for="name"><?php echo $this->_config[0]['vars']['name']; ?>
:</label><input type="text" class="text" name="name" id="name" required="1" realname="<?php echo $this->_config[0]['vars']['name']; ?>
" /></div>
		<div class="row"><label for="desc"><?php echo $this->_config[0]['vars']['description']; ?>
:</label><div class="editor"><textarea name="desc" id="desc"  rows="3" cols="1" ></textarea></div></div>

	    <div class="clear_both_b"></div>

    <div class = "row">
      <label for="start"><?php echo $this->_config[0]['vars']['startDate']; ?>
:</label>
      <input type="text" class="text" name="start"  id="start"  realname="<?php echo $this->_config[0]['vars']['startDate']; ?>
" regexp="<?php echo '\\d{4}-\\d{2}-\\d{2}'; ?>
" />
    </div>
    <div class="datepick">
			<div id = "start_date_picker" class="picker" style = "display:none;"></div>
		</div>
    
		<div class="row">
		<label for="end"><?php echo $this->_config[0]['vars']['due']; ?>
:</label>
		<input type="text" class="text" name="end"  id="end"  realname="<?php echo $this->_config[0]['vars']['due']; ?>
" regexp="<?php echo '\\d{4}-\\d{2}-\\d{2}'; ?>
" />
		</div>

		<div class="datepick">
			<div id = "add_project" class="picker" style = "display:none;"></div>
		</div>


		<script type="text/javascript">
		  theCal = new calendar(<?php echo $this->_tpl_vars['theM']; ?>
,<?php echo $this->_tpl_vars['theY']; ?>
);
			theCal.dayNames = ["<?php echo $this->_config[0]['vars']['monday']; ?>
","<?php echo $this->_config[0]['vars']['tuesday']; ?>
","<?php echo $this->_config[0]['vars']['wednesday']; ?>
","<?php echo $this->_config[0]['vars']['thursday']; ?>
","<?php echo $this->_config[0]['vars']['friday']; ?>
","<?php echo $this->_config[0]['vars']['saturday']; ?>
","<?php echo $this->_config[0]['vars']['sunday']; ?>
"];
			theCal.monthNames = ["<?php echo $this->_config[0]['vars']['january']; ?>
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
			theCal.relateTo = "end";
			theCal.dateFormat = "<?php echo $this->_tpl_vars['settings']['dateformat']; ?>
";
			theCal.getDatepicker("add_project");
      
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
    
    <div class="row">
      <label for="projectLevel"><?php echo $this->_config[0]['vars']['projectLevel']; ?>
:</label>
      <select id ="projectLevel" name = "projectLevel">
        <option selected value="A"><?php echo $this->_config[0]['vars']['projectLevelA']; ?>
</option>
        <option value="B"><?php echo $this->_config[0]['vars']['projectLevelB']; ?>
</option>
        <option value="C"><?php echo $this->_config[0]['vars']['projectLevelC']; ?>
</option>
      </select>
		</div>
    
    <div class="row">
      <label for="projectPriority"><?php echo $this->_config[0]['vars']['projectPriority']; ?>
:</label>
      <select id ="projectPriority" name = "projectPriority">
        <option selected value="1">1</option>
        <option value="1">2</option>
        <option value="1">3</option>
        <option value="1">4</option>
        <option value="1">5</option>
      </select>
		</div>
      
    <div class="row">
      <label for="customer"><?php echo $this->_config[0]['vars']['customer']; ?>
:</label>
      <input type="text" class="text" name="customer"  id="customer"  realname="<?php echo $this->_config[0]['vars']['customer']; ?>
" />
		</div>
    <div class="row">
      <label for="supplier"><?php echo $this->_config[0]['vars']['supplier']; ?>
:</label>
      <input type="text" class="text" name="supplier"  id="supplier"  realname="<?php echo $this->_config[0]['vars']['supplier']; ?>
" />
		</div>
      
		<div class = "row">
		  <label for = "targetFOB"><?php echo $this->_config[0]['vars']['targetFOB']; ?>
:</label>
      <input type = "text" class="text" style="width:237px;text-align: right" name = "targetFOB" id = "targetFOB" />
      <select id="targetFOBCurrentcy" name="targetFOBCurrentcy" style="margin:0 0 0 10px;width:60px">
        <option selected value="RMB">RMB</option>
        <option value="USD">USD</option>
        <option value="EUD">EUD</option>
      </select>
		</div>
      
 		<div class = "row">
		  <label for = "forecastedAnnualQuality"><?php echo $this->_config[0]['vars']['forecastedAnnualQuality']; ?>
:</label>
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
          <td><input type = "text" class="text" name = "forecastedAnnualQuality1" id = "forecastedAnnualQuality1" value = "0"></td>
          <td><input type = "text" class="text" name = "forecastedAnnualQuality2" id = "forecastedAnnualQuality2" value = "0"></td>
          <td><input type = "text" class="text" name = "forecastedAnnualQuality3" id = "forecastedAnnualQuality3" value = "0"></td>
        </tr>
      </table>
		</div>
		<div class = "row">
		  <label for = "projectLeader"><?php echo $this->_config[0]['vars']['projectLeader']; ?>
:</label>
      <input type = "text" class="text" name = "projectLeader" id = "projectLeader" /><a class="add" href="#"><?php echo $this->_config[0]['vars']['add']; ?>
</a>
		</div>
		<div class = "row">
		  <label for = "customerLeader"><?php echo $this->_config[0]['vars']['customerLeader']; ?>
:</label>
		  <input type = "text" class="text" name = "customerLeader" id = "customerLeader" /><a class="add" href="#"><?php echo $this->_config[0]['vars']['add']; ?>
</a>
		</div>
		<div class = "row">
		  <label for = "supplierLeader"><?php echo $this->_config[0]['vars']['supplierLeader']; ?>
:</label>
      <input type = "text" class="text" name = "supplierLeader" id = "supplierLeader" /><a class="add" href="#"><?php echo $this->_config[0]['vars']['add']; ?>
</a>
		</div>
		<div class="row"><label><?php echo $this->_config[0]['vars']['members']; ?>
:</label>
		<div style="float:left;">
        <?php unset($this->_sections['user']);
$this->_sections['user']['name'] = 'user';
$this->_sections['user']['loop'] = is_array($_loop=$this->_tpl_vars['users']) ? count($_loop) : max(0, (int)$_loop); unset($_loop);
$this->_sections['user']['show'] = true;
$this->_sections['user']['max'] = $this->_sections['user']['loop'];
$this->_sections['user']['step'] = 1;
$this->_sections['user']['start'] = $this->_sections['user']['step'] > 0 ? 0 : $this->_sections['user']['loop']-1;
if ($this->_sections['user']['show']) {
    $this->_sections['user']['total'] = $this->_sections['user']['loop'];
    if ($this->_sections['user']['total'] == 0)
        $this->_sections['user']['show'] = false;
} else
    $this->_sections['user']['total'] = 0;
if ($this->_sections['user']['show']):

            for ($this->_sections['user']['index'] = $this->_sections['user']['start'], $this->_sections['user']['iteration'] = 1;
                 $this->_sections['user']['iteration'] <= $this->_sections['user']['total'];
                 $this->_sections['user']['index'] += $this->_sections['user']['step'], $this->_sections['user']['iteration']++):
$this->_sections['user']['rownum'] = $this->_sections['user']['iteration'];
$this->_sections['user']['index_prev'] = $this->_sections['user']['index'] - $this->_sections['user']['step'];
$this->_sections['user']['index_next'] = $this->_sections['user']['index'] + $this->_sections['user']['step'];
$this->_sections['user']['first']      = ($this->_sections['user']['iteration'] == 1);
$this->_sections['user']['last']       = ($this->_sections['user']['iteration'] == $this->_sections['user']['total']);
?>
	        <div class="row">
	        <input type="checkbox" class="checkbox" value="<?php echo $this->_tpl_vars['users'][$this->_sections['user']['index']]['ID']; ?>
" name="assignto[]" id="<?php echo $this->_tpl_vars['users'][$this->_sections['user']['index']]['ID']; ?>
"  <?php if ($this->_tpl_vars['users'][$this->_sections['user']['index']]['ID'] == $this->_tpl_vars['userid']): ?> checked="checked"<?php endif; ?> /><label for="<?php echo $this->_tpl_vars['users'][$this->_sections['user']['index']]['ID']; ?>
"><?php echo $this->_tpl_vars['users'][$this->_sections['user']['index']]['name']; ?>
</label><br />
	      	</div>
	    <?php endfor; endif; ?>
	    </div>
		</div>

		<input type="hidden" name="assignme" value="1" />

	    <div class="clear_both_b"></div>

		<div class="row-butn-bottom">
		<label>&nbsp;</label>
		<button type="submit" onfocus="this.blur();"><?php echo $this->_config[0]['vars']['addbutton']; ?>
</button>
		<?php if ($this->_tpl_vars['myprojects'] == '1'): ?>
		<button type = "reset" onclick="blindtoggle('form_addmyproject');toggleClass('add_myprojects','add-active','add');toggleClass('add_butn_myprojects','butn_link_active','butn_link');toggleClass('sm_myprojects','smooth','nosmooth');return false;" onfocus="this.blur();"><?php echo $this->_config[0]['vars']['cancel']; ?>
</button>
		<?php else: ?>
		<button type = "reset" onclick="blindtoggle('form_<?php echo $this->_tpl_vars['myprojects'][$this->_sections['project']['index']]['ID']; ?>
');return false;"><?php echo $this->_config[0]['vars']['cancel']; ?>
</button>
		<?php endif; ?>
		</div>


	</fieldset>
	</form>

</div> 