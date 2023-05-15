<!-- HTML header for doxygen 1.8.20-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "https://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<!-- Mirrored from www.open3d.org/docs/release/cpp_api/_visualizer_with_custom_animation_8cpp.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 14 May 2023 11:01:57 GMT -->
<head>
<meta http-equiv="Content-Type" content="text/xhtml;charset=UTF-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=9"/>
<meta name="generator" content="Doxygen 1.9.1"/>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<title>Open3D (C++ API): /home/runner/work/Open3D/Open3D/cpp/open3d/visualization/visualizer/VisualizerWithCustomAnimation.cpp File Reference</title>
<link href="tabs.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="jquery.js"></script>
<script type="text/javascript" src="dynsections.js"></script>
<link href="search/search.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="search/searchdata.js"></script>
<script type="text/javascript" src="search/search.js"></script>
<script type="text/x-mathjax-config">
  MathJax.Hub.Config({
    extensions: ["tex2jax.js", "TeX/AMSmath.html", "TeX/AMSsymbols.js"],
    jax: ["input/TeX","output/HTML-CSS"],
});
</script>
<script type="text/javascript" async="async" src="../../../../cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.2/MathJax.js"></script>
<link href="doxygen.css" rel="stylesheet" type="text/css" />
<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-3TQPKGV6Z3"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', 'G-3TQPKGV6Z3');
</script>
</head>
<body>
<div id="top"><!-- do not remove this div, it is closed by doxygen! -->
<div id="titlearea">
<table cellspacing="0" cellpadding="0">
 <tbody>
 <tr style="height: 56px;">
  <td id="projectlogo"><img alt="Logo" src="open3d_logo.ico"/></td>
  <td id="projectalign" style="padding-left: 0.5em;">
   <div id="projectname">Open3D (C++ API)
   &#160;<span id="projectnumber">0.17.0</span>
   </div>
  </td>
 </tr>
 </tbody>
</table>
</div>
<!-- end header part -->
<!-- Generated by Doxygen 1.9.1 -->
<script type="text/javascript">
/* @license magnet:?xt=urn:btih:cf05388f2679ee054f2beb29a391d25f4e673ac3&amp;dn=gpl-2.0.txt GPL-v2 */
var searchBox = new SearchBox("searchBox", "search",false,'Search','.html');
/* @license-end */
</script>
<script type="text/javascript" src="menudata.js"></script>
<script type="text/javascript" src="menu.js"></script>
<script type="text/javascript">
/* @license magnet:?xt=urn:btih:cf05388f2679ee054f2beb29a391d25f4e673ac3&amp;dn=gpl-2.0.txt GPL-v2 */
$(function() {
  initMenu('',true,false,'search.html','Search');
  $(document).ready(function() { init_search(); });
});
/* @license-end */</script>
<div id="main-nav"></div>
<!-- window showing the filter options -->
<div id="MSearchSelectWindow"
     onmouseover="return searchBox.OnSearchSelectShow()"
     onmouseout="return searchBox.OnSearchSelectHide()"
     onkeydown="return searchBox.OnSearchSelectKey(event)">
</div>

<!-- iframe showing the search results (closed by default) -->
<div id="MSearchResultsWindow">
<iframe src="javascript:void(0)" frameborder="0" 
        name="MSearchResults" id="MSearchResults">
</iframe>
</div>

<div id="nav-path" class="navpath">
  <ul>
<li class="navelem"><a class="el" href="dir_df511e5bd85cec96854b39d5e1c27aa8.357.del">cpp</a></li><li class="navelem"><a class="el" href="dir_f8cc15b2217ff526bd336cf17635da2a.358.del">open3d</a></li><li class="navelem"><a class="el" href="dir_24afd032cc75c1c3607b086ffced3f32.4b6.del">visualization</a></li><li class="navelem"><a class="el" href="dir_a5fdd614dbbd13c2a4171f13c9376129.519.del">visualizer</a></li>  </ul>
</div>
</div><!-- top -->
<div class="header">
  <div class="summary">
<a href="#namespaces">Namespaces</a>  </div>
  <div class="headertitle">
<div class="title">VisualizerWithCustomAnimation.cpp File Reference</div>  </div>
</div><!--header-->
<div class="contents">
<h3 class="version">(9238339 (Tue Mar 14 18:49:09 2023 -0700))</h3><div class="textblock"><code>#include &quot;<a class="el" href="_visualizer_with_custom_animation_8h_source">open3d/visualization/visualizer/VisualizerWithCustomAnimation.h</a>&quot;</code><br />
<code>#include &lt;thread&gt;</code><br />
<code>#include &quot;<a class="el" href="_pinhole_camera_trajectory_8h_source.540.del">open3d/camera/PinholeCameraTrajectory.h</a>&quot;</code><br />
<code>#include &quot;<a class="el" href="_i_json_convertible_i_o_8h_source.4fd.delaye">open3d/io/IJsonConvertibleIO.h</a>&quot;</code><br />
<code>#include &quot;<a class="el" href="_file_system_8h_source.html">open3d/utility/FileSystem.h</a>&quot;</code><br />
<code>#include &quot;<a class="el" href="_logging_8h_source.html">open3d/utility/Logging.h</a>&quot;</code><br />
<code>#include &quot;<a class="el" href="utility_2_progress_bar_8h_source.html">open3d/utility/ProgressBar.h</a>&quot;</code><br />
<code>#include &quot;<a class="el" href="_view_control_with_custom_animation_8h_sourc">open3d/visualization/visualizer/ViewControlWithCustomAnimation.h</a>&quot;</code><br />
</div><table class="memberdecls">
<tr class="heading"><td colspan="2"><h2 class="groupheader"><a name="namespaces"></a>
Namespaces</h2></td></tr>
<tr class="memitem:namespaceopen3d"><td class="memItemLeft" align="right" valign="top"> &#160;</td><td class="memItemRight" valign="bottom"><a class="el" href="namespaceopen3d.html">open3d</a></td></tr>
<tr class="separator:"><td class="memSeparator" colspan="2">&#160;</td></tr>
<tr class="memitem:namespaceopen3d_1_1visualization"><td class="memItemLeft" align="right" valign="top"> &#160;</td><td class="memItemRight" valign="bottom"><a class="el" href="namespaceopen3d_1_1visualization.html">open3d::visualization</a></td></tr>
<tr class="separator:"><td class="memSeparator" colspan="2">&#160;</td></tr>
</table>
</div><!-- contents -->
<!-- start footer part -->
<hr class="footer"/><address class="footer"><small>
Generated by&#160;<a href="https://www.doxygen.org/index.html"><img class="footer" src="doxygen.svg" width="104" height="31" alt="doxygen"/></a> 1.9.1
</small></address>
</body>

<!-- Mirrored from www.open3d.org/docs/release/cpp_api/_visualizer_with_custom_animation_8cpp.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 14 May 2023 11:01:57 GMT -->
</html>
