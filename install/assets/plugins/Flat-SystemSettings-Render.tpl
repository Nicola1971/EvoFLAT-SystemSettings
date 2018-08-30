/**
 * Flat-SystemSettings-Render
 *
 * Render EvoFLAT customizations and css variable
 *
 * @category plugin
 * @version 1.4.1 PL
 * @author Nicola Lambathakis (www.tattoocms.it) 
 * @internal @properties 
 * @internal @events OnManagerLoginFormPrerender,OnManagerMainFrameHeaderHTMLBlock,OnManagerTopPrerender
 * @internal @modx_category Admin
 * @internal @installset base, sample
 * @internal    @disabled 0
 * @lastupdate  29-08-2018
 * @documentation Requirements: This plugin requires Evolution 1.4.3 or later and EvoFLAT manager theme
 * @documentation https://github.com/Nicola1971/EvoFLAT-SystemSettings/
 * @reportissues https://github.com/Nicola1971/EvoFLAT-SystemSettings/issues
 */

global $modx;
$manager_theme = $modx->config['manager_theme'];

if($manager_theme == "EvoFLAT") {
if($modx->config['flt_show_evo_logo'] == "0") {
$hideLogo ='
#mainMenu #nav #site::before  {display:none!important;}
#mainMenu #nav #site a { margin-left: 0px!important; }';
}
if($modx->config['flt_show_login_logo'] == "0") {
$hideLoginLogo = 'div.form-group--logo {display:none!important;}'; 
}
if($modx->config['flt_show_login_bg'] == "0") {
$hideLoginbg = 'body,
        body.lightness,
        body.light,
        body.dark,
        body.darkness {
          background-image: none !important;'; 
}
if($modx->config['flt_show_loader'] == "0") {
$hideLoader = '#mainloader{display:none !important;}'; 
}
if ($modx->config['flt_login_clogo'] !== null) {
$logocustom = '<a class="logo" href="../" title="'.$sitename.'">
					<img src="../'.$modx->config['flt_login_clogo'].'" alt="'.$sitename.'" id="logocustom" />
				</a>';
}
if ($modx->config['flt_custom_head_styles'] !== null) {
$custom_head_styles = $modx->config['flt_custom_head_styles'];
}
if ($modx->config['flt_custom_login_styles'] !== null) {
$custom_login_styles = $modx->config['flt_custom_login_styles'];
}
//vars
if($modx->config['flt_main-color'] !== '') { 
$main_color = '--main-color:'.$modx->config['flt_main-color'].';
'; 
} else { $main_color = ''; }	

if($modx->config['flt_main-menu-color'] !== '' ) { 
$menu_color = '--main-menu-color:'.$modx->config['flt_main-menu-color'].';'; 
} 
else
if($modx->config['flt_main-menu-color'] == '' && $modx->config['flt_main-color'] !== '') { 
$menu_color = '--main-menu-color:'.$modx->config['flt_main-color'].';'; 
}
else { $menu_color = ''; }
	
//treee
if($modx->config['flt_item-tree-color'] !== '') { 
$tree_color = '--item-tree-color:'.$modx->config['flt_item-tree-color'].';
'; 
} else { $tree_color = ''; }
	
if($modx->config['flt_dark-item-tree-color'] !== '') { 
$tree_dark_color = '--dark-item-tree-color:'.$modx->config['flt_dark-item-tree-color'].';
'; 
} else { $tree_dark_color = ''; }
	
//tabs	
if($modx->config['flt_selected-tabs-color'] !== '') { 
$light_tabs = '--selected-tabs-color:'.$modx->config['flt_selected-tabs-color'].';
'; 
}
else
if($modx->config['flt_selected-tabs-color'] == '' && $modx->config['flt_main-color'] !== '') { 
$light_tabs = '--selected-tabs-color:'.$modx->config['flt_main-color'].';'; 
}
else { $light_tabs = ''; }
	
if($modx->config['flt_dark-selected-tabs-color'] !== '') { 
$dark_tabs = '--dark-selected-tabs-color:'.$modx->config['flt_dark-selected-tabs-color'].';
'; 
}
else
if($modx->config['flt_dark-selected-tabs-color'] == '' && $modx->config['flt_main-color'] !== '') { 
$dark_tabs = '--dark-selected-tabs-color:'.$modx->config['flt_main-color'].';'; 
}
else { $dark_tabs = ''; }
	
//Links
if($modx->config['flt_links-color'] !== '') { 
$links_color = '--links-color:'.$modx->config['flt_links-color'].';
'; 
} else { $links_color = ''; }
	
if($modx->config['flt_links-hover-color'] !== '') { 
$links_hover_color = '--links-hover-color:'.$modx->config['flt_links-hover-color'].';
'; 
} else { $links_hover_color = ''; }

if($modx->config['flt_dark-links-hover-color'] !== '') { 
$dark_links_hover_color = '--dark-links-hover-color:'.$modx->config['flt_dark-links-hover-color'].';
'; 
} else { $dark_links_hover_color = ''; }

//fonts
if($modx->config['flt_main_font'] !== '') { 
$gfont = explode(":", $modx->config['flt_main_font']);
$googlefont = str_replace("+", " ", $gfont[0]);
$main_font = '--main-font:'.$googlefont.';';  
$importFont ='<link href="https://fonts.googleapis.com/css?family='.$modx->config['flt_main_font'].'" rel="stylesheet">';
} else { $main_font = ''; }
if($modx->config['flt_main_font_size'] == '' or $modx->config['flt_main_font_size'] == null)
{ $main_font_size = '--main-font-size: 0.8125rem'; }
else { 
$main_font_size = '--main-font-size:'.$modx->config['flt_main_font_size'].'rem;'; 
} 

if($modx->config['flt_menu_font_size'] == '' or $modx->config['flt_menu_font_size'] == null)
{ $menu_font_size = '--main-menu-font-size: 0.9rem'; }
else { 
$menu_font_size = '--main-menu-font-size:'.$modx->config['flt_menu_font_size'].'rem;'; 
} 

if($modx->config['flt_dark_menu'] == '1' ) { 
$dark_menu = '.dark #mainMenu { background-color: #272c33 !important;}'; 
} 
//end vars
$e = &$modx->Event;
switch($e->name) {
case 'OnManagerTopPrerender':	
$MainFlatSettingsOutput = '
<!--- OnManagerTopPrerender --->
'.$importFont.'
<style>
body {
  '.$links_color.'
  '.$links_hover_color.'
  '.$dark_links_hover_color.'
  '.$main_font.'
  '.$main_font_size.'
  '.$menu_color.'
  '.$menu_font_size.'
  '.$main_color.'
/* tree */
  '.$tree_color.'
  '.$tree_dark_color.'
  /* tabs */
  '.$light_tabs.'
  '.$dark_tabs.'
  }
'.$hideLogo.' 
'.$hideLoader.'
'.$custom_head_styles.'
'.$dark_menu.'
</style>
';
break;
case 'OnManagerMainFrameHeaderHTMLBlock':
$MainFlatSettingsOutput = '
<!--- OnManagerMainFrameHeaderHTMLBlock --->
'.$importFont.'
<style>
body {
  '.$links_color.'
  '.$links_hover_color.'
  '.$dark_links_hover_color.'
  '.$main_font.'
  '.$main_font_size.'
  '.$menu_color.'
  '.$main_color.'
/* tree */
  '.$tree_color.'
  '.$tree_dark_color.'
 /* tabs */
  '.$light_tabs.'
  '.$dark_tabs.'
  }
'.$custom_head_styles.'
</style>
';
break;
case 'OnManagerLoginFormPrerender':
$LoginFlatSettingsOutput = '
'.$importFont.'
<style>
body {
  '.$main_font.'
  '.$main_font_size.'
  '.$menu_color.'
  '.$main_color.'
  }
'.$hideLoginLogo.'
'.$hideLoginbg.'
'.$custom_login_styles.'
</style>
';
    break;
}
$e->output($MainFlatSettingsOutput.$LoginFlatSettingsOutput);
return;
}