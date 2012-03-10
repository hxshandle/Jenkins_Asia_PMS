<?php /* Smarty version 2.6.19, created on 2012-03-10 13:55:05
         compiled from projectdetailstabs.tpl */ ?>
<div class="headline">
  <a href="javascript:void(0);" id="projectdetailstab_toggle" class="win_block" onclick = "toggleBlock('projectdetailstab');"></a>

  <div class="wintools">
    <div class = "progress" id = "progress" style = "display:none;">
      <img src = "templates/standard/images/symbols/loader-cal.gif" />
    </div>
  </div>
  <h2>
    <img src="./templates/standard/images/symbols/projects.png" alt="" /><?php echo $this->_config[0]['vars']['projectdetails']; ?>

  </h2>
</div>
  
<div  id ="projectdetailstab" class="block_in_wrapper">
  
  <ul id="tabs_example_one" class="subsection_tabs">  
    <li class="tab"><a href="#tabphase"><?php echo $this->_config[0]['vars']['phase']; ?>
</a></li>  
    <li class="tab"><a href="#tabfinance"><?php echo $this->_config[0]['vars']['finance']; ?>
</a></li>
    <li class="tab"><a href="#tabsample"><?php echo $this->_config[0]['vars']['sample']; ?>
</a></li>
    <li class="tab"><a href="#tabteammember"><?php echo $this->_config[0]['vars']['teammember']; ?>
</a></li>
    <li class="tab"><a href="#tabtask"><?php echo $this->_config[0]['vars']['task']; ?>
</a></li>
    <li class="tab"><a href="#tabecn"><?php echo $this->_config[0]['vars']['ecn']; ?>
</a></li>
    <li class="tab"><a href="#tabquality"><?php echo $this->_config[0]['vars']['quality']; ?>
</a></li>
    <li class="tab"><a href="#taborder"><?php echo $this->_config[0]['vars']['order']; ?>
</a></li>
  </ul>
  
  <div id="tabphase"><?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "phasetab.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?></div>
  <div id="tabfinance"><?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "financetab.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?></div>
  <div id="tabsample"><?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "sampletab.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?></div>
  <div id="tabteammember"><?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "teammembertab.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?></div>
  <div id="tabtask"><?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "tasktab.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?></div>
  <div id="tabecn"><?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "ecntab.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?></div>
  <div id="tabquality"><?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "qualitytab.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?></div>
  <div id="taborder"><?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "ordertab.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?></div>
  
  
</div>
  
<script type="text/javascript">
  var __tabs=new Control.Tabs('tabs_example_one');
  __tabs.first();
  
</script>