<?php /* Smarty version 2.6.19, created on 2012-02-12 15:53:27
         compiled from install1.tpl */ ?>
<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "header.tpl", 'smarty_include_vars' => array('title' => 'install','showheader' => 'no')));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>

			<div class="install" style="text-align:center;padding:5% 0;">
				<div style="text-align:left;width:500px;margin:0 auto;padding:25px 25px 15px 25px;background:white;border:1px solid;">

				<h1><?php echo $this->_config[0]['vars']['installcollabtive']; ?>
</h1>

				<div style="border-bottom:1px dashed;padding:16px 0 16px 0;">
					<form class="main" method = "get" action = "install.php">
						<fieldset>
							<div class="row"><label for = "language" style="width:210px;"><?php echo $this->_config[0]['vars']['installerlanguage']; ?>
</label>
								<select name = "locale" id = "language" onchange = "document.forms[0].submit();">
									<option value = ""><?php echo $this->_config[0]['vars']['chooseone']; ?>
</option>
									<option value = "ar"><?php echo $this->_config[0]['vars']['ar']; ?>
</option>
									<option value = "da"><?php echo $this->_config[0]['vars']['da']; ?>
</option>
									<option value = "de"><?php echo $this->_config[0]['vars']['de']; ?>
</option>
									<option value = "en"><?php echo $this->_config[0]['vars']['en']; ?>
</option>
									<option value = "es"><?php echo $this->_config[0]['vars']['es']; ?>
</option>
									<option value = "fi"><?php echo $this->_config[0]['vars']['fi']; ?>
</option>
									<option value = "fr"><?php echo $this->_config[0]['vars']['fr']; ?>
</option>
									<option value = "it"><?php echo $this->_config[0]['vars']['it']; ?>
</option>
									<option value = "nl"><?php echo $this->_config[0]['vars']['nl']; ?>
</option>
									<option value = "pl"><?php echo $this->_config[0]['vars']['pl']; ?>
</option>
									<option value = "se"><?php echo $this->_config[0]['vars']['se']; ?>
</option>
									<option value = "sr"><?php echo $this->_config[0]['vars']['sr']; ?>
</option>
								</select>
							</div>
						</fieldset>
					</form>
				</div>
				
				<div style="border-bottom:1px dashed;padding:16px 0 20px 0;">
					<h2>1. <?php echo $this->_config[0]['vars']['installerconditions']; ?>
</h2>
					
					<div class="row" style="padding-bottom:12px;">
						<i><?php echo $this->_config[0]['vars']['installerchecksconditions']; ?>
</i>
					</div>
					
					<table cellpadding="0" cellspacing="0" style="font-style:italic;line-height: 23px">
						<tr>
							<td style="width:213px;"><strong><?php echo $this->_config[0]['vars']['name']; ?>
:</strong></td>
							<td><strong><?php echo $this->_config[0]['vars']['status']; ?>
:</strong></td>
						</tr>
						<tr valign="top">
							<td>PHP 5</td>
							<?php if ($this->_tpl_vars['phpver'] >= 5.1): ?>
							<td><span style = "color:green;font-weight:bold;">OK</span></td>
							<?php else: ?>
							<td><span style = "color:red;font-weight:bold;">Not OK <br />(PHP <?php echo $this->_tpl_vars['phpver']; ?>
 - <?php echo $this->_config[0]['vars']['phpversion']; ?>
)</span></td>
							<?php endif; ?>
						</tr>
						<tr valign="top">
							<td>config.php <?php echo $this->_config[0]['vars']['iswritable']; ?>
</td>
							<?php if ($this->_tpl_vars['configfile'] >= 666): ?>
							<td><span style = "color:green;font-weight:bold;">OK </span></td>
							<?php else: ?>
							<td><span style = "color:red;font-weight:bold;">Not OK <br />(<?php echo $this->_config[0]['vars']['makefilewritable']; ?>
)</span></td>
							<?php endif; ?>
						</tr>
						<tr valign="top">
							<td>files <?php echo $this->_config[0]['vars']['iswritable']; ?>
