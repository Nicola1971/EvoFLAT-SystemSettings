/**
 * Flat-SystemSettings
 *
 * Add EvoFLAT theme settings in system settings
 *
 * @category plugin
 * @version 1.4.2 PL
 * @author Nicola Lambathakis (www.tattoocms.it) 
 * @internal @properties &pname=Settings Tab Title;text;EvoFlat Theme;
 * @internal @events OnMiscSettingsRender
 * @internal @modx_category Admin
 * @internal @installset base, sample
 * @internal    @disabled 0
 * @lastupdate  06-09-2018
 * @documentation Requirements: This plugin requires Evolution 1.4.3 or later and EvoFLAT manager theme
 * @documentation https://github.com/Nicola1971/EvoFLAT-SystemSettings/
 * @reportissues https://github.com/Nicola1971/EvoFLAT-SystemSettings/issues
 */

// get language
global $_lang;
$manager_theme = $modx->config['manager_theme'];
if($manager_theme == "EvoFLAT") {
$version = '1.4.1';
$e = &$modx->Event;
$output = "";
$settings='EvoFLAT Theme Main Color~flt_main-color||Menu Color~flt_main-menu-color||Item Tree Color~flt_item-tree-color||Dark Item Tree Color~flt_dark-item-tree-color||Selected tab color~flt_selected-tabs-color||Dark selected tabs color~flt_dark-selected-tabs-color||Links color~flt_links-color||Links hover color~flt_links-hover-color||Dark links hover color~flt_dark-links-hover-color';
if ($e->name == 'OnMiscSettingsRender'){
$settingsArr = !empty($settings) ? explode('||',$settings) : array('Example custom setting~custom_st_example');
$tabname = !empty($pname) ? $pname : 'EvoFlat Theme';
$output .= '</td></tr></table></div>';
$output .= '
<style>
.hidden {display:none;}
table.themeSettings {width:98%; margin:auto;}
table.themeSettings th{height:20px}
.displaytextsize, .displaymenusize {display:inline-block;vertical-align:top;padding: -4px 0 3px 8px ; margin-left:8px;}
.pull-right {display:block;float:right;}
</style>
<script type="text/javascript">
					var lastImageCtrl;
    				var lastFileCtrl;
					function OpenServerBrowser(url, width, height) {
						var iLeft = (screen.width - width) / 2;
						var iTop = (screen.height - height) / 2;
						var sOptions = "toolbar=no,status=no,resizable=yes,dependent=yes";
						sOptions += ",width=" + width;
						sOptions += ",height=" + height;
						sOptions += ",left=" + iLeft;
						sOptions += ",top=" + iTop;
						var oWindow = window.open(url, "FCKBrowseWindow", sOptions);
					}
					function BrowseServer(ctrl) {
						lastImageCtrl = ctrl;
						var w = screen.width * 0.7;
						var h = screen.height * 0.7;
						OpenServerBrowser("'.$modx->config['MODX_MANAGER_URL'].'media/browser/'.$modx->config['which_browser'].'/browser.php?Type=images", w, h);
					}
						
						function BrowseFileServer(ctrl) {
							lastFileCtrl = ctrl;
							var w = screen.width * 0.7;
							var h = screen.height * 0.7;
							OpenServerBrowser("'.$modx->config['MODX_MANAGER_URL'].'media/browser/'.$modx->config['which_browser'].'/browser.php?Type=files", w, h);
						}
						
						function SetUrl(url, width, height, alt){
        					if(lastFileCtrl) {
        					var c = document.getElementById(lastFileCtrl);
        					if(c) c.value = url;
        					lastFileCtrl = \'\';
        					} else if(lastImageCtrl) {
        					var c = document.getElementById(lastImageCtrl);
       						if(c) c.value = url;
        					lastImageCtrl = \'\';
        					} else {
        					return;
        					}
    						}
							</script>';

$output .= '<div style="display: block;" class="tab-page" id="tabPage4b"><h2 class="tab"><i class="fa fa-paint-brush" aria-hidden="true"></i> '.$tabname.' </h2><script type="text/javascript">tpSettings.addTabPage( document.getElementById( "tabPage4b" ) );</script>';
$output .= '<div class="tab-pane" id="tab-pane-1"><div class="tab-page"><h2 class="tab"><i class="fa fa-paint-brush" aria-hidden="true"></i> Colors</h2>';
$output .= '<table class="themeSettings" border="0" cellpadding="3" cellspacing="0"><thead><th width="25%"></th><th></th></thead><tbody>';
foreach($settingsArr as $key => $st_row){
    $st_label_arr = explode('~',$st_row);
    $custom_st_label = trim($st_label_arr[0]);
    $custom_st_name = isset($st_label_arr[1]) ? $st_label_arr[1] : 'custom_st';
    $custom_st_value = isset($st_label_arr[1]) && isset($modx->config[$st_label_arr[1]]) ? trim($modx->config[$st_label_arr[1]]) : '';
    $output .= '<tr><td class="warning" nowrap="">'.htmlspecialchars($custom_st_label).' <br/><small>[('.$custom_st_name.')]  <span class="text-muted">saved color: '.$custom_st_value.'</span></small></td>
        <td><input class="setting_color" id="'.$custom_st_name.'" type="text" class="startEmpty" value="'.$custom_st_value.'" name="'.$custom_st_name.'" onchange="documentDirty=true;"></td></tr><tr><td colspan="2"><div class="split"/></td></tr>';
}
$output .= '</tbody></table></div>';
if ($modx->config['flt_dark_menu'] == '0' or $modx->config['flt_dark_menu'] == '') {
$yes_dark_menu = '';
$no_dark_menu = 'checked="checked"';
}
else
 {
$yes_dark_menu = 'checked="checked"';
$no_dark_menu = '';
}
	
if ($modx->config['flt_show_evo_logo'] == '1' or $modx->config['flt_show_evo_logo'] == '') {
$yes_show_logo = 'checked="checked"';
$no_show_logo = '';
}
else
 {
$yes_show_logo = '';
$no_show_logo = 'checked="checked"';
}
if ($modx->config['flt_show_login_logo'] == '1' or $modx->config['flt_show_login_logo'] == '') {
$yes_show_Loginlogo = 'checked="checked"';
$no_show_Loginlogo = '';
}
else
 {
$yes_show_Loginlogo = '';
$no_show_Loginlogo = 'checked="checked"';
}


if ($modx->config['flt_show_login_bg'] == '1' or $modx->config['flt_show_login_bg'] == '') {
$yes_show_Loginbg = 'checked="checked"';
$no_show_Loginbg = '';
}
else
 {
$yes_show_Loginbg = '';
$no_show_Loginbg = 'checked="checked"';
}
	
if ($modx->config['flt_loginbox_style'] == 'dark_loginbox' or $modx->config['flt_loginbox_style'] == '') {
$dark_loginbox = 'checked="checked"';
$light_loginbox = '';
}
else
{
$light_loginbox = 'checked="checked"';
$dark_loginbox = '';
}
	
if ($modx->config['flt_show_loader'] == '1' or $modx->config['flt_show_loader'] == '') {
$yes_show_loader = 'checked="checked"';
$no_show_loader = '';
}
else
 {
$yes_show_loader = '';
$no_show_loader = 'checked="checked"';
}	
if ($modx->config['flt_main_font_size'] == '' || $modx->config['flt_main_font_size'] == null) {
$main_font_val = '0.8125';
}
else
 {
$main_font_val = ($modx->config['flt_main_font_size']);
}
	
if ($modx->config['flt_menu_font_size'] == ''|| $modx->config['flt_menu_font_size'] == null) {
$menu_font_val = '0.9';
}
else
 {
$menu_font_val = ($modx->config['flt_menu_font_size']);
}
if($modx->config['flt_loginbox_opacity'] == '' or $modx->config['flt_loginbox_opacity'] == null)
{ $loginbox_opacity = '0.85'; }
else { 
$loginbox_opacity = ''.htmlspecialchars($modx->config['flt_loginbox_opacity']).''; 
} 
	
$output .= '<div class="tab-page"><h2 class="tab"><i class="fa fa-font" aria-hidden="true"></i> Fonts</h2>';
$output .= '<table class="themeSettings" border="0" cellpadding="3" cellspacing="0"><thead><th width="25%"></th><th></th></thead><tbody>';
$output .= '<tr>
            <td nowrap class="warning">Font Family<br>
                <small>[(flt_main_font)] <span class="text-muted">Saved Font: '.htmlspecialchars($modx->config['flt_main_font']).'</span></small>
            </td>
            <td>
                <label><input id="flt_main_font" name="flt_main_font" type="text" value="'.htmlspecialchars($modx->config['flt_main_font']).'" onchange="documentDirty=true;"></label>
            </td>
        </tr>
        <tr>
            <td width="200">&nbsp;</td>
            <td class="comment gfonttype">Change default Manager font and use Google Fonts in EvoFLAT</td>
        </tr>
        <tr><td colspan="2"><div class="split"/></td></tr>
		';
$output .= '<tr>
            <td nowrap class="warning">Font Size<br>
                <small>[(flt_main_font_size)] <span class="text-muted">Saved Size: '.$main_font_val.'</span></small>
            </td>
            <td>
                <label><input class="rangeMainFonts" type="range" min="0.8125" value="'.$main_font_val.'" max="1.2" step="0.0001" id="flt_main_font_size" name="flt_main_font_size"  onchange="documentDirty=true;"></label><span class="displaytextsize">'.htmlspecialchars($modx->config['flt_main_font_size']).'rem</span>
            </td>
        </tr>
        <tr>
            <td width="200">&nbsp;</td>
            <td class="comment gfontsize">Change the Font Size in EvoFLAT</td>
        </tr>
        <tr><td colspan="2"><div class="split"/></td></tr>
		';
$output .= '<tr>
            <td nowrap class="warning">Menu Font Size<br>
                <small>[(flt_menu_font_size)] <span class="text-muted">Saved Size: '.$menu_font_val.'</span></small>
            </td>
            <td>
                <label><input class="rangeMenuFonts" type="range" min="0.9" value="'.$menu_font_val.'" max="2.8" step="0.0001" id="flt_menu_font_size" name="flt_menu_font_size" onchange="documentDirty=true;"></label><span class="displaymenusize">'.htmlspecialchars($modx->config['flt_menu_font_size']).'rem</span>
            </td>
        </tr>
        <tr>
            <td width="200">&nbsp;</td>
            <td class="comment mfontsize">Change the Menu Font Size (optional)</td>
        </tr>
        <tr><td colspan="2"><div class="split"/></td></tr>
		';
$output .= '</tbody></table></div>';	
$output .= '<div class="tab-page"><h2 class="tab"><i class="fa fa-sliders" aria-hidden="true"></i> Advanced Settings</h2>';
$output .= '<table class="themeSettings" border="0" cellpadding="3" cellspacing="0"><thead><th width="25%"></th><th></th></thead><tbody>';
$output .= '<tr>
            <td nowrap class="warning">Show Preloader<br>
                <small>[(flt_show_loader)]</small>
            </td>
            <td>
                <label><input type="radio" name="flt_show_loader" value="1" '.$yes_show_loader.' />
                    '.$_lang['yes'].'</label>
                <br />
                <label><input type="radio" name="flt_show_loader" value="0" '.$no_show_loader.' />
                    '.$_lang['no'].'
                </label>
            </td>
        </tr>
        <tr>
            <td width="200">&nbsp;</td>
            <td class="comment">Show Preloader animation</td>
        </tr>
        <tr><td colspan="2"><div class="split"/></td></tr>
		';
$output .= '<tr>
            <td nowrap class="warning">Dark Menu for Dark Theme<br>
                <small>[(flt_dark_menu)]</small>
            </td>
            <td>
                <label><input type="radio" name="flt_dark_menu" value="1" '.$yes_dark_menu.' />
                    '.$_lang['yes'].'</label>
                <br />
                <label><input type="radio" name="flt_dark_menu" value="0" '.$no_dark_menu.' />
                    '.$_lang['no'].'
                </label>
            </td>
        </tr>
        <tr>
            <td width="200">&nbsp;</td>
            <td class="comment">Show a Dark Menu, instead the colored menu, when you switch to the Dark Theme</td>
        </tr>
        <tr><td colspan="2"><div class="split"/></td></tr>
		';
$output .= '<tr>
            <td nowrap class="warning">Show Header Logo<br>
                <small>[(flt_show_evo_logo)]</small>
            </td>
            <td>
                <label><input type="radio" name="flt_show_evo_logo" value="1" '.$yes_show_logo.' />
                    '.$_lang['yes'].'</label>
                <br />
                <label><input type="radio" name="flt_show_evo_logo" value="0" '.$no_show_logo.' />
                    '.$_lang['no'].'
                </label>
            </td>
        </tr>
        <tr>
            <td width="200">&nbsp;</td>
            <td class="comment">Show EVOLUTION Header Menu Logo</td>
        </tr>
        <tr><td colspan="2"><div class="split"/></td></tr>
		';
$output .= '<tr>
            <td nowrap class="warning">Show Login Logo<br>
                <small>[(flt_show_login_logo)]</small>
            </td>
            <td>
                <label><input type="radio" name="flt_show_login_logo" value="1" '.$yes_show_Loginlogo.' />
                    '.$_lang['yes'].'</label>
                <br />
                <label><input type="radio" name="flt_show_login_logo" value="0" '.$no_show_Loginlogo.' />
                    '.$_lang['no'].'
                </label>
            </td>
        </tr>
        <tr>
            <td width="200">&nbsp;</td>
            <td class="comment">Show Logo in the Login form</td>
        </tr>
        <tr><td colspan="2"><div class="split"/></td></tr>';
	
$output .= '<tr>
            <td nowrap class="warning">Show Login Background Image<br>
                <small>[(flt_show_login_bg)]</small>
            </td>
            <td>
                <label><input type="radio" name="flt_show_login_bg" value="1" '.$yes_show_Loginbg.' />
                    '.$_lang['yes'].'</label>
                <br />
                <label><input type="radio" name="flt_show_login_bg" value="0" '.$no_show_Loginbg.' />
                    '.$_lang['no'].'
                </label>
            </td>
        </tr>
        <tr>
            <td width="200">&nbsp;</td>
            <td class="comment">Show a backgroung image in the Login page<br/> </td>
        </tr>
        <tr><td colspan="2"><div class="split"/></td></tr>';

$output .= '<tr>
            <td nowrap class="warning">Loginbox Style<br>
                <small>[(flt_loginbox_style)]</small>
            </td>
            <td>
                <label><input type="radio" name="flt_loginbox_style" value="dark_loginbox" '.$dark_loginbox.' />
                    Dark</label>
                <br />
                <label><input type="radio" name="flt_loginbox_style" value="light_loginbox" '.$light_loginbox.' />
                    Light
                </label>
            </td>
        </tr>
        <tr>
            <td width="200">&nbsp;</td>
            <td class="comment">Select loginbox style.</td>
        </tr>
        <tr><td colspan="2"><div class="split"/></td></tr>
		';
$output .= '<tr>
            <td nowrap class="warning">Loginbox Opacity<br>
                <small>[(flt_loginbox_opacity)] <span class="text-muted">Saved Opacity: '.$loginbox_opacity.'</span></small>
            </td>
            <td>
                <label><input class="rangeloginboxopacity" type="range" min="0.00" value="'.$loginbox_opacity.'" max="1.0" step="0.05" id="flt_loginbox_opacity" name="flt_loginbox_opacity" onchange="documentDirty=true;"></label> Opacity: <span class="displayloginboxopacity">'.$loginbox_opacity.'</span>
            </td>
        </tr>
        <tr>
            <td width="200">&nbsp;</td>
            <td class="comment mLoginOpacity">Change the Loginbox Opacity (optional)</td>
        </tr>
        <tr><td colspan="2"><div class="split"/></td></tr>
		';
$output .= '</tbody></table></div>';
$output .= '<div class="tab-page"><h2 class="tab"><i class="fa fa-css3" aria-hidden="true"></i> Custom Styles</h2>';
$output .= '<table class="themeSettings" border="0" cellpadding="3" cellspacing="0"><thead><th width="25%"></th><th></th></thead><tbody>';
$output .= '<tr>
            <td nowrap class="warning">Custom Manager styles<br>
                <small>[(flt_custom_head_styles)]</small>
            </td>
            <td>
                <textarea rows="10" id="flt_custom_head_styles" name="flt_custom_head_styles">'.$modx->config['flt_custom_head_styles'].'</textarea>
		            </td>
        </tr>
		
        <tr>
            <td width="200">&nbsp;</td>
            <td class="comment">Add your custom styles to change EvoFlat Manager appearance </td>
        </tr>
        <tr><td colspan="2"><div class="split"/></td></tr>';
$output .= '<tr>
            <td nowrap class="warning">Custom Login styles<br>
                <small>[(flt_custom_login_styles)]</small>
            </td>
            <td>
                <textarea rows="10" id="flt_custom_login_styles" name="flt_custom_login_styles">'.$modx->config['flt_custom_login_styles'].'</textarea>
		            </td>
        </tr>
		
        <tr>
            <td width="200">&nbsp;</td>
            <td class="comment">Add your custom styles to change EvoFlat Login page appearance </td>
        </tr>
        <tr><td colspan="2"><div class="split"/></td></tr>';
$output .= '</tbody></table></div></div>
<div class="pull-right" style="margin-right:12px;">
<span class="text-muted small"><i class="fa fa-paint-brush"></i> EvoFLAT Settings v.'.$version.'</span>
  </div>';
$cssOutput .='
<link rel="stylesheet" type="text/css" href="../assets/plugins/flatsystem/fontselect/styles/fontselect-alternate.css" />
<link rel="stylesheet" href="media/style/common/spectrum/spectrum.css" />
<link rel="stylesheet" type="text/css" href="media/style/'.$modx->config['manager_theme'].'/css/color.switcher.css" />
<script src="../assets/plugins/flatsystem/fontselect/jquery.fontselect.js"></script>
<script src="media/script/spectrum/spectrum.evo.min.js" type="text/javascript"></script>
<script>
jQuery(document).ready(function($) {
$(\'.setting_color\').spectrum({
 containerClassName: \'bgmPicker\',
 cancelText: "CANCEL",
 chooseText: "CHOOSE",
 preferredFormat: "hex3",
 showPalette: true,
 showInitial: true,
 showInput: true,
 showSelectionPalette: true, 
 allowEmpty: true,
 palette: [
        ["#0e80cb", "#0275d8", "#1792fd", "#272c33", "#3c434e", "#383f48", "#404040", "#DFDFDF", "#FAFAFA", "#fff"],
 	    ["#741B47","#134F5C","#16A085","#8E44AD","#34495E","#D35400","#C0392B","#b45f06","#351c75","#007C49"]
    ]
});
      $(function(){
        $(\'#flt_main_font\').fontselect().change(function(){
         documentDirty=true;
          var font = $(this).val().replace(/\+/g, \' \');
          font = font.split(\':\');
          $(\'.gfonttype\').css(\'font-family\', font[0]);
		  $(\'.gfontsize\').css(\'font-family\', font[0]);
		  $(\'.mfontsize\').css(\'font-family\', font[0]);
        });
      });
	$(\'input.rangeMainFonts\').on(\'change\', function () {
    var v = $(this).val();
	$(\'.gfontsize\').css(\'font-size\', v + \'rem\');
	$(\'.gfonttype\').css(\'font-size\', v + \'rem\');
    $(\'.displaytextsize\').html(v + \'rem\');
});

	$(\'input.rangeMenuFonts\').on(\'change\', function () {
    var v = $(this).val();
	$(\'.mfontsize\').css(\'font-size\', v + \'rem\');
    $(\'.displaymenusize\').html(v + \'rem\');
});
	$(\'input.rangeloginboxopacity\').on(\'change\', function () {
    var v = $(this).val();
    $(\'.displayloginboxopacity\').html(v);
});
});
</script>';
}
$e->output($cssOutput.$output);
}