package;


import haxe.Timer;
import haxe.Unserializer;
import lime.app.Future;
import lime.app.Preloader;
import lime.app.Promise;
import lime.audio.AudioSource;
import lime.audio.openal.AL;
import lime.audio.AudioBuffer;
import lime.graphics.Image;
import lime.text.Font;
import lime.utils.ByteArray;
import lime.utils.UInt8Array;
import lime.Assets;

#if sys
import sys.FileSystem;
#end

#if (js && html5)
import lime.net.URLLoader;
import lime.net.URLRequest;
#elseif flash
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Loader;
import flash.events.Event;
import flash.events.IOErrorEvent;
import flash.events.ProgressEvent;
import flash.media.Sound;
import flash.net.URLLoader;
import flash.net.URLRequest;
#end


class DefaultAssetLibrary extends AssetLibrary {
	
	
	public var className (default, null) = new Map <String, Dynamic> ();
	public var path (default, null) = new Map <String, String> ();
	public var type (default, null) = new Map <String, AssetType> ();
	
	private var lastModified:Float;
	private var timer:Timer;
	
	
	public function new () {
		
		super ();
		
		#if (openfl && !flash)
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		openfl.text.Font.registerFont (__ASSET__OPENFL__fonts_oxygen_bold_ttf);
		
		
		
		
		openfl.text.Font.registerFont (__ASSET__OPENFL__fonts_oxygen_ttf);
		
		
		
		
		
		
		
		
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_fonts_opensans_bold_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_fonts_opensans_italic_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_fonts_opensans_regular_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_fonts_opensans_semibold_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_fonts_roboto_bold_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_fonts_roboto_italic_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_fonts_roboto_medium_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_fonts_roboto_regular_ttf);
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		openfl.text.Font.registerFont (__ASSET__OPENFL__fonts_opensans_bold_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__fonts_opensans_italic_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__fonts_opensans_regular_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__fonts_opensans_semibold_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__fonts_roboto_bold_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__fonts_roboto_italic_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__fonts_roboto_medium_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__fonts_roboto_regular_ttf);
		
		
		
		
		
		
		
		#end
		
		#if flash
		
		className.set ("styles/default/circle.png", __ASSET__styles_default_circle_png);
		type.set ("styles/default/circle.png", AssetType.IMAGE);
		className.set ("styles/default/collapse.png", __ASSET__styles_default_collapse_png);
		type.set ("styles/default/collapse.png", AssetType.IMAGE);
		className.set ("styles/default/cross.png", __ASSET__styles_default_cross_png);
		type.set ("styles/default/cross.png", AssetType.IMAGE);
		className.set ("styles/default/expand.png", __ASSET__styles_default_expand_png);
		type.set ("styles/default/expand.png", AssetType.IMAGE);
		className.set ("styles/default/up_down.png", __ASSET__styles_default_up_down_png);
		type.set ("styles/default/up_down.png", AssetType.IMAGE);
		className.set ("styles/gradient/arrow_down.png", __ASSET__styles_gradient_arrow_down_png);
		type.set ("styles/gradient/arrow_down.png", AssetType.IMAGE);
		className.set ("styles/gradient/arrow_down_dark.png", __ASSET__styles_gradient_arrow_down_dark_png);
		type.set ("styles/gradient/arrow_down_dark.png", AssetType.IMAGE);
		className.set ("styles/gradient/arrow_down_disabled.png", __ASSET__styles_gradient_arrow_down_disabled_png);
		type.set ("styles/gradient/arrow_down_disabled.png", AssetType.IMAGE);
		className.set ("styles/gradient/arrow_left.png", __ASSET__styles_gradient_arrow_left_png);
		type.set ("styles/gradient/arrow_left.png", AssetType.IMAGE);
		className.set ("styles/gradient/arrow_left_disabled.png", __ASSET__styles_gradient_arrow_left_disabled_png);
		type.set ("styles/gradient/arrow_left_disabled.png", AssetType.IMAGE);
		className.set ("styles/gradient/arrow_right.png", __ASSET__styles_gradient_arrow_right_png);
		type.set ("styles/gradient/arrow_right.png", AssetType.IMAGE);
		className.set ("styles/gradient/arrow_right2.png", __ASSET__styles_gradient_arrow_right2_png);
		type.set ("styles/gradient/arrow_right2.png", AssetType.IMAGE);
		className.set ("styles/gradient/arrow_right_dark.png", __ASSET__styles_gradient_arrow_right_dark_png);
		type.set ("styles/gradient/arrow_right_dark.png", AssetType.IMAGE);
		className.set ("styles/gradient/arrow_right_disabled.png", __ASSET__styles_gradient_arrow_right_disabled_png);
		type.set ("styles/gradient/arrow_right_disabled.png", AssetType.IMAGE);
		className.set ("styles/gradient/arrow_up.png", __ASSET__styles_gradient_arrow_up_png);
		type.set ("styles/gradient/arrow_up.png", AssetType.IMAGE);
		className.set ("styles/gradient/arrow_up_disabled.png", __ASSET__styles_gradient_arrow_up_disabled_png);
		type.set ("styles/gradient/arrow_up_disabled.png", AssetType.IMAGE);
		className.set ("styles/gradient/circle_dark.png", __ASSET__styles_gradient_circle_dark_png);
		type.set ("styles/gradient/circle_dark.png", AssetType.IMAGE);
		className.set ("styles/gradient/cross_dark.png", __ASSET__styles_gradient_cross_dark_png);
		type.set ("styles/gradient/cross_dark.png", AssetType.IMAGE);
		className.set ("styles/gradient/cross_dark_disabled.png", __ASSET__styles_gradient_cross_dark_disabled_png);
		type.set ("styles/gradient/cross_dark_disabled.png", AssetType.IMAGE);
		className.set ("styles/gradient/cross_light_small.png", __ASSET__styles_gradient_cross_light_small_png);
		type.set ("styles/gradient/cross_light_small.png", AssetType.IMAGE);
		className.set ("styles/gradient/gradient.css", __ASSET__styles_gradient_gradient_css);
		type.set ("styles/gradient/gradient.css", AssetType.TEXT);
		className.set ("styles/gradient/gradient.min.css", __ASSET__styles_gradient_gradient_min_css);
		type.set ("styles/gradient/gradient.min.css", AssetType.TEXT);
		className.set ("styles/gradient/gradient_mobile.css", __ASSET__styles_gradient_gradient_mobile_css);
		type.set ("styles/gradient/gradient_mobile.css", AssetType.TEXT);
		className.set ("styles/gradient/gradient_mobile.min.css", __ASSET__styles_gradient_gradient_mobile_min_css);
		type.set ("styles/gradient/gradient_mobile.min.css", AssetType.TEXT);
		className.set ("styles/gradient/gripper_horizontal.png", __ASSET__styles_gradient_gripper_horizontal_png);
		type.set ("styles/gradient/gripper_horizontal.png", AssetType.IMAGE);
		className.set ("styles/gradient/gripper_horizontal_disabled.png", __ASSET__styles_gradient_gripper_horizontal_disabled_png);
		type.set ("styles/gradient/gripper_horizontal_disabled.png", AssetType.IMAGE);
		className.set ("styles/gradient/gripper_vertical.png", __ASSET__styles_gradient_gripper_vertical_png);
		type.set ("styles/gradient/gripper_vertical.png", AssetType.IMAGE);
		className.set ("styles/gradient/gripper_vertical_disabled.png", __ASSET__styles_gradient_gripper_vertical_disabled_png);
		type.set ("styles/gradient/gripper_vertical_disabled.png", AssetType.IMAGE);
		className.set ("styles/gradient/hsplitter_gripper.png", __ASSET__styles_gradient_hsplitter_gripper_png);
		type.set ("styles/gradient/hsplitter_gripper.png", AssetType.IMAGE);
		className.set ("styles/gradient/vsplitter_gripper.png", __ASSET__styles_gradient_vsplitter_gripper_png);
		type.set ("styles/gradient/vsplitter_gripper.png", AssetType.IMAGE);
		className.set ("styles/windows/accordion.css", __ASSET__styles_windows_accordion_css);
		type.set ("styles/windows/accordion.css", AssetType.TEXT);
		className.set ("styles/windows/accordion.min.css", __ASSET__styles_windows_accordion_min_css);
		type.set ("styles/windows/accordion.min.css", AssetType.TEXT);
		className.set ("styles/windows/button.png", __ASSET__styles_windows_button_png);
		type.set ("styles/windows/button.png", AssetType.IMAGE);
		className.set ("styles/windows/buttons.css", __ASSET__styles_windows_buttons_css);
		type.set ("styles/windows/buttons.css", AssetType.TEXT);
		className.set ("styles/windows/buttons.min.css", __ASSET__styles_windows_buttons_min_css);
		type.set ("styles/windows/buttons.min.css", AssetType.TEXT);
		className.set ("styles/windows/calendar.css", __ASSET__styles_windows_calendar_css);
		type.set ("styles/windows/calendar.css", AssetType.TEXT);
		className.set ("styles/windows/checkbox.png", __ASSET__styles_windows_checkbox_png);
		type.set ("styles/windows/checkbox.png", AssetType.IMAGE);
		className.set ("styles/windows/container.png", __ASSET__styles_windows_container_png);
		type.set ("styles/windows/container.png", AssetType.IMAGE);
		className.set ("styles/windows/glyphs/down_arrow.png", __ASSET__styles_windows_glyphs_down_arrow_png);
		type.set ("styles/windows/glyphs/down_arrow.png", AssetType.IMAGE);
		className.set ("styles/windows/glyphs/hscroll_thumb_gripper_down.png", __ASSET__styles_windows_glyphs_hscroll_thumb_gripper_down_png);
		type.set ("styles/windows/glyphs/hscroll_thumb_gripper_down.png", AssetType.IMAGE);
		className.set ("styles/windows/glyphs/hscroll_thumb_gripper_over.png", __ASSET__styles_windows_glyphs_hscroll_thumb_gripper_over_png);
		type.set ("styles/windows/glyphs/hscroll_thumb_gripper_over.png", AssetType.IMAGE);
		className.set ("styles/windows/glyphs/hscroll_thumb_gripper_up.png", __ASSET__styles_windows_glyphs_hscroll_thumb_gripper_up_png);
		type.set ("styles/windows/glyphs/hscroll_thumb_gripper_up.png", AssetType.IMAGE);
		className.set ("styles/windows/glyphs/left_arrow.png", __ASSET__styles_windows_glyphs_left_arrow_png);
		type.set ("styles/windows/glyphs/left_arrow.png", AssetType.IMAGE);
		className.set ("styles/windows/glyphs/right_arrow.png", __ASSET__styles_windows_glyphs_right_arrow_png);
		type.set ("styles/windows/glyphs/right_arrow.png", AssetType.IMAGE);
		className.set ("styles/windows/glyphs/up_arrow.png", __ASSET__styles_windows_glyphs_up_arrow_png);
		type.set ("styles/windows/glyphs/up_arrow.png", AssetType.IMAGE);
		className.set ("styles/windows/glyphs/vscroll_thumb_gripper_down.png", __ASSET__styles_windows_glyphs_vscroll_thumb_gripper_down_png);
		type.set ("styles/windows/glyphs/vscroll_thumb_gripper_down.png", AssetType.IMAGE);
		className.set ("styles/windows/glyphs/vscroll_thumb_gripper_over.png", __ASSET__styles_windows_glyphs_vscroll_thumb_gripper_over_png);
		type.set ("styles/windows/glyphs/vscroll_thumb_gripper_over.png", AssetType.IMAGE);
		className.set ("styles/windows/glyphs/vscroll_thumb_gripper_up.png", __ASSET__styles_windows_glyphs_vscroll_thumb_gripper_up_png);
		type.set ("styles/windows/glyphs/vscroll_thumb_gripper_up.png", AssetType.IMAGE);
		className.set ("styles/windows/hprogress.png", __ASSET__styles_windows_hprogress_png);
		type.set ("styles/windows/hprogress.png", AssetType.IMAGE);
		className.set ("styles/windows/hscroll.png", __ASSET__styles_windows_hscroll_png);
		type.set ("styles/windows/hscroll.png", AssetType.IMAGE);
		className.set ("styles/windows/listview.css", __ASSET__styles_windows_listview_css);
		type.set ("styles/windows/listview.css", AssetType.TEXT);
		className.set ("styles/windows/listview.min.css", __ASSET__styles_windows_listview_min_css);
		type.set ("styles/windows/listview.min.css", AssetType.TEXT);
		className.set ("styles/windows/listview.png", __ASSET__styles_windows_listview_png);
		type.set ("styles/windows/listview.png", AssetType.IMAGE);
		className.set ("styles/windows/menus.css", __ASSET__styles_windows_menus_css);
		type.set ("styles/windows/menus.css", AssetType.TEXT);
		className.set ("styles/windows/optionbox.png", __ASSET__styles_windows_optionbox_png);
		type.set ("styles/windows/optionbox.png", AssetType.IMAGE);
		className.set ("styles/windows/popup.png", __ASSET__styles_windows_popup_png);
		type.set ("styles/windows/popup.png", AssetType.IMAGE);
		className.set ("styles/windows/popups.css", __ASSET__styles_windows_popups_css);
		type.set ("styles/windows/popups.css", AssetType.TEXT);
		className.set ("styles/windows/rtf.css", __ASSET__styles_windows_rtf_css);
		type.set ("styles/windows/rtf.css", AssetType.TEXT);
		className.set ("styles/windows/scrolls.css", __ASSET__styles_windows_scrolls_css);
		type.set ("styles/windows/scrolls.css", AssetType.TEXT);
		className.set ("styles/windows/scrolls.min.css", __ASSET__styles_windows_scrolls_min_css);
		type.set ("styles/windows/scrolls.min.css", AssetType.TEXT);
		className.set ("styles/windows/sliders.css", __ASSET__styles_windows_sliders_css);
		type.set ("styles/windows/sliders.css", AssetType.TEXT);
		className.set ("styles/windows/tab.png", __ASSET__styles_windows_tab_png);
		type.set ("styles/windows/tab.png", AssetType.IMAGE);
		className.set ("styles/windows/tabs.css", __ASSET__styles_windows_tabs_css);
		type.set ("styles/windows/tabs.css", AssetType.TEXT);
		className.set ("styles/windows/textinput.png", __ASSET__styles_windows_textinput_png);
		type.set ("styles/windows/textinput.png", AssetType.IMAGE);
		className.set ("styles/windows/vprogress.png", __ASSET__styles_windows_vprogress_png);
		type.set ("styles/windows/vprogress.png", AssetType.IMAGE);
		className.set ("styles/windows/vscroll.png", __ASSET__styles_windows_vscroll_png);
		type.set ("styles/windows/vscroll.png", AssetType.IMAGE);
		className.set ("styles/windows/windows.css", __ASSET__styles_windows_windows_css);
		type.set ("styles/windows/windows.css", AssetType.TEXT);
		className.set ("fonts/Oxygen-Bold.eot", __ASSET__fonts_oxygen_bold_eot);
		type.set ("fonts/Oxygen-Bold.eot", AssetType.BINARY);
		className.set ("fonts/Oxygen-Bold.svg", __ASSET__fonts_oxygen_bold_svg);
		type.set ("fonts/Oxygen-Bold.svg", AssetType.TEXT);
		className.set ("fonts/Oxygen-Bold.ttf", __ASSET__fonts_oxygen_bold_ttf);
		type.set ("fonts/Oxygen-Bold.ttf", AssetType.FONT);
		className.set ("fonts/Oxygen-Bold.woff", __ASSET__fonts_oxygen_bold_woff);
		type.set ("fonts/Oxygen-Bold.woff", AssetType.BINARY);
		className.set ("fonts/Oxygen-Bold.woff2", __ASSET__fonts_oxygen_bold_woff2);
		type.set ("fonts/Oxygen-Bold.woff2", AssetType.BINARY);
		className.set ("fonts/Oxygen.eot", __ASSET__fonts_oxygen_eot);
		type.set ("fonts/Oxygen.eot", AssetType.BINARY);
		className.set ("fonts/Oxygen.svg", __ASSET__fonts_oxygen_svg);
		type.set ("fonts/Oxygen.svg", AssetType.TEXT);
		className.set ("fonts/Oxygen.ttf", __ASSET__fonts_oxygen_ttf);
		type.set ("fonts/Oxygen.ttf", AssetType.FONT);
		className.set ("fonts/Oxygen.woff", __ASSET__fonts_oxygen_woff);
		type.set ("fonts/Oxygen.woff", AssetType.BINARY);
		className.set ("fonts/Oxygen.woff2", __ASSET__fonts_oxygen_woff2);
		type.set ("fonts/Oxygen.woff2", AssetType.BINARY);
		className.set ("assets/css/desktop.css", __ASSET__assets_css_desktop_css);
		type.set ("assets/css/desktop.css", AssetType.TEXT);
		className.set ("assets/css/main.css", __ASSET__assets_css_main_css);
		type.set ("assets/css/main.css", AssetType.TEXT);
		className.set ("assets/css/main.min.css", __ASSET__assets_css_main_min_css);
		type.set ("assets/css/main.min.css", AssetType.TEXT);
		className.set ("assets/css/mobile.css", __ASSET__assets_css_mobile_css);
		type.set ("assets/css/mobile.css", AssetType.TEXT);
		className.set ("assets/css/mobile.min.css", __ASSET__assets_css_mobile_min_css);
		type.set ("assets/css/mobile.min.css", AssetType.TEXT);
		className.set ("assets/examples/eg1/manifest.xml", __ASSET__assets_examples_eg1_manifest_xml);
		type.set ("assets/examples/eg1/manifest.xml", AssetType.TEXT);
		className.set ("assets/fonts/OpenSans-Bold.ttf", __ASSET__assets_fonts_opensans_bold_ttf);
		type.set ("assets/fonts/OpenSans-Bold.ttf", AssetType.FONT);
		className.set ("assets/fonts/OpenSans-Italic.ttf", __ASSET__assets_fonts_opensans_italic_ttf);
		type.set ("assets/fonts/OpenSans-Italic.ttf", AssetType.FONT);
		className.set ("assets/fonts/OpenSans-Regular.ttf", __ASSET__assets_fonts_opensans_regular_ttf);
		type.set ("assets/fonts/OpenSans-Regular.ttf", AssetType.FONT);
		className.set ("assets/fonts/OpenSans-Semibold.ttf", __ASSET__assets_fonts_opensans_semibold_ttf);
		type.set ("assets/fonts/OpenSans-Semibold.ttf", AssetType.FONT);
		className.set ("assets/fonts/Roboto-Bold.ttf", __ASSET__assets_fonts_roboto_bold_ttf);
		type.set ("assets/fonts/Roboto-Bold.ttf", AssetType.FONT);
		className.set ("assets/fonts/Roboto-Italic.ttf", __ASSET__assets_fonts_roboto_italic_ttf);
		type.set ("assets/fonts/Roboto-Italic.ttf", AssetType.FONT);
		className.set ("assets/fonts/Roboto-Medium.ttf", __ASSET__assets_fonts_roboto_medium_ttf);
		type.set ("assets/fonts/Roboto-Medium.ttf", AssetType.FONT);
		className.set ("assets/fonts/Roboto-Regular.ttf", __ASSET__assets_fonts_roboto_regular_ttf);
		type.set ("assets/fonts/Roboto-Regular.ttf", AssetType.FONT);
		className.set ("assets/haxeui.png", __ASSET__assets_haxeui_png);
		type.set ("assets/haxeui.png", AssetType.IMAGE);
		className.set ("assets/haxe_ui_plain.svg", __ASSET__assets_haxe_ui_plain_svg);
		type.set ("assets/haxe_ui_plain.svg", AssetType.TEXT);
		className.set ("assets/icons/back_32.png", __ASSET__assets_icons_back_32_png);
		type.set ("assets/icons/back_32.png", AssetType.IMAGE);
		className.set ("assets/icons/forward_32.png", __ASSET__assets_icons_forward_32_png);
		type.set ("assets/icons/forward_32.png", AssetType.IMAGE);
		className.set ("assets/icons/menu_32.png", __ASSET__assets_icons_menu_32_png);
		type.set ("assets/icons/menu_32.png", AssetType.IMAGE);
		className.set ("assets/img/a.png", __ASSET__assets_img_a_png);
		type.set ("assets/img/a.png", AssetType.IMAGE);
		className.set ("assets/img/folder_32.png", __ASSET__assets_img_folder_32_png);
		type.set ("assets/img/folder_32.png", AssetType.IMAGE);
		className.set ("assets/ui/about.xml", __ASSET__assets_ui_about_xml);
		type.set ("assets/ui/about.xml", AssetType.TEXT);
		className.set ("assets/ui/list.xml", __ASSET__assets_ui_list_xml);
		type.set ("assets/ui/list.xml", AssetType.TEXT);
		className.set ("assets/ui/main.xml", __ASSET__assets_ui_main_xml);
		type.set ("assets/ui/main.xml", AssetType.TEXT);
		className.set ("assets/ui/menu.xml", __ASSET__assets_ui_menu_xml);
		type.set ("assets/ui/menu.xml", AssetType.TEXT);
		className.set ("assets/ui/start.xml", __ASSET__assets_ui_start_xml);
		type.set ("assets/ui/start.xml", AssetType.TEXT);
		className.set ("assets/ui/update.xml", __ASSET__assets_ui_update_xml);
		type.set ("assets/ui/update.xml", AssetType.TEXT);
		className.set ("assets/ui/wizard.xml", __ASSET__assets_ui_wizard_xml);
		type.set ("assets/ui/wizard.xml", AssetType.TEXT);
		className.set ("css/desktop.css", __ASSET__css_desktop_css);
		type.set ("css/desktop.css", AssetType.TEXT);
		className.set ("css/main.css", __ASSET__css_main_css);
		type.set ("css/main.css", AssetType.TEXT);
		className.set ("css/main.min.css", __ASSET__css_main_min_css);
		type.set ("css/main.min.css", AssetType.TEXT);
		className.set ("css/mobile.css", __ASSET__css_mobile_css);
		type.set ("css/mobile.css", AssetType.TEXT);
		className.set ("css/mobile.min.css", __ASSET__css_mobile_min_css);
		type.set ("css/mobile.min.css", AssetType.TEXT);
		className.set ("ui/about.xml", __ASSET__ui_about_xml);
		type.set ("ui/about.xml", AssetType.TEXT);
		className.set ("ui/list.xml", __ASSET__ui_list_xml);
		type.set ("ui/list.xml", AssetType.TEXT);
		className.set ("ui/main.xml", __ASSET__ui_main_xml);
		type.set ("ui/main.xml", AssetType.TEXT);
		className.set ("ui/menu.xml", __ASSET__ui_menu_xml);
		type.set ("ui/menu.xml", AssetType.TEXT);
		className.set ("ui/start.xml", __ASSET__ui_start_xml);
		type.set ("ui/start.xml", AssetType.TEXT);
		className.set ("ui/update.xml", __ASSET__ui_update_xml);
		type.set ("ui/update.xml", AssetType.TEXT);
		className.set ("ui/wizard.xml", __ASSET__ui_wizard_xml);
		type.set ("ui/wizard.xml", AssetType.TEXT);
		className.set ("fonts/OpenSans-Bold.ttf", __ASSET__fonts_opensans_bold_ttf);
		type.set ("fonts/OpenSans-Bold.ttf", AssetType.FONT);
		className.set ("fonts/OpenSans-Italic.ttf", __ASSET__fonts_opensans_italic_ttf);
		type.set ("fonts/OpenSans-Italic.ttf", AssetType.FONT);
		className.set ("fonts/OpenSans-Regular.ttf", __ASSET__fonts_opensans_regular_ttf);
		type.set ("fonts/OpenSans-Regular.ttf", AssetType.FONT);
		className.set ("fonts/OpenSans-Semibold.ttf", __ASSET__fonts_opensans_semibold_ttf);
		type.set ("fonts/OpenSans-Semibold.ttf", AssetType.FONT);
		className.set ("fonts/Roboto-Bold.ttf", __ASSET__fonts_roboto_bold_ttf);
		type.set ("fonts/Roboto-Bold.ttf", AssetType.FONT);
		className.set ("fonts/Roboto-Italic.ttf", __ASSET__fonts_roboto_italic_ttf);
		type.set ("fonts/Roboto-Italic.ttf", AssetType.FONT);
		className.set ("fonts/Roboto-Medium.ttf", __ASSET__fonts_roboto_medium_ttf);
		type.set ("fonts/Roboto-Medium.ttf", AssetType.FONT);
		className.set ("fonts/Roboto-Regular.ttf", __ASSET__fonts_roboto_regular_ttf);
		type.set ("fonts/Roboto-Regular.ttf", AssetType.FONT);
		className.set ("icons/back_32.png", __ASSET__icons_back_32_png);
		type.set ("icons/back_32.png", AssetType.IMAGE);
		className.set ("icons/forward_32.png", __ASSET__icons_forward_32_png);
		type.set ("icons/forward_32.png", AssetType.IMAGE);
		className.set ("icons/menu_32.png", __ASSET__icons_menu_32_png);
		type.set ("icons/menu_32.png", AssetType.IMAGE);
		className.set ("img/a.png", __ASSET__img_a_png);
		type.set ("img/a.png", AssetType.IMAGE);
		className.set ("img/folder_32.png", __ASSET__img_folder_32_png);
		type.set ("img/folder_32.png", AssetType.IMAGE);
		className.set ("examples/eg1/manifest.xml", __ASSET__examples_eg1_manifest_xml);
		type.set ("examples/eg1/manifest.xml", AssetType.TEXT);
		
		
		#elseif html5
		
		var id;
		id = "styles/default/circle.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/default/collapse.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/default/cross.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/default/expand.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/default/up_down.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/gradient/arrow_down.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/gradient/arrow_down_dark.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/gradient/arrow_down_disabled.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/gradient/arrow_left.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/gradient/arrow_left_disabled.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/gradient/arrow_right.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/gradient/arrow_right2.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/gradient/arrow_right_dark.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/gradient/arrow_right_disabled.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/gradient/arrow_up.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/gradient/arrow_up_disabled.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/gradient/circle_dark.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/gradient/cross_dark.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/gradient/cross_dark_disabled.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/gradient/cross_light_small.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/gradient/gradient.css";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "styles/gradient/gradient.min.css";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "styles/gradient/gradient_mobile.css";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "styles/gradient/gradient_mobile.min.css";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "styles/gradient/gripper_horizontal.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/gradient/gripper_horizontal_disabled.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/gradient/gripper_vertical.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/gradient/gripper_vertical_disabled.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/gradient/hsplitter_gripper.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/gradient/vsplitter_gripper.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/windows/accordion.css";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "styles/windows/accordion.min.css";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "styles/windows/button.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/windows/buttons.css";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "styles/windows/buttons.min.css";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "styles/windows/calendar.css";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "styles/windows/checkbox.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/windows/container.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/windows/glyphs/down_arrow.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/windows/glyphs/hscroll_thumb_gripper_down.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/windows/glyphs/hscroll_thumb_gripper_over.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/windows/glyphs/hscroll_thumb_gripper_up.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/windows/glyphs/left_arrow.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/windows/glyphs/right_arrow.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/windows/glyphs/up_arrow.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/windows/glyphs/vscroll_thumb_gripper_down.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/windows/glyphs/vscroll_thumb_gripper_over.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/windows/glyphs/vscroll_thumb_gripper_up.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/windows/hprogress.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/windows/hscroll.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/windows/listview.css";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "styles/windows/listview.min.css";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "styles/windows/listview.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/windows/menus.css";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "styles/windows/optionbox.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/windows/popup.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/windows/popups.css";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "styles/windows/rtf.css";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "styles/windows/scrolls.css";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "styles/windows/scrolls.min.css";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "styles/windows/sliders.css";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "styles/windows/tab.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/windows/tabs.css";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "styles/windows/textinput.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/windows/vprogress.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/windows/vscroll.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/windows/windows.css";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "fonts/Oxygen-Bold.eot";
		path.set (id, id);
		
		type.set (id, AssetType.BINARY);
		id = "fonts/Oxygen-Bold.svg";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "fonts/Oxygen-Bold.ttf";
		className.set (id, __ASSET__fonts_oxygen_bold_ttf);
		
		type.set (id, AssetType.FONT);
		id = "fonts/Oxygen-Bold.woff";
		path.set (id, id);
		
		type.set (id, AssetType.BINARY);
		id = "fonts/Oxygen-Bold.woff2";
		path.set (id, id);
		
		type.set (id, AssetType.BINARY);
		id = "fonts/Oxygen.eot";
		path.set (id, id);
		
		type.set (id, AssetType.BINARY);
		id = "fonts/Oxygen.svg";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "fonts/Oxygen.ttf";
		className.set (id, __ASSET__fonts_oxygen_ttf);
		
		type.set (id, AssetType.FONT);
		id = "fonts/Oxygen.woff";
		path.set (id, id);
		
		type.set (id, AssetType.BINARY);
		id = "fonts/Oxygen.woff2";
		path.set (id, id);
		
		type.set (id, AssetType.BINARY);
		id = "assets/css/desktop.css";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/css/main.css";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/css/main.min.css";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/css/mobile.css";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/css/mobile.min.css";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/examples/eg1/manifest.xml";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/fonts/OpenSans-Bold.ttf";
		className.set (id, __ASSET__assets_fonts_opensans_bold_ttf);
		
		type.set (id, AssetType.FONT);
		id = "assets/fonts/OpenSans-Italic.ttf";
		className.set (id, __ASSET__assets_fonts_opensans_italic_ttf);
		
		type.set (id, AssetType.FONT);
		id = "assets/fonts/OpenSans-Regular.ttf";
		className.set (id, __ASSET__assets_fonts_opensans_regular_ttf);
		
		type.set (id, AssetType.FONT);
		id = "assets/fonts/OpenSans-Semibold.ttf";
		className.set (id, __ASSET__assets_fonts_opensans_semibold_ttf);
		
		type.set (id, AssetType.FONT);
		id = "assets/fonts/Roboto-Bold.ttf";
		className.set (id, __ASSET__assets_fonts_roboto_bold_ttf);
		
		type.set (id, AssetType.FONT);
		id = "assets/fonts/Roboto-Italic.ttf";
		className.set (id, __ASSET__assets_fonts_roboto_italic_ttf);
		
		type.set (id, AssetType.FONT);
		id = "assets/fonts/Roboto-Medium.ttf";
		className.set (id, __ASSET__assets_fonts_roboto_medium_ttf);
		
		type.set (id, AssetType.FONT);
		id = "assets/fonts/Roboto-Regular.ttf";
		className.set (id, __ASSET__assets_fonts_roboto_regular_ttf);
		
		type.set (id, AssetType.FONT);
		id = "assets/haxeui.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/haxe_ui_plain.svg";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/icons/back_32.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/icons/forward_32.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/icons/menu_32.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/img/a.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/img/folder_32.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/ui/about.xml";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/ui/list.xml";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/ui/main.xml";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/ui/menu.xml";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/ui/start.xml";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/ui/update.xml";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/ui/wizard.xml";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "css/desktop.css";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "css/main.css";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "css/main.min.css";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "css/mobile.css";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "css/mobile.min.css";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "ui/about.xml";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "ui/list.xml";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "ui/main.xml";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "ui/menu.xml";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "ui/start.xml";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "ui/update.xml";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "ui/wizard.xml";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "fonts/OpenSans-Bold.ttf";
		className.set (id, __ASSET__fonts_opensans_bold_ttf);
		
		type.set (id, AssetType.FONT);
		id = "fonts/OpenSans-Italic.ttf";
		className.set (id, __ASSET__fonts_opensans_italic_ttf);
		
		type.set (id, AssetType.FONT);
		id = "fonts/OpenSans-Regular.ttf";
		className.set (id, __ASSET__fonts_opensans_regular_ttf);
		
		type.set (id, AssetType.FONT);
		id = "fonts/OpenSans-Semibold.ttf";
		className.set (id, __ASSET__fonts_opensans_semibold_ttf);
		
		type.set (id, AssetType.FONT);
		id = "fonts/Roboto-Bold.ttf";
		className.set (id, __ASSET__fonts_roboto_bold_ttf);
		
		type.set (id, AssetType.FONT);
		id = "fonts/Roboto-Italic.ttf";
		className.set (id, __ASSET__fonts_roboto_italic_ttf);
		
		type.set (id, AssetType.FONT);
		id = "fonts/Roboto-Medium.ttf";
		className.set (id, __ASSET__fonts_roboto_medium_ttf);
		
		type.set (id, AssetType.FONT);
		id = "fonts/Roboto-Regular.ttf";
		className.set (id, __ASSET__fonts_roboto_regular_ttf);
		
		type.set (id, AssetType.FONT);
		id = "icons/back_32.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "icons/forward_32.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "icons/menu_32.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/a.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/folder_32.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "examples/eg1/manifest.xml";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		
		
		var assetsPrefix = null;
		if (ApplicationMain.config != null && Reflect.hasField (ApplicationMain.config, "assetsPrefix")) {
			assetsPrefix = ApplicationMain.config.assetsPrefix;
		}
		if (assetsPrefix != null) {
			for (k in path.keys()) {
				path.set(k, assetsPrefix + path[k]);
			}
		}
		
		#else
		
		#if (windows || mac || linux)
		
		var useManifest = false;
		
		className.set ("styles/default/circle.png", __ASSET__styles_default_circle_png);
		type.set ("styles/default/circle.png", AssetType.IMAGE);
		
		className.set ("styles/default/collapse.png", __ASSET__styles_default_collapse_png);
		type.set ("styles/default/collapse.png", AssetType.IMAGE);
		
		className.set ("styles/default/cross.png", __ASSET__styles_default_cross_png);
		type.set ("styles/default/cross.png", AssetType.IMAGE);
		
		className.set ("styles/default/expand.png", __ASSET__styles_default_expand_png);
		type.set ("styles/default/expand.png", AssetType.IMAGE);
		
		className.set ("styles/default/up_down.png", __ASSET__styles_default_up_down_png);
		type.set ("styles/default/up_down.png", AssetType.IMAGE);
		
		className.set ("styles/gradient/arrow_down.png", __ASSET__styles_gradient_arrow_down_png);
		type.set ("styles/gradient/arrow_down.png", AssetType.IMAGE);
		
		className.set ("styles/gradient/arrow_down_dark.png", __ASSET__styles_gradient_arrow_down_dark_png);
		type.set ("styles/gradient/arrow_down_dark.png", AssetType.IMAGE);
		
		className.set ("styles/gradient/arrow_down_disabled.png", __ASSET__styles_gradient_arrow_down_disabled_png);
		type.set ("styles/gradient/arrow_down_disabled.png", AssetType.IMAGE);
		
		className.set ("styles/gradient/arrow_left.png", __ASSET__styles_gradient_arrow_left_png);
		type.set ("styles/gradient/arrow_left.png", AssetType.IMAGE);
		
		className.set ("styles/gradient/arrow_left_disabled.png", __ASSET__styles_gradient_arrow_left_disabled_png);
		type.set ("styles/gradient/arrow_left_disabled.png", AssetType.IMAGE);
		
		className.set ("styles/gradient/arrow_right.png", __ASSET__styles_gradient_arrow_right_png);
		type.set ("styles/gradient/arrow_right.png", AssetType.IMAGE);
		
		className.set ("styles/gradient/arrow_right2.png", __ASSET__styles_gradient_arrow_right2_png);
		type.set ("styles/gradient/arrow_right2.png", AssetType.IMAGE);
		
		className.set ("styles/gradient/arrow_right_dark.png", __ASSET__styles_gradient_arrow_right_dark_png);
		type.set ("styles/gradient/arrow_right_dark.png", AssetType.IMAGE);
		
		className.set ("styles/gradient/arrow_right_disabled.png", __ASSET__styles_gradient_arrow_right_disabled_png);
		type.set ("styles/gradient/arrow_right_disabled.png", AssetType.IMAGE);
		
		className.set ("styles/gradient/arrow_up.png", __ASSET__styles_gradient_arrow_up_png);
		type.set ("styles/gradient/arrow_up.png", AssetType.IMAGE);
		
		className.set ("styles/gradient/arrow_up_disabled.png", __ASSET__styles_gradient_arrow_up_disabled_png);
		type.set ("styles/gradient/arrow_up_disabled.png", AssetType.IMAGE);
		
		className.set ("styles/gradient/circle_dark.png", __ASSET__styles_gradient_circle_dark_png);
		type.set ("styles/gradient/circle_dark.png", AssetType.IMAGE);
		
		className.set ("styles/gradient/cross_dark.png", __ASSET__styles_gradient_cross_dark_png);
		type.set ("styles/gradient/cross_dark.png", AssetType.IMAGE);
		
		className.set ("styles/gradient/cross_dark_disabled.png", __ASSET__styles_gradient_cross_dark_disabled_png);
		type.set ("styles/gradient/cross_dark_disabled.png", AssetType.IMAGE);
		
		className.set ("styles/gradient/cross_light_small.png", __ASSET__styles_gradient_cross_light_small_png);
		type.set ("styles/gradient/cross_light_small.png", AssetType.IMAGE);
		
		className.set ("styles/gradient/gradient.css", __ASSET__styles_gradient_gradient_css);
		type.set ("styles/gradient/gradient.css", AssetType.TEXT);
		
		className.set ("styles/gradient/gradient.min.css", __ASSET__styles_gradient_gradient_min_css);
		type.set ("styles/gradient/gradient.min.css", AssetType.TEXT);
		
		className.set ("styles/gradient/gradient_mobile.css", __ASSET__styles_gradient_gradient_mobile_css);
		type.set ("styles/gradient/gradient_mobile.css", AssetType.TEXT);
		
		className.set ("styles/gradient/gradient_mobile.min.css", __ASSET__styles_gradient_gradient_mobile_min_css);
		type.set ("styles/gradient/gradient_mobile.min.css", AssetType.TEXT);
		
		className.set ("styles/gradient/gripper_horizontal.png", __ASSET__styles_gradient_gripper_horizontal_png);
		type.set ("styles/gradient/gripper_horizontal.png", AssetType.IMAGE);
		
		className.set ("styles/gradient/gripper_horizontal_disabled.png", __ASSET__styles_gradient_gripper_horizontal_disabled_png);
		type.set ("styles/gradient/gripper_horizontal_disabled.png", AssetType.IMAGE);
		
		className.set ("styles/gradient/gripper_vertical.png", __ASSET__styles_gradient_gripper_vertical_png);
		type.set ("styles/gradient/gripper_vertical.png", AssetType.IMAGE);
		
		className.set ("styles/gradient/gripper_vertical_disabled.png", __ASSET__styles_gradient_gripper_vertical_disabled_png);
		type.set ("styles/gradient/gripper_vertical_disabled.png", AssetType.IMAGE);
		
		className.set ("styles/gradient/hsplitter_gripper.png", __ASSET__styles_gradient_hsplitter_gripper_png);
		type.set ("styles/gradient/hsplitter_gripper.png", AssetType.IMAGE);
		
		className.set ("styles/gradient/vsplitter_gripper.png", __ASSET__styles_gradient_vsplitter_gripper_png);
		type.set ("styles/gradient/vsplitter_gripper.png", AssetType.IMAGE);
		
		className.set ("styles/windows/accordion.css", __ASSET__styles_windows_accordion_css);
		type.set ("styles/windows/accordion.css", AssetType.TEXT);
		
		className.set ("styles/windows/accordion.min.css", __ASSET__styles_windows_accordion_min_css);
		type.set ("styles/windows/accordion.min.css", AssetType.TEXT);
		
		className.set ("styles/windows/button.png", __ASSET__styles_windows_button_png);
		type.set ("styles/windows/button.png", AssetType.IMAGE);
		
		className.set ("styles/windows/buttons.css", __ASSET__styles_windows_buttons_css);
		type.set ("styles/windows/buttons.css", AssetType.TEXT);
		
		className.set ("styles/windows/buttons.min.css", __ASSET__styles_windows_buttons_min_css);
		type.set ("styles/windows/buttons.min.css", AssetType.TEXT);
		
		className.set ("styles/windows/calendar.css", __ASSET__styles_windows_calendar_css);
		type.set ("styles/windows/calendar.css", AssetType.TEXT);
		
		className.set ("styles/windows/checkbox.png", __ASSET__styles_windows_checkbox_png);
		type.set ("styles/windows/checkbox.png", AssetType.IMAGE);
		
		className.set ("styles/windows/container.png", __ASSET__styles_windows_container_png);
		type.set ("styles/windows/container.png", AssetType.IMAGE);
		
		className.set ("styles/windows/glyphs/down_arrow.png", __ASSET__styles_windows_glyphs_down_arrow_png);
		type.set ("styles/windows/glyphs/down_arrow.png", AssetType.IMAGE);
		
		className.set ("styles/windows/glyphs/hscroll_thumb_gripper_down.png", __ASSET__styles_windows_glyphs_hscroll_thumb_gripper_down_png);
		type.set ("styles/windows/glyphs/hscroll_thumb_gripper_down.png", AssetType.IMAGE);
		
		className.set ("styles/windows/glyphs/hscroll_thumb_gripper_over.png", __ASSET__styles_windows_glyphs_hscroll_thumb_gripper_over_png);
		type.set ("styles/windows/glyphs/hscroll_thumb_gripper_over.png", AssetType.IMAGE);
		
		className.set ("styles/windows/glyphs/hscroll_thumb_gripper_up.png", __ASSET__styles_windows_glyphs_hscroll_thumb_gripper_up_png);
		type.set ("styles/windows/glyphs/hscroll_thumb_gripper_up.png", AssetType.IMAGE);
		
		className.set ("styles/windows/glyphs/left_arrow.png", __ASSET__styles_windows_glyphs_left_arrow_png);
		type.set ("styles/windows/glyphs/left_arrow.png", AssetType.IMAGE);
		
		className.set ("styles/windows/glyphs/right_arrow.png", __ASSET__styles_windows_glyphs_right_arrow_png);
		type.set ("styles/windows/glyphs/right_arrow.png", AssetType.IMAGE);
		
		className.set ("styles/windows/glyphs/up_arrow.png", __ASSET__styles_windows_glyphs_up_arrow_png);
		type.set ("styles/windows/glyphs/up_arrow.png", AssetType.IMAGE);
		
		className.set ("styles/windows/glyphs/vscroll_thumb_gripper_down.png", __ASSET__styles_windows_glyphs_vscroll_thumb_gripper_down_png);
		type.set ("styles/windows/glyphs/vscroll_thumb_gripper_down.png", AssetType.IMAGE);
		
		className.set ("styles/windows/glyphs/vscroll_thumb_gripper_over.png", __ASSET__styles_windows_glyphs_vscroll_thumb_gripper_over_png);
		type.set ("styles/windows/glyphs/vscroll_thumb_gripper_over.png", AssetType.IMAGE);
		
		className.set ("styles/windows/glyphs/vscroll_thumb_gripper_up.png", __ASSET__styles_windows_glyphs_vscroll_thumb_gripper_up_png);
		type.set ("styles/windows/glyphs/vscroll_thumb_gripper_up.png", AssetType.IMAGE);
		
		className.set ("styles/windows/hprogress.png", __ASSET__styles_windows_hprogress_png);
		type.set ("styles/windows/hprogress.png", AssetType.IMAGE);
		
		className.set ("styles/windows/hscroll.png", __ASSET__styles_windows_hscroll_png);
		type.set ("styles/windows/hscroll.png", AssetType.IMAGE);
		
		className.set ("styles/windows/listview.css", __ASSET__styles_windows_listview_css);
		type.set ("styles/windows/listview.css", AssetType.TEXT);
		
		className.set ("styles/windows/listview.min.css", __ASSET__styles_windows_listview_min_css);
		type.set ("styles/windows/listview.min.css", AssetType.TEXT);
		
		className.set ("styles/windows/listview.png", __ASSET__styles_windows_listview_png);
		type.set ("styles/windows/listview.png", AssetType.IMAGE);
		
		className.set ("styles/windows/menus.css", __ASSET__styles_windows_menus_css);
		type.set ("styles/windows/menus.css", AssetType.TEXT);
		
		className.set ("styles/windows/optionbox.png", __ASSET__styles_windows_optionbox_png);
		type.set ("styles/windows/optionbox.png", AssetType.IMAGE);
		
		className.set ("styles/windows/popup.png", __ASSET__styles_windows_popup_png);
		type.set ("styles/windows/popup.png", AssetType.IMAGE);
		
		className.set ("styles/windows/popups.css", __ASSET__styles_windows_popups_css);
		type.set ("styles/windows/popups.css", AssetType.TEXT);
		
		className.set ("styles/windows/rtf.css", __ASSET__styles_windows_rtf_css);
		type.set ("styles/windows/rtf.css", AssetType.TEXT);
		
		className.set ("styles/windows/scrolls.css", __ASSET__styles_windows_scrolls_css);
		type.set ("styles/windows/scrolls.css", AssetType.TEXT);
		
		className.set ("styles/windows/scrolls.min.css", __ASSET__styles_windows_scrolls_min_css);
		type.set ("styles/windows/scrolls.min.css", AssetType.TEXT);
		
		className.set ("styles/windows/sliders.css", __ASSET__styles_windows_sliders_css);
		type.set ("styles/windows/sliders.css", AssetType.TEXT);
		
		className.set ("styles/windows/tab.png", __ASSET__styles_windows_tab_png);
		type.set ("styles/windows/tab.png", AssetType.IMAGE);
		
		className.set ("styles/windows/tabs.css", __ASSET__styles_windows_tabs_css);
		type.set ("styles/windows/tabs.css", AssetType.TEXT);
		
		className.set ("styles/windows/textinput.png", __ASSET__styles_windows_textinput_png);
		type.set ("styles/windows/textinput.png", AssetType.IMAGE);
		
		className.set ("styles/windows/vprogress.png", __ASSET__styles_windows_vprogress_png);
		type.set ("styles/windows/vprogress.png", AssetType.IMAGE);
		
		className.set ("styles/windows/vscroll.png", __ASSET__styles_windows_vscroll_png);
		type.set ("styles/windows/vscroll.png", AssetType.IMAGE);
		
		className.set ("styles/windows/windows.css", __ASSET__styles_windows_windows_css);
		type.set ("styles/windows/windows.css", AssetType.TEXT);
		
		className.set ("fonts/Oxygen-Bold.eot", __ASSET__fonts_oxygen_bold_eot);
		type.set ("fonts/Oxygen-Bold.eot", AssetType.BINARY);
		
		className.set ("fonts/Oxygen-Bold.svg", __ASSET__fonts_oxygen_bold_svg);
		type.set ("fonts/Oxygen-Bold.svg", AssetType.TEXT);
		
		className.set ("fonts/Oxygen-Bold.ttf", __ASSET__fonts_oxygen_bold_ttf);
		type.set ("fonts/Oxygen-Bold.ttf", AssetType.FONT);
		
		className.set ("fonts/Oxygen-Bold.woff", __ASSET__fonts_oxygen_bold_woff);
		type.set ("fonts/Oxygen-Bold.woff", AssetType.BINARY);
		
		className.set ("fonts/Oxygen-Bold.woff2", __ASSET__fonts_oxygen_bold_woff2);
		type.set ("fonts/Oxygen-Bold.woff2", AssetType.BINARY);
		
		className.set ("fonts/Oxygen.eot", __ASSET__fonts_oxygen_eot);
		type.set ("fonts/Oxygen.eot", AssetType.BINARY);
		
		className.set ("fonts/Oxygen.svg", __ASSET__fonts_oxygen_svg);
		type.set ("fonts/Oxygen.svg", AssetType.TEXT);
		
		className.set ("fonts/Oxygen.ttf", __ASSET__fonts_oxygen_ttf);
		type.set ("fonts/Oxygen.ttf", AssetType.FONT);
		
		className.set ("fonts/Oxygen.woff", __ASSET__fonts_oxygen_woff);
		type.set ("fonts/Oxygen.woff", AssetType.BINARY);
		
		className.set ("fonts/Oxygen.woff2", __ASSET__fonts_oxygen_woff2);
		type.set ("fonts/Oxygen.woff2", AssetType.BINARY);
		
		className.set ("assets/css/desktop.css", __ASSET__assets_css_desktop_css);
		type.set ("assets/css/desktop.css", AssetType.TEXT);
		
		className.set ("assets/css/main.css", __ASSET__assets_css_main_css);
		type.set ("assets/css/main.css", AssetType.TEXT);
		
		className.set ("assets/css/main.min.css", __ASSET__assets_css_main_min_css);
		type.set ("assets/css/main.min.css", AssetType.TEXT);
		
		className.set ("assets/css/mobile.css", __ASSET__assets_css_mobile_css);
		type.set ("assets/css/mobile.css", AssetType.TEXT);
		
		className.set ("assets/css/mobile.min.css", __ASSET__assets_css_mobile_min_css);
		type.set ("assets/css/mobile.min.css", AssetType.TEXT);
		
		className.set ("assets/examples/eg1/manifest.xml", __ASSET__assets_examples_eg1_manifest_xml);
		type.set ("assets/examples/eg1/manifest.xml", AssetType.TEXT);
		
		className.set ("assets/fonts/OpenSans-Bold.ttf", __ASSET__assets_fonts_opensans_bold_ttf);
		type.set ("assets/fonts/OpenSans-Bold.ttf", AssetType.FONT);
		
		className.set ("assets/fonts/OpenSans-Italic.ttf", __ASSET__assets_fonts_opensans_italic_ttf);
		type.set ("assets/fonts/OpenSans-Italic.ttf", AssetType.FONT);
		
		className.set ("assets/fonts/OpenSans-Regular.ttf", __ASSET__assets_fonts_opensans_regular_ttf);
		type.set ("assets/fonts/OpenSans-Regular.ttf", AssetType.FONT);
		
		className.set ("assets/fonts/OpenSans-Semibold.ttf", __ASSET__assets_fonts_opensans_semibold_ttf);
		type.set ("assets/fonts/OpenSans-Semibold.ttf", AssetType.FONT);
		
		className.set ("assets/fonts/Roboto-Bold.ttf", __ASSET__assets_fonts_roboto_bold_ttf);
		type.set ("assets/fonts/Roboto-Bold.ttf", AssetType.FONT);
		
		className.set ("assets/fonts/Roboto-Italic.ttf", __ASSET__assets_fonts_roboto_italic_ttf);
		type.set ("assets/fonts/Roboto-Italic.ttf", AssetType.FONT);
		
		className.set ("assets/fonts/Roboto-Medium.ttf", __ASSET__assets_fonts_roboto_medium_ttf);
		type.set ("assets/fonts/Roboto-Medium.ttf", AssetType.FONT);
		
		className.set ("assets/fonts/Roboto-Regular.ttf", __ASSET__assets_fonts_roboto_regular_ttf);
		type.set ("assets/fonts/Roboto-Regular.ttf", AssetType.FONT);
		
		className.set ("assets/haxeui.png", __ASSET__assets_haxeui_png);
		type.set ("assets/haxeui.png", AssetType.IMAGE);
		
		className.set ("assets/haxe_ui_plain.svg", __ASSET__assets_haxe_ui_plain_svg);
		type.set ("assets/haxe_ui_plain.svg", AssetType.TEXT);
		
		className.set ("assets/icons/back_32.png", __ASSET__assets_icons_back_32_png);
		type.set ("assets/icons/back_32.png", AssetType.IMAGE);
		
		className.set ("assets/icons/forward_32.png", __ASSET__assets_icons_forward_32_png);
		type.set ("assets/icons/forward_32.png", AssetType.IMAGE);
		
		className.set ("assets/icons/menu_32.png", __ASSET__assets_icons_menu_32_png);
		type.set ("assets/icons/menu_32.png", AssetType.IMAGE);
		
		className.set ("assets/img/a.png", __ASSET__assets_img_a_png);
		type.set ("assets/img/a.png", AssetType.IMAGE);
		
		className.set ("assets/img/folder_32.png", __ASSET__assets_img_folder_32_png);
		type.set ("assets/img/folder_32.png", AssetType.IMAGE);
		
		className.set ("assets/ui/about.xml", __ASSET__assets_ui_about_xml);
		type.set ("assets/ui/about.xml", AssetType.TEXT);
		
		className.set ("assets/ui/list.xml", __ASSET__assets_ui_list_xml);
		type.set ("assets/ui/list.xml", AssetType.TEXT);
		
		className.set ("assets/ui/main.xml", __ASSET__assets_ui_main_xml);
		type.set ("assets/ui/main.xml", AssetType.TEXT);
		
		className.set ("assets/ui/menu.xml", __ASSET__assets_ui_menu_xml);
		type.set ("assets/ui/menu.xml", AssetType.TEXT);
		
		className.set ("assets/ui/start.xml", __ASSET__assets_ui_start_xml);
		type.set ("assets/ui/start.xml", AssetType.TEXT);
		
		className.set ("assets/ui/update.xml", __ASSET__assets_ui_update_xml);
		type.set ("assets/ui/update.xml", AssetType.TEXT);
		
		className.set ("assets/ui/wizard.xml", __ASSET__assets_ui_wizard_xml);
		type.set ("assets/ui/wizard.xml", AssetType.TEXT);
		
		className.set ("css/desktop.css", __ASSET__css_desktop_css);
		type.set ("css/desktop.css", AssetType.TEXT);
		
		className.set ("css/main.css", __ASSET__css_main_css);
		type.set ("css/main.css", AssetType.TEXT);
		
		className.set ("css/main.min.css", __ASSET__css_main_min_css);
		type.set ("css/main.min.css", AssetType.TEXT);
		
		className.set ("css/mobile.css", __ASSET__css_mobile_css);
		type.set ("css/mobile.css", AssetType.TEXT);
		
		className.set ("css/mobile.min.css", __ASSET__css_mobile_min_css);
		type.set ("css/mobile.min.css", AssetType.TEXT);
		
		className.set ("ui/about.xml", __ASSET__ui_about_xml);
		type.set ("ui/about.xml", AssetType.TEXT);
		
		className.set ("ui/list.xml", __ASSET__ui_list_xml);
		type.set ("ui/list.xml", AssetType.TEXT);
		
		className.set ("ui/main.xml", __ASSET__ui_main_xml);
		type.set ("ui/main.xml", AssetType.TEXT);
		
		className.set ("ui/menu.xml", __ASSET__ui_menu_xml);
		type.set ("ui/menu.xml", AssetType.TEXT);
		
		className.set ("ui/start.xml", __ASSET__ui_start_xml);
		type.set ("ui/start.xml", AssetType.TEXT);
		
		className.set ("ui/update.xml", __ASSET__ui_update_xml);
		type.set ("ui/update.xml", AssetType.TEXT);
		
		className.set ("ui/wizard.xml", __ASSET__ui_wizard_xml);
		type.set ("ui/wizard.xml", AssetType.TEXT);
		
		className.set ("fonts/OpenSans-Bold.ttf", __ASSET__fonts_opensans_bold_ttf);
		type.set ("fonts/OpenSans-Bold.ttf", AssetType.FONT);
		
		className.set ("fonts/OpenSans-Italic.ttf", __ASSET__fonts_opensans_italic_ttf);
		type.set ("fonts/OpenSans-Italic.ttf", AssetType.FONT);
		
		className.set ("fonts/OpenSans-Regular.ttf", __ASSET__fonts_opensans_regular_ttf);
		type.set ("fonts/OpenSans-Regular.ttf", AssetType.FONT);
		
		className.set ("fonts/OpenSans-Semibold.ttf", __ASSET__fonts_opensans_semibold_ttf);
		type.set ("fonts/OpenSans-Semibold.ttf", AssetType.FONT);
		
		className.set ("fonts/Roboto-Bold.ttf", __ASSET__fonts_roboto_bold_ttf);
		type.set ("fonts/Roboto-Bold.ttf", AssetType.FONT);
		
		className.set ("fonts/Roboto-Italic.ttf", __ASSET__fonts_roboto_italic_ttf);
		type.set ("fonts/Roboto-Italic.ttf", AssetType.FONT);
		
		className.set ("fonts/Roboto-Medium.ttf", __ASSET__fonts_roboto_medium_ttf);
		type.set ("fonts/Roboto-Medium.ttf", AssetType.FONT);
		
		className.set ("fonts/Roboto-Regular.ttf", __ASSET__fonts_roboto_regular_ttf);
		type.set ("fonts/Roboto-Regular.ttf", AssetType.FONT);
		
		className.set ("icons/back_32.png", __ASSET__icons_back_32_png);
		type.set ("icons/back_32.png", AssetType.IMAGE);
		
		className.set ("icons/forward_32.png", __ASSET__icons_forward_32_png);
		type.set ("icons/forward_32.png", AssetType.IMAGE);
		
		className.set ("icons/menu_32.png", __ASSET__icons_menu_32_png);
		type.set ("icons/menu_32.png", AssetType.IMAGE);
		
		className.set ("img/a.png", __ASSET__img_a_png);
		type.set ("img/a.png", AssetType.IMAGE);
		
		className.set ("img/folder_32.png", __ASSET__img_folder_32_png);
		type.set ("img/folder_32.png", AssetType.IMAGE);
		
		className.set ("examples/eg1/manifest.xml", __ASSET__examples_eg1_manifest_xml);
		type.set ("examples/eg1/manifest.xml", AssetType.TEXT);
		
		
		if (useManifest) {
			
			loadManifest ();
			
			if (Sys.args ().indexOf ("-livereload") > -1) {
				
				var path = FileSystem.fullPath ("manifest");
				lastModified = FileSystem.stat (path).mtime.getTime ();
				
				timer = new Timer (2000);
				timer.run = function () {
					
					var modified = FileSystem.stat (path).mtime.getTime ();
					
					if (modified > lastModified) {
						
						lastModified = modified;
						loadManifest ();
						
						onChange.dispatch ();
						
					}
					
				}
				
			}
			
		}
		
		#else
		
		loadManifest ();
		
		#end
		#end
		
	}
	
	
	public override function exists (id:String, type:String):Bool {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		var assetType = this.type.get (id);
		
		if (assetType != null) {
			
			if (assetType == requestedType || ((requestedType == SOUND || requestedType == MUSIC) && (assetType == MUSIC || assetType == SOUND))) {
				
				return true;
				
			}
			
			#if flash
			
			if (requestedType == BINARY && (assetType == BINARY || assetType == TEXT || assetType == IMAGE)) {
				
				return true;
				
			} else if (requestedType == null || path.exists (id)) {
				
				return true;
				
			}
			
			#else
			
			if (requestedType == BINARY || requestedType == null || (assetType == BINARY && requestedType == TEXT)) {
				
				return true;
				
			}
			
			#end
			
		}
		
		return false;
		
	}
	
	
	public override function getAudioBuffer (id:String):AudioBuffer {
		
		#if flash
		
		var buffer = new AudioBuffer ();
		buffer.src = cast (Type.createInstance (className.get (id), []), Sound);
		return buffer;
		
		#elseif html5
		
		return null;
		//return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		if (className.exists(id)) return AudioBuffer.fromBytes (cast (Type.createInstance (className.get (id), []), ByteArray));
		else return AudioBuffer.fromFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getBytes (id:String):ByteArray {
		
		#if flash
		
		switch (type.get (id)) {
			
			case TEXT, BINARY:
				
				return cast (Type.createInstance (className.get (id), []), ByteArray);
			
			case IMAGE:
				
				var bitmapData = cast (Type.createInstance (className.get (id), []), BitmapData);
				return bitmapData.getPixels (bitmapData.rect);
			
			default:
				
				return null;
			
		}
		
		return cast (Type.createInstance (className.get (id), []), ByteArray);
		
		#elseif html5
		
		var bytes:ByteArray = null;
		var loader = Preloader.loaders.get (path.get (id));
		
		if (loader == null) {
			
			return null;
			
		}
		
		var data = loader.data;
		
		if (Std.is (data, String)) {
			
			bytes = new ByteArray ();
			bytes.writeUTFBytes (data);
			
		} else if (Std.is (data, ByteArray)) {
			
			bytes = cast data;
			
		} else {
			
			bytes = null;
			
		}
		
		if (bytes != null) {
			
			bytes.position = 0;
			return bytes;
			
		} else {
			
			return null;
		}
		
		#else
		
		if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), ByteArray);
		else return ByteArray.readFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getFont (id:String):Font {
		
		#if flash
		
		var src = Type.createInstance (className.get (id), []);
		
		var font = new Font (src.fontName);
		font.src = src;
		return font;
		
		#elseif html5
		
		return cast (Type.createInstance (className.get (id), []), Font);
		
		#else
		
		if (className.exists (id)) {
			
			var fontClass = className.get (id);
			return cast (Type.createInstance (fontClass, []), Font);
			
		} else {
			
			return Font.fromFile (path.get (id));
			
		}
		
		#end
		
	}
	
	
	public override function getImage (id:String):Image {
		
		#if flash
		
		return Image.fromBitmapData (cast (Type.createInstance (className.get (id), []), BitmapData));
		
		#elseif html5
		
		return Image.fromImageElement (Preloader.images.get (path.get (id)));
		
		#else
		
		if (className.exists (id)) {
			
			var fontClass = className.get (id);
			return cast (Type.createInstance (fontClass, []), Image);
			
		} else {
			
			return Image.fromFile (path.get (id));
			
		}
		
		#end
		
	}
	
	
	/*public override function getMusic (id:String):Dynamic {
		
		#if flash
		
		return cast (Type.createInstance (className.get (id), []), Sound);
		
		#elseif openfl_html5
		
		//var sound = new Sound ();
		//sound.__buffer = true;
		//sound.load (new URLRequest (path.get (id)));
		//return sound;
		return null;
		
		#elseif html5
		
		return null;
		//return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		return null;
		//if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), Sound);
		//else return new Sound (new URLRequest (path.get (id)), null, true);
		
		#end
		
	}*/
	
	
	public override function getPath (id:String):String {
		
		//#if ios
		
		//return SystemPath.applicationDirectory + "/assets/" + path.get (id);
		
		//#else
		
		return path.get (id);
		
		//#end
		
	}
	
	
	public override function getText (id:String):String {
		
		#if html5
		
		var bytes:ByteArray = null;
		var loader = Preloader.loaders.get (path.get (id));
		
		if (loader == null) {
			
			return null;
			
		}
		
		var data = loader.data;
		
		if (Std.is (data, String)) {
			
			return cast data;
			
		} else if (Std.is (data, ByteArray)) {
			
			bytes = cast data;
			
		} else {
			
			bytes = null;
			
		}
		
		if (bytes != null) {
			
			bytes.position = 0;
			return bytes.readUTFBytes (bytes.length);
			
		} else {
			
			return null;
		}
		
		#else
		
		var bytes = getBytes (id);
		
		if (bytes == null) {
			
			return null;
			
		} else {
			
			return bytes.readUTFBytes (bytes.length);
			
		}
		
		#end
		
	}
	
	
	public override function isLocal (id:String, type:String):Bool {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		
		#if flash
		
		//if (requestedType != AssetType.MUSIC && requestedType != AssetType.SOUND) {
			
			return className.exists (id);
			
		//}
		
		#end
		
		return true;
		
	}
	
	
	public override function list (type:String):Array<String> {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		var items = [];
		
		for (id in this.type.keys ()) {
			
			if (requestedType == null || exists (id, type)) {
				
				items.push (id);
				
			}
			
		}
		
		return items;
		
	}
	
	
	public override function loadAudioBuffer (id:String):Future<AudioBuffer> {
		
		var promise = new Promise<AudioBuffer> ();
		
		#if (flash)
		
		if (path.exists (id)) {
			
			var soundLoader = new Sound ();
			soundLoader.addEventListener (Event.COMPLETE, function (event) {
				
				var audioBuffer:AudioBuffer = new AudioBuffer();
				audioBuffer.src = event.currentTarget;
				promise.complete (audioBuffer);
				
			});
			soundLoader.addEventListener (ProgressEvent.PROGRESS, function (event) {
				
				if (event.bytesTotal == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (event.bytesLoaded / event.bytesTotal);
					
				}
				
			});
			soundLoader.addEventListener (IOErrorEvent.IO_ERROR, promise.error);
			soundLoader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getAudioBuffer (id));
			
		}
		
		#else
		
		promise.completeWith (new Future<AudioBuffer> (function () return getAudioBuffer (id)));
		
		#end
		
		return promise.future;
		
	}
	
	
	public override function loadBytes (id:String):Future<ByteArray> {
		
		var promise = new Promise<ByteArray> ();
		
		#if flash
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bytes = new ByteArray ();
				bytes.writeUTFBytes (event.currentTarget.data);
				bytes.position = 0;
				
				promise.complete (bytes);
				
			});
			loader.addEventListener (ProgressEvent.PROGRESS, function (event) {
				
				if (event.bytesTotal == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (event.bytesLoaded / event.bytesTotal);
					
				}
				
			});
			loader.addEventListener (IOErrorEvent.IO_ERROR, promise.error);
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getBytes (id));
			
		}
		
		#elseif html5
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.dataFormat = BINARY;
			loader.onComplete.add (function (_):Void {
				
				promise.complete (loader.data);
				
			});
			loader.onProgress.add (function (_, loaded, total) {
				
				if (total == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (loaded / total);
					
				}
				
			});
			loader.onIOError.add (function (_, e) {
				
				promise.error (e);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getBytes (id));
			
		}
		
		#else
		
		promise.completeWith (new Future<ByteArray> (function () return getBytes (id)));
		
		#end
		
		return promise.future;
		
	}
	
	
	public override function loadImage (id:String):Future<Image> {
		
		var promise = new Promise<Image> ();
		
		#if flash
		
		if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bitmapData = cast (event.currentTarget.content, Bitmap).bitmapData;
				promise.complete (Image.fromBitmapData (bitmapData));
				
			});
			loader.contentLoaderInfo.addEventListener (ProgressEvent.PROGRESS, function (event) {
				
				if (event.bytesTotal == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (event.bytesLoaded / event.bytesTotal);
					
				}
				
			});
			loader.contentLoaderInfo.addEventListener (IOErrorEvent.IO_ERROR, promise.error);
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getImage (id));
			
		}
		
		#elseif html5
		
		if (path.exists (id)) {
			
			var image = new js.html.Image ();
			image.onload = function (_):Void {
				
				promise.complete (Image.fromImageElement (image));
				
			}
			image.onerror = promise.error;
			image.src = path.get (id);
			
		} else {
			
			promise.complete (getImage (id));
			
		}
		
		#else
		
		promise.completeWith (new Future<Image> (function () return getImage (id)));
		
		#end
		
		return promise.future;
		
	}
	
	
	#if (!flash && !html5)
	private function loadManifest ():Void {
		
		try {
			
			#if blackberry
			var bytes = ByteArray.readFile ("app/native/manifest");
			#elseif tizen
			var bytes = ByteArray.readFile ("../res/manifest");
			#elseif emscripten
			var bytes = ByteArray.readFile ("assets/manifest");
			#elseif (mac && java)
			var bytes = ByteArray.readFile ("../Resources/manifest");
			#elseif (ios || tvos)
			var bytes = ByteArray.readFile ("assets/manifest");
			#else
			var bytes = ByteArray.readFile ("manifest");
			#end
			
			if (bytes != null) {
				
				bytes.position = 0;
				
				if (bytes.length > 0) {
					
					var data = bytes.readUTFBytes (bytes.length);
					
					if (data != null && data.length > 0) {
						
						var manifest:Array<Dynamic> = Unserializer.run (data);
						
						for (asset in manifest) {
							
							if (!className.exists (asset.id)) {
								
								#if (ios || tvos)
								path.set (asset.id, "assets/" + asset.path);
								#else
								path.set (asset.id, asset.path);
								#end
								type.set (asset.id, cast (asset.type, AssetType));
								
							}
							
						}
						
					}
					
				}
				
			} else {
				
				trace ("Warning: Could not load asset manifest (bytes was null)");
				
			}
		
		} catch (e:Dynamic) {
			
			trace ('Warning: Could not load asset manifest (${e})');
			
		}
		
	}
	#end
	
	
	public override function loadText (id:String):Future<String> {
		
		var promise = new Promise<String> ();
		
		#if html5
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.onComplete.add (function (_):Void {
				
				promise.complete (loader.data);
				
			});
			loader.onProgress.add (function (_, loaded, total) {
				
				if (total == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (loaded / total);
					
				}
				
			});
			loader.onIOError.add (function (_, msg) promise.error (msg));
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getText (id));
			
		}
		
		#else
		
		promise.completeWith (loadBytes (id).then (function (bytes) {
			
			return new Future<String> (function () {
				
				if (bytes == null) {
					
					return null;
					
				} else {
					
					return bytes.readUTFBytes (bytes.length);
					
				}
				
			});
			
		}));
		
		#end
		
		return promise.future;
		
	}
	
	
}


#if !display
#if flash

@:keep @:bind #if display private #end class __ASSET__styles_default_circle_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_default_collapse_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_default_cross_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_default_expand_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_default_up_down_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_gradient_arrow_down_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_gradient_arrow_down_dark_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_gradient_arrow_down_disabled_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_gradient_arrow_left_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_gradient_arrow_left_disabled_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_gradient_arrow_right_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_gradient_arrow_right2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_gradient_arrow_right_dark_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_gradient_arrow_right_disabled_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_gradient_arrow_up_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_gradient_arrow_up_disabled_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_gradient_circle_dark_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_gradient_cross_dark_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_gradient_cross_dark_disabled_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_gradient_cross_light_small_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_gradient_gradient_css extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__styles_gradient_gradient_min_css extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__styles_gradient_gradient_mobile_css extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__styles_gradient_gradient_mobile_min_css extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__styles_gradient_gripper_horizontal_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_gradient_gripper_horizontal_disabled_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_gradient_gripper_vertical_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_gradient_gripper_vertical_disabled_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_gradient_hsplitter_gripper_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_gradient_vsplitter_gripper_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_windows_accordion_css extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__styles_windows_accordion_min_css extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__styles_windows_button_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_windows_buttons_css extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__styles_windows_buttons_min_css extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__styles_windows_calendar_css extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__styles_windows_checkbox_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_windows_container_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_windows_glyphs_down_arrow_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_windows_glyphs_hscroll_thumb_gripper_down_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_windows_glyphs_hscroll_thumb_gripper_over_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_windows_glyphs_hscroll_thumb_gripper_up_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_windows_glyphs_left_arrow_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_windows_glyphs_right_arrow_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_windows_glyphs_up_arrow_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_windows_glyphs_vscroll_thumb_gripper_down_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_windows_glyphs_vscroll_thumb_gripper_over_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_windows_glyphs_vscroll_thumb_gripper_up_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_windows_hprogress_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_windows_hscroll_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_windows_listview_css extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__styles_windows_listview_min_css extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__styles_windows_listview_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_windows_menus_css extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__styles_windows_optionbox_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_windows_popup_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_windows_popups_css extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__styles_windows_rtf_css extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__styles_windows_scrolls_css extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__styles_windows_scrolls_min_css extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__styles_windows_sliders_css extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__styles_windows_tab_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_windows_tabs_css extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__styles_windows_textinput_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_windows_vprogress_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_windows_vscroll_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_windows_windows_css extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__fonts_oxygen_bold_eot extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__fonts_oxygen_bold_svg extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__fonts_oxygen_bold_ttf extends flash.text.Font { }
@:keep @:bind #if display private #end class __ASSET__fonts_oxygen_bold_woff extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__fonts_oxygen_bold_woff2 extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__fonts_oxygen_eot extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__fonts_oxygen_svg extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__fonts_oxygen_ttf extends flash.text.Font { }
@:keep @:bind #if display private #end class __ASSET__fonts_oxygen_woff extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__fonts_oxygen_woff2 extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_css_desktop_css extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_css_main_css extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_css_main_min_css extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_css_mobile_css extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_css_mobile_min_css extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_examples_eg1_manifest_xml extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_fonts_opensans_bold_ttf extends flash.text.Font { }
@:keep @:bind #if display private #end class __ASSET__assets_fonts_opensans_italic_ttf extends flash.text.Font { }
@:keep @:bind #if display private #end class __ASSET__assets_fonts_opensans_regular_ttf extends flash.text.Font { }
@:keep @:bind #if display private #end class __ASSET__assets_fonts_opensans_semibold_ttf extends flash.text.Font { }
@:keep @:bind #if display private #end class __ASSET__assets_fonts_roboto_bold_ttf extends flash.text.Font { }
@:keep @:bind #if display private #end class __ASSET__assets_fonts_roboto_italic_ttf extends flash.text.Font { }
@:keep @:bind #if display private #end class __ASSET__assets_fonts_roboto_medium_ttf extends flash.text.Font { }
@:keep @:bind #if display private #end class __ASSET__assets_fonts_roboto_regular_ttf extends flash.text.Font { }
@:keep @:bind #if display private #end class __ASSET__assets_haxeui_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_haxe_ui_plain_svg extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_icons_back_32_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_icons_forward_32_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_icons_menu_32_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_img_a_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_img_folder_32_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_ui_about_xml extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_ui_list_xml extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_ui_main_xml extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_ui_menu_xml extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_ui_start_xml extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_ui_update_xml extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_ui_wizard_xml extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__css_desktop_css extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__css_main_css extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__css_main_min_css extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__css_mobile_css extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__css_mobile_min_css extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__ui_about_xml extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__ui_list_xml extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__ui_main_xml extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__ui_menu_xml extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__ui_start_xml extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__ui_update_xml extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__ui_wizard_xml extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__fonts_opensans_bold_ttf extends flash.text.Font { }
@:keep @:bind #if display private #end class __ASSET__fonts_opensans_italic_ttf extends flash.text.Font { }
@:keep @:bind #if display private #end class __ASSET__fonts_opensans_regular_ttf extends flash.text.Font { }
@:keep @:bind #if display private #end class __ASSET__fonts_opensans_semibold_ttf extends flash.text.Font { }
@:keep @:bind #if display private #end class __ASSET__fonts_roboto_bold_ttf extends flash.text.Font { }
@:keep @:bind #if display private #end class __ASSET__fonts_roboto_italic_ttf extends flash.text.Font { }
@:keep @:bind #if display private #end class __ASSET__fonts_roboto_medium_ttf extends flash.text.Font { }
@:keep @:bind #if display private #end class __ASSET__fonts_roboto_regular_ttf extends flash.text.Font { }
@:keep @:bind #if display private #end class __ASSET__icons_back_32_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__icons_forward_32_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__icons_menu_32_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_a_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_folder_32_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__examples_eg1_manifest_xml extends flash.utils.ByteArray { }


#elseif html5






































































@:keep #if display private #end class __ASSET__fonts_oxygen_bold_ttf extends lime.text.Font { public function new () { super (); name = "Oxygen Bold"; } } 




@:keep #if display private #end class __ASSET__fonts_oxygen_ttf extends lime.text.Font { public function new () { super (); name = "Oxygen Regular"; } } 








@:keep #if display private #end class __ASSET__assets_fonts_opensans_bold_ttf extends lime.text.Font { public function new () { super (); name = "Open Sans Bold"; } } 
@:keep #if display private #end class __ASSET__assets_fonts_opensans_italic_ttf extends lime.text.Font { public function new () { super (); name = "Open Sans Italic"; } } 
@:keep #if display private #end class __ASSET__assets_fonts_opensans_regular_ttf extends lime.text.Font { public function new () { super (); name = "Open Sans"; } } 
@:keep #if display private #end class __ASSET__assets_fonts_opensans_semibold_ttf extends lime.text.Font { public function new () { super (); name = "Open Sans Semibold"; } } 
@:keep #if display private #end class __ASSET__assets_fonts_roboto_bold_ttf extends lime.text.Font { public function new () { super (); name = "Roboto Bold"; } } 
@:keep #if display private #end class __ASSET__assets_fonts_roboto_italic_ttf extends lime.text.Font { public function new () { super (); name = "Roboto Italic"; } } 
@:keep #if display private #end class __ASSET__assets_fonts_roboto_medium_ttf extends lime.text.Font { public function new () { super (); name = "Roboto Medium"; } } 
@:keep #if display private #end class __ASSET__assets_fonts_roboto_regular_ttf extends lime.text.Font { public function new () { super (); name = "Roboto Regular"; } } 


























@:keep #if display private #end class __ASSET__fonts_opensans_bold_ttf extends lime.text.Font { public function new () { super (); name = "Open Sans Bold"; } } 
@:keep #if display private #end class __ASSET__fonts_opensans_italic_ttf extends lime.text.Font { public function new () { super (); name = "Open Sans Italic"; } } 
@:keep #if display private #end class __ASSET__fonts_opensans_regular_ttf extends lime.text.Font { public function new () { super (); name = "Open Sans"; } } 
@:keep #if display private #end class __ASSET__fonts_opensans_semibold_ttf extends lime.text.Font { public function new () { super (); name = "Open Sans Semibold"; } } 
@:keep #if display private #end class __ASSET__fonts_roboto_bold_ttf extends lime.text.Font { public function new () { super (); name = "Roboto Bold"; } } 
@:keep #if display private #end class __ASSET__fonts_roboto_italic_ttf extends lime.text.Font { public function new () { super (); name = "Roboto Italic"; } } 
@:keep #if display private #end class __ASSET__fonts_roboto_medium_ttf extends lime.text.Font { public function new () { super (); name = "Roboto Medium"; } } 
@:keep #if display private #end class __ASSET__fonts_roboto_regular_ttf extends lime.text.Font { public function new () { super (); name = "Roboto Regular"; } } 








#else



#if (windows || mac || linux || cpp)


@:image("Z:/GitHub/haxeui/assets/styles/default/circle.png") #if display private #end class __ASSET__styles_default_circle_png extends lime.graphics.Image {}
@:image("Z:/GitHub/haxeui/assets/styles/default/collapse.png") #if display private #end class __ASSET__styles_default_collapse_png extends lime.graphics.Image {}
@:image("Z:/GitHub/haxeui/assets/styles/default/cross.png") #if display private #end class __ASSET__styles_default_cross_png extends lime.graphics.Image {}
@:image("Z:/GitHub/haxeui/assets/styles/default/expand.png") #if display private #end class __ASSET__styles_default_expand_png extends lime.graphics.Image {}
@:image("Z:/GitHub/haxeui/assets/styles/default/up_down.png") #if display private #end class __ASSET__styles_default_up_down_png extends lime.graphics.Image {}
@:image("Z:/GitHub/haxeui/assets/styles/gradient/arrow_down.png") #if display private #end class __ASSET__styles_gradient_arrow_down_png extends lime.graphics.Image {}
@:image("Z:/GitHub/haxeui/assets/styles/gradient/arrow_down_dark.png") #if display private #end class __ASSET__styles_gradient_arrow_down_dark_png extends lime.graphics.Image {}
@:image("Z:/GitHub/haxeui/assets/styles/gradient/arrow_down_disabled.png") #if display private #end class __ASSET__styles_gradient_arrow_down_disabled_png extends lime.graphics.Image {}
@:image("Z:/GitHub/haxeui/assets/styles/gradient/arrow_left.png") #if display private #end class __ASSET__styles_gradient_arrow_left_png extends lime.graphics.Image {}
@:image("Z:/GitHub/haxeui/assets/styles/gradient/arrow_left_disabled.png") #if display private #end class __ASSET__styles_gradient_arrow_left_disabled_png extends lime.graphics.Image {}
@:image("Z:/GitHub/haxeui/assets/styles/gradient/arrow_right.png") #if display private #end class __ASSET__styles_gradient_arrow_right_png extends lime.graphics.Image {}
@:image("Z:/GitHub/haxeui/assets/styles/gradient/arrow_right2.png") #if display private #end class __ASSET__styles_gradient_arrow_right2_png extends lime.graphics.Image {}
@:image("Z:/GitHub/haxeui/assets/styles/gradient/arrow_right_dark.png") #if display private #end class __ASSET__styles_gradient_arrow_right_dark_png extends lime.graphics.Image {}
@:image("Z:/GitHub/haxeui/assets/styles/gradient/arrow_right_disabled.png") #if display private #end class __ASSET__styles_gradient_arrow_right_disabled_png extends lime.graphics.Image {}
@:image("Z:/GitHub/haxeui/assets/styles/gradient/arrow_up.png") #if display private #end class __ASSET__styles_gradient_arrow_up_png extends lime.graphics.Image {}
@:image("Z:/GitHub/haxeui/assets/styles/gradient/arrow_up_disabled.png") #if display private #end class __ASSET__styles_gradient_arrow_up_disabled_png extends lime.graphics.Image {}
@:image("Z:/GitHub/haxeui/assets/styles/gradient/circle_dark.png") #if display private #end class __ASSET__styles_gradient_circle_dark_png extends lime.graphics.Image {}
@:image("Z:/GitHub/haxeui/assets/styles/gradient/cross_dark.png") #if display private #end class __ASSET__styles_gradient_cross_dark_png extends lime.graphics.Image {}
@:image("Z:/GitHub/haxeui/assets/styles/gradient/cross_dark_disabled.png") #if display private #end class __ASSET__styles_gradient_cross_dark_disabled_png extends lime.graphics.Image {}
@:image("Z:/GitHub/haxeui/assets/styles/gradient/cross_light_small.png") #if display private #end class __ASSET__styles_gradient_cross_light_small_png extends lime.graphics.Image {}
@:file("Z:/GitHub/haxeui/assets/styles/gradient/gradient.css") #if display private #end class __ASSET__styles_gradient_gradient_css extends lime.utils.ByteArray {}
@:file("Z:/GitHub/haxeui/assets/styles/gradient/gradient.min.css") #if display private #end class __ASSET__styles_gradient_gradient_min_css extends lime.utils.ByteArray {}
@:file("Z:/GitHub/haxeui/assets/styles/gradient/gradient_mobile.css") #if display private #end class __ASSET__styles_gradient_gradient_mobile_css extends lime.utils.ByteArray {}
@:file("Z:/GitHub/haxeui/assets/styles/gradient/gradient_mobile.min.css") #if display private #end class __ASSET__styles_gradient_gradient_mobile_min_css extends lime.utils.ByteArray {}
@:image("Z:/GitHub/haxeui/assets/styles/gradient/gripper_horizontal.png") #if display private #end class __ASSET__styles_gradient_gripper_horizontal_png extends lime.graphics.Image {}
@:image("Z:/GitHub/haxeui/assets/styles/gradient/gripper_horizontal_disabled.png") #if display private #end class __ASSET__styles_gradient_gripper_horizontal_disabled_png extends lime.graphics.Image {}
@:image("Z:/GitHub/haxeui/assets/styles/gradient/gripper_vertical.png") #if display private #end class __ASSET__styles_gradient_gripper_vertical_png extends lime.graphics.Image {}
@:image("Z:/GitHub/haxeui/assets/styles/gradient/gripper_vertical_disabled.png") #if display private #end class __ASSET__styles_gradient_gripper_vertical_disabled_png extends lime.graphics.Image {}
@:image("Z:/GitHub/haxeui/assets/styles/gradient/hsplitter_gripper.png") #if display private #end class __ASSET__styles_gradient_hsplitter_gripper_png extends lime.graphics.Image {}
@:image("Z:/GitHub/haxeui/assets/styles/gradient/vsplitter_gripper.png") #if display private #end class __ASSET__styles_gradient_vsplitter_gripper_png extends lime.graphics.Image {}
@:file("Z:/GitHub/haxeui/assets/styles/windows/accordion.css") #if display private #end class __ASSET__styles_windows_accordion_css extends lime.utils.ByteArray {}
@:file("Z:/GitHub/haxeui/assets/styles/windows/accordion.min.css") #if display private #end class __ASSET__styles_windows_accordion_min_css extends lime.utils.ByteArray {}
@:image("Z:/GitHub/haxeui/assets/styles/windows/button.png") #if display private #end class __ASSET__styles_windows_button_png extends lime.graphics.Image {}
@:file("Z:/GitHub/haxeui/assets/styles/windows/buttons.css") #if display private #end class __ASSET__styles_windows_buttons_css extends lime.utils.ByteArray {}
@:file("Z:/GitHub/haxeui/assets/styles/windows/buttons.min.css") #if display private #end class __ASSET__styles_windows_buttons_min_css extends lime.utils.ByteArray {}
@:file("Z:/GitHub/haxeui/assets/styles/windows/calendar.css") #if display private #end class __ASSET__styles_windows_calendar_css extends lime.utils.ByteArray {}
@:image("Z:/GitHub/haxeui/assets/styles/windows/checkbox.png") #if display private #end class __ASSET__styles_windows_checkbox_png extends lime.graphics.Image {}
@:image("Z:/GitHub/haxeui/assets/styles/windows/container.png") #if display private #end class __ASSET__styles_windows_container_png extends lime.graphics.Image {}
@:image("Z:/GitHub/haxeui/assets/styles/windows/glyphs/down_arrow.png") #if display private #end class __ASSET__styles_windows_glyphs_down_arrow_png extends lime.graphics.Image {}
@:image("Z:/GitHub/haxeui/assets/styles/windows/glyphs/hscroll_thumb_gripper_down.png") #if display private #end class __ASSET__styles_windows_glyphs_hscroll_thumb_gripper_down_png extends lime.graphics.Image {}
@:image("Z:/GitHub/haxeui/assets/styles/windows/glyphs/hscroll_thumb_gripper_over.png") #if display private #end class __ASSET__styles_windows_glyphs_hscroll_thumb_gripper_over_png extends lime.graphics.Image {}
@:image("Z:/GitHub/haxeui/assets/styles/windows/glyphs/hscroll_thumb_gripper_up.png") #if display private #end class __ASSET__styles_windows_glyphs_hscroll_thumb_gripper_up_png extends lime.graphics.Image {}
@:image("Z:/GitHub/haxeui/assets/styles/windows/glyphs/left_arrow.png") #if display private #end class __ASSET__styles_windows_glyphs_left_arrow_png extends lime.graphics.Image {}
@:image("Z:/GitHub/haxeui/assets/styles/windows/glyphs/right_arrow.png") #if display private #end class __ASSET__styles_windows_glyphs_right_arrow_png extends lime.graphics.Image {}
@:image("Z:/GitHub/haxeui/assets/styles/windows/glyphs/up_arrow.png") #if display private #end class __ASSET__styles_windows_glyphs_up_arrow_png extends lime.graphics.Image {}
@:image("Z:/GitHub/haxeui/assets/styles/windows/glyphs/vscroll_thumb_gripper_down.png") #if display private #end class __ASSET__styles_windows_glyphs_vscroll_thumb_gripper_down_png extends lime.graphics.Image {}
@:image("Z:/GitHub/haxeui/assets/styles/windows/glyphs/vscroll_thumb_gripper_over.png") #if display private #end class __ASSET__styles_windows_glyphs_vscroll_thumb_gripper_over_png extends lime.graphics.Image {}
@:image("Z:/GitHub/haxeui/assets/styles/windows/glyphs/vscroll_thumb_gripper_up.png") #if display private #end class __ASSET__styles_windows_glyphs_vscroll_thumb_gripper_up_png extends lime.graphics.Image {}
@:image("Z:/GitHub/haxeui/assets/styles/windows/hprogress.png") #if display private #end class __ASSET__styles_windows_hprogress_png extends lime.graphics.Image {}
@:image("Z:/GitHub/haxeui/assets/styles/windows/hscroll.png") #if display private #end class __ASSET__styles_windows_hscroll_png extends lime.graphics.Image {}
@:file("Z:/GitHub/haxeui/assets/styles/windows/listview.css") #if display private #end class __ASSET__styles_windows_listview_css extends lime.utils.ByteArray {}
@:file("Z:/GitHub/haxeui/assets/styles/windows/listview.min.css") #if display private #end class __ASSET__styles_windows_listview_min_css extends lime.utils.ByteArray {}
@:image("Z:/GitHub/haxeui/assets/styles/windows/listview.png") #if display private #end class __ASSET__styles_windows_listview_png extends lime.graphics.Image {}
@:file("Z:/GitHub/haxeui/assets/styles/windows/menus.css") #if display private #end class __ASSET__styles_windows_menus_css extends lime.utils.ByteArray {}
@:image("Z:/GitHub/haxeui/assets/styles/windows/optionbox.png") #if display private #end class __ASSET__styles_windows_optionbox_png extends lime.graphics.Image {}
@:image("Z:/GitHub/haxeui/assets/styles/windows/popup.png") #if display private #end class __ASSET__styles_windows_popup_png extends lime.graphics.Image {}
@:file("Z:/GitHub/haxeui/assets/styles/windows/popups.css") #if display private #end class __ASSET__styles_windows_popups_css extends lime.utils.ByteArray {}
@:file("Z:/GitHub/haxeui/assets/styles/windows/rtf.css") #if display private #end class __ASSET__styles_windows_rtf_css extends lime.utils.ByteArray {}
@:file("Z:/GitHub/haxeui/assets/styles/windows/scrolls.css") #if display private #end class __ASSET__styles_windows_scrolls_css extends lime.utils.ByteArray {}
@:file("Z:/GitHub/haxeui/assets/styles/windows/scrolls.min.css") #if display private #end class __ASSET__styles_windows_scrolls_min_css extends lime.utils.ByteArray {}
@:file("Z:/GitHub/haxeui/assets/styles/windows/sliders.css") #if display private #end class __ASSET__styles_windows_sliders_css extends lime.utils.ByteArray {}
@:image("Z:/GitHub/haxeui/assets/styles/windows/tab.png") #if display private #end class __ASSET__styles_windows_tab_png extends lime.graphics.Image {}
@:file("Z:/GitHub/haxeui/assets/styles/windows/tabs.css") #if display private #end class __ASSET__styles_windows_tabs_css extends lime.utils.ByteArray {}
@:image("Z:/GitHub/haxeui/assets/styles/windows/textinput.png") #if display private #end class __ASSET__styles_windows_textinput_png extends lime.graphics.Image {}
@:image("Z:/GitHub/haxeui/assets/styles/windows/vprogress.png") #if display private #end class __ASSET__styles_windows_vprogress_png extends lime.graphics.Image {}
@:image("Z:/GitHub/haxeui/assets/styles/windows/vscroll.png") #if display private #end class __ASSET__styles_windows_vscroll_png extends lime.graphics.Image {}
@:file("Z:/GitHub/haxeui/assets/styles/windows/windows.css") #if display private #end class __ASSET__styles_windows_windows_css extends lime.utils.ByteArray {}
@:file("Z:/GitHub/haxeui/assets/fonts/Oxygen-Bold.eot") #if display private #end class __ASSET__fonts_oxygen_bold_eot extends lime.utils.ByteArray {}
@:file("Z:/GitHub/haxeui/assets/fonts/Oxygen-Bold.svg") #if display private #end class __ASSET__fonts_oxygen_bold_svg extends lime.utils.ByteArray {}
@:font("Z:/GitHub/haxeui/assets/fonts/Oxygen-Bold.ttf") #if display private #end class __ASSET__fonts_oxygen_bold_ttf extends lime.text.Font {}
@:file("Z:/GitHub/haxeui/assets/fonts/Oxygen-Bold.woff") #if display private #end class __ASSET__fonts_oxygen_bold_woff extends lime.utils.ByteArray {}
@:file("Z:/GitHub/haxeui/assets/fonts/Oxygen-Bold.woff2") #if display private #end class __ASSET__fonts_oxygen_bold_woff2 extends lime.utils.ByteArray {}
@:file("Z:/GitHub/haxeui/assets/fonts/Oxygen.eot") #if display private #end class __ASSET__fonts_oxygen_eot extends lime.utils.ByteArray {}
@:file("Z:/GitHub/haxeui/assets/fonts/Oxygen.svg") #if display private #end class __ASSET__fonts_oxygen_svg extends lime.utils.ByteArray {}
@:font("Z:/GitHub/haxeui/assets/fonts/Oxygen.ttf") #if display private #end class __ASSET__fonts_oxygen_ttf extends lime.text.Font {}
@:file("Z:/GitHub/haxeui/assets/fonts/Oxygen.woff") #if display private #end class __ASSET__fonts_oxygen_woff extends lime.utils.ByteArray {}
@:file("Z:/GitHub/haxeui/assets/fonts/Oxygen.woff2") #if display private #end class __ASSET__fonts_oxygen_woff2 extends lime.utils.ByteArray {}
@:file("assets/css/desktop.css") #if display private #end class __ASSET__assets_css_desktop_css extends lime.utils.ByteArray {}
@:file("assets/css/main.css") #if display private #end class __ASSET__assets_css_main_css extends lime.utils.ByteArray {}
@:file("assets/css/main.min.css") #if display private #end class __ASSET__assets_css_main_min_css extends lime.utils.ByteArray {}
@:file("assets/css/mobile.css") #if display private #end class __ASSET__assets_css_mobile_css extends lime.utils.ByteArray {}
@:file("assets/css/mobile.min.css") #if display private #end class __ASSET__assets_css_mobile_min_css extends lime.utils.ByteArray {}
@:file("assets/examples/eg1/manifest.xml") #if display private #end class __ASSET__assets_examples_eg1_manifest_xml extends lime.utils.ByteArray {}
@:font("assets/fonts/OpenSans-Bold.ttf") #if display private #end class __ASSET__assets_fonts_opensans_bold_ttf extends lime.text.Font {}
@:font("assets/fonts/OpenSans-Italic.ttf") #if display private #end class __ASSET__assets_fonts_opensans_italic_ttf extends lime.text.Font {}
@:font("assets/fonts/OpenSans-Regular.ttf") #if display private #end class __ASSET__assets_fonts_opensans_regular_ttf extends lime.text.Font {}
@:font("assets/fonts/OpenSans-Semibold.ttf") #if display private #end class __ASSET__assets_fonts_opensans_semibold_ttf extends lime.text.Font {}
@:font("assets/fonts/Roboto-Bold.ttf") #if display private #end class __ASSET__assets_fonts_roboto_bold_ttf extends lime.text.Font {}
@:font("assets/fonts/Roboto-Italic.ttf") #if display private #end class __ASSET__assets_fonts_roboto_italic_ttf extends lime.text.Font {}
@:font("assets/fonts/Roboto-Medium.ttf") #if display private #end class __ASSET__assets_fonts_roboto_medium_ttf extends lime.text.Font {}
@:font("assets/fonts/Roboto-Regular.ttf") #if display private #end class __ASSET__assets_fonts_roboto_regular_ttf extends lime.text.Font {}
@:image("assets/haxeui.png") #if display private #end class __ASSET__assets_haxeui_png extends lime.graphics.Image {}
@:file("assets/haxe_ui_plain.svg") #if display private #end class __ASSET__assets_haxe_ui_plain_svg extends lime.utils.ByteArray {}
@:image("assets/icons/back_32.png") #if display private #end class __ASSET__assets_icons_back_32_png extends lime.graphics.Image {}
@:image("assets/icons/forward_32.png") #if display private #end class __ASSET__assets_icons_forward_32_png extends lime.graphics.Image {}
@:image("assets/icons/menu_32.png") #if display private #end class __ASSET__assets_icons_menu_32_png extends lime.graphics.Image {}
@:image("assets/img/a.png") #if display private #end class __ASSET__assets_img_a_png extends lime.graphics.Image {}
@:image("assets/img/folder_32.png") #if display private #end class __ASSET__assets_img_folder_32_png extends lime.graphics.Image {}
@:file("assets/ui/about.xml") #if display private #end class __ASSET__assets_ui_about_xml extends lime.utils.ByteArray {}
@:file("assets/ui/list.xml") #if display private #end class __ASSET__assets_ui_list_xml extends lime.utils.ByteArray {}
@:file("assets/ui/main.xml") #if display private #end class __ASSET__assets_ui_main_xml extends lime.utils.ByteArray {}
@:file("assets/ui/menu.xml") #if display private #end class __ASSET__assets_ui_menu_xml extends lime.utils.ByteArray {}
@:file("assets/ui/start.xml") #if display private #end class __ASSET__assets_ui_start_xml extends lime.utils.ByteArray {}
@:file("assets/ui/update.xml") #if display private #end class __ASSET__assets_ui_update_xml extends lime.utils.ByteArray {}
@:file("assets/ui/wizard.xml") #if display private #end class __ASSET__assets_ui_wizard_xml extends lime.utils.ByteArray {}
@:file("assets/css/desktop.css") #if display private #end class __ASSET__css_desktop_css extends lime.utils.ByteArray {}
@:file("assets/css/main.css") #if display private #end class __ASSET__css_main_css extends lime.utils.ByteArray {}
@:file("assets/css/main.min.css") #if display private #end class __ASSET__css_main_min_css extends lime.utils.ByteArray {}
@:file("assets/css/mobile.css") #if display private #end class __ASSET__css_mobile_css extends lime.utils.ByteArray {}
@:file("assets/css/mobile.min.css") #if display private #end class __ASSET__css_mobile_min_css extends lime.utils.ByteArray {}
@:file("assets/ui/about.xml") #if display private #end class __ASSET__ui_about_xml extends lime.utils.ByteArray {}
@:file("assets/ui/list.xml") #if display private #end class __ASSET__ui_list_xml extends lime.utils.ByteArray {}
@:file("assets/ui/main.xml") #if display private #end class __ASSET__ui_main_xml extends lime.utils.ByteArray {}
@:file("assets/ui/menu.xml") #if display private #end class __ASSET__ui_menu_xml extends lime.utils.ByteArray {}
@:file("assets/ui/start.xml") #if display private #end class __ASSET__ui_start_xml extends lime.utils.ByteArray {}
@:file("assets/ui/update.xml") #if display private #end class __ASSET__ui_update_xml extends lime.utils.ByteArray {}
@:file("assets/ui/wizard.xml") #if display private #end class __ASSET__ui_wizard_xml extends lime.utils.ByteArray {}
@:font("assets/fonts/OpenSans-Bold.ttf") #if display private #end class __ASSET__fonts_opensans_bold_ttf extends lime.text.Font {}
@:font("assets/fonts/OpenSans-Italic.ttf") #if display private #end class __ASSET__fonts_opensans_italic_ttf extends lime.text.Font {}
@:font("assets/fonts/OpenSans-Regular.ttf") #if display private #end class __ASSET__fonts_opensans_regular_ttf extends lime.text.Font {}
@:font("assets/fonts/OpenSans-Semibold.ttf") #if display private #end class __ASSET__fonts_opensans_semibold_ttf extends lime.text.Font {}
@:font("assets/fonts/Roboto-Bold.ttf") #if display private #end class __ASSET__fonts_roboto_bold_ttf extends lime.text.Font {}
@:font("assets/fonts/Roboto-Italic.ttf") #if display private #end class __ASSET__fonts_roboto_italic_ttf extends lime.text.Font {}
@:font("assets/fonts/Roboto-Medium.ttf") #if display private #end class __ASSET__fonts_roboto_medium_ttf extends lime.text.Font {}
@:font("assets/fonts/Roboto-Regular.ttf") #if display private #end class __ASSET__fonts_roboto_regular_ttf extends lime.text.Font {}
@:image("assets/icons/back_32.png") #if display private #end class __ASSET__icons_back_32_png extends lime.graphics.Image {}
@:image("assets/icons/forward_32.png") #if display private #end class __ASSET__icons_forward_32_png extends lime.graphics.Image {}
@:image("assets/icons/menu_32.png") #if display private #end class __ASSET__icons_menu_32_png extends lime.graphics.Image {}
@:image("assets/img/a.png") #if display private #end class __ASSET__img_a_png extends lime.graphics.Image {}
@:image("assets/img/folder_32.png") #if display private #end class __ASSET__img_folder_32_png extends lime.graphics.Image {}
@:file("assets/examples/eg1/manifest.xml") #if display private #end class __ASSET__examples_eg1_manifest_xml extends lime.utils.ByteArray {}



#end
#end

#if (openfl && !flash)
@:keep #if display private #end class __ASSET__OPENFL__fonts_oxygen_bold_ttf extends openfl.text.Font { public function new () { var font = new __ASSET__fonts_oxygen_bold_ttf (); src = font.src; name = font.name; super (); }}
@:keep #if display private #end class __ASSET__OPENFL__fonts_oxygen_ttf extends openfl.text.Font { public function new () { var font = new __ASSET__fonts_oxygen_ttf (); src = font.src; name = font.name; super (); }}
@:keep #if display private #end class __ASSET__OPENFL__assets_fonts_opensans_bold_ttf extends openfl.text.Font { public function new () { var font = new __ASSET__assets_fonts_opensans_bold_ttf (); src = font.src; name = font.name; super (); }}
@:keep #if display private #end class __ASSET__OPENFL__assets_fonts_opensans_italic_ttf extends openfl.text.Font { public function new () { var font = new __ASSET__assets_fonts_opensans_italic_ttf (); src = font.src; name = font.name; super (); }}
@:keep #if display private #end class __ASSET__OPENFL__assets_fonts_opensans_regular_ttf extends openfl.text.Font { public function new () { var font = new __ASSET__assets_fonts_opensans_regular_ttf (); src = font.src; name = font.name; super (); }}
@:keep #if display private #end class __ASSET__OPENFL__assets_fonts_opensans_semibold_ttf extends openfl.text.Font { public function new () { var font = new __ASSET__assets_fonts_opensans_semibold_ttf (); src = font.src; name = font.name; super (); }}
@:keep #if display private #end class __ASSET__OPENFL__assets_fonts_roboto_bold_ttf extends openfl.text.Font { public function new () { var font = new __ASSET__assets_fonts_roboto_bold_ttf (); src = font.src; name = font.name; super (); }}
@:keep #if display private #end class __ASSET__OPENFL__assets_fonts_roboto_italic_ttf extends openfl.text.Font { public function new () { var font = new __ASSET__assets_fonts_roboto_italic_ttf (); src = font.src; name = font.name; super (); }}
@:keep #if display private #end class __ASSET__OPENFL__assets_fonts_roboto_medium_ttf extends openfl.text.Font { public function new () { var font = new __ASSET__assets_fonts_roboto_medium_ttf (); src = font.src; name = font.name; super (); }}
@:keep #if display private #end class __ASSET__OPENFL__assets_fonts_roboto_regular_ttf extends openfl.text.Font { public function new () { var font = new __ASSET__assets_fonts_roboto_regular_ttf (); src = font.src; name = font.name; super (); }}
@:keep #if display private #end class __ASSET__OPENFL__fonts_opensans_bold_ttf extends openfl.text.Font { public function new () { var font = new __ASSET__fonts_opensans_bold_ttf (); src = font.src; name = font.name; super (); }}
@:keep #if display private #end class __ASSET__OPENFL__fonts_opensans_italic_ttf extends openfl.text.Font { public function new () { var font = new __ASSET__fonts_opensans_italic_ttf (); src = font.src; name = font.name; super (); }}
@:keep #if display private #end class __ASSET__OPENFL__fonts_opensans_regular_ttf extends openfl.text.Font { public function new () { var font = new __ASSET__fonts_opensans_regular_ttf (); src = font.src; name = font.name; super (); }}
@:keep #if display private #end class __ASSET__OPENFL__fonts_opensans_semibold_ttf extends openfl.text.Font { public function new () { var font = new __ASSET__fonts_opensans_semibold_ttf (); src = font.src; name = font.name; super (); }}
@:keep #if display private #end class __ASSET__OPENFL__fonts_roboto_bold_ttf extends openfl.text.Font { public function new () { var font = new __ASSET__fonts_roboto_bold_ttf (); src = font.src; name = font.name; super (); }}
@:keep #if display private #end class __ASSET__OPENFL__fonts_roboto_italic_ttf extends openfl.text.Font { public function new () { var font = new __ASSET__fonts_roboto_italic_ttf (); src = font.src; name = font.name; super (); }}
@:keep #if display private #end class __ASSET__OPENFL__fonts_roboto_medium_ttf extends openfl.text.Font { public function new () { var font = new __ASSET__fonts_roboto_medium_ttf (); src = font.src; name = font.name; super (); }}
@:keep #if display private #end class __ASSET__OPENFL__fonts_roboto_regular_ttf extends openfl.text.Font { public function new () { var font = new __ASSET__fonts_roboto_regular_ttf (); src = font.src; name = font.name; super (); }}

#end

#end