</td>
							<?php if ($this->_tpl_vars['filesdir'] == 1): ?>
							<td><span style = "color:green;font-weight:bold;">OK </span></td>
							<?php else: ?>
							<td><span style = "color:red;font-weight:bold;">Not OK <br />(<?php echo $this->_config[0]['vars']['makedirwritable']; ?>
)</span></td>
							<?php endif; ?>
						</tr>
						<tr valign="top">
							<td>templates_c <?php echo $this->_config[0]['vars']['iswritable']; ?>
</td>
							<?php if ($this->_tpl_vars['templatesdir'] == 1): ?>
							<td><span style = "color:green;font-weight:bold;">OK </span></td>
							<?php else: ?>
							<td><span style = "color:red;font-weight:bold;">Not OK <br />(<?php echo $this->_config[0]['vars']['makedirwritable']; ?>
)</span></td>
							<?php endif; ?>
						</tr>
						<tr valign="top">
							<td><?php echo $this->_config[0]['vars']['mb_string_enabled']; ?>
</td>
							<?php if ($this->_tpl_vars['is_mbstring_enabled']): ?>
							<td><span style = "color:green;font-weight:bold;">OK </span></td>
							<?php else: ?>
							<td><span style = "color:red;font-weight:bold;">Not OK <br />(<?php echo $this->_config[0]['vars']['enable_mb_string']; ?>
)</span></td>
							<?php endif; ?>
						</tr>
					</table>
				</div>

				<?php if ($this->_tpl_vars['configfile'] >= 666 && $this->_tpl_vars['phpver'] >= 5.1 && $this->_tpl_vars['templatesdir'] == 1 && $this->_tpl_vars['filesdir'] == 1 && $this->_tpl_vars['is_mbstring_enabled']): ?>
					<div style="padding:16px 0 12px 0;">

						<h2>2. <?php echo $this->_config[0]['vars']['db']; ?>
</h2>
						<div class="row" style="padding-bottom:12px;"><i><?php echo $this->_config[0]['vars']['insertdbaccessdata']; ?>
</i></div>

						<form class="main" method = "post" action = "install.php?action=step2&locale=<?php echo $this->_tpl_vars['locale']; ?>
">
							<fieldset>
								<div class="row">
									<label for = "db_host" style="width:210px;"><?php echo $this->_config[0]['vars']['dbhost']; ?>
:</label><input type = "text" name = "db_host" id = "db_host" value = "localhost"/>
								</div>
								<div class="row">
									<label for = "db_name" style="width:210px;"><?php echo $this->_config[0]['vars']['dbname']; ?>
:</label><input type = "text" name = "db_name" id = "db_name" />
								</div>
								<div class="row">
									<label for = "db_user" style="width:210px;"><?php echo $this->_config[0]['vars']['dbuser']; ?>
:</label><input type = "text" name = "db_user" id = "db_user" />
								</div>
								<div class="row">
									<label for = "db_pass" style="width:210px;"><?php echo $this->_config[0]['vars']['dbpass']; ?>
:</label><input type = "password" name = "db_pass" id = "db_pass" />
								</div>
								<div style="border-bottom:1px dashed;height:16px;display:block;clear:both;margin-bottom:16px;"></div>
								<div class="row" style="padding-bottom:12px;">
									<i><?php echo $this->_config[0]['vars']['clickcontinue']; ?>
</i>
								</div>
								<div class="row-butn-bottom">
									<label style="width:210px;">&nbsp;</label>
									<button type="submit" onfocus="this.blur();"><?php echo $this->_config[0]['vars']['continue']; ?>
</button>
								</div>
							</fieldset>
						</form>
					</div>
				<?php else: ?>
					<br /><span style = "color: red;font-weight:bold;margin-left: 213px;"><?php echo $this->_config[0]['vars']['correctfaults']; ?>
</span>
				<?php endif; ?>
				
				<div class="content-spacer"></div>
			
			</div>
		</div> 	</body>
</html>