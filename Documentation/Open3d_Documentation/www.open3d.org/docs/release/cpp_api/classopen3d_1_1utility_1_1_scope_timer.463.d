<!-- HTML header for doxygen 1.8.20-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "https://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<!-- Mirrored from www.open3d.org/docs/release/cpp_api/classopen3d_1_1utility_1_1_scope_timer.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 14 May 2023 10:56:43 GMT -->
<head>
<meta http-equiv="Content-Type" content="text/xhtml;charset=UTF-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=9"/>
<meta name="generator" content="Doxygen 1.9.1"/>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<title>Open3D (C++ API): open3d::utility::ScopeTimer Class Reference</title>
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
<li class="navelem"><a class="el" href="namespaceopen3d.html">open3d</a></li><li class="navelem"><a class="el" href="namespaceopen3d_1_1utility.html">utility</a></li><li class="navelem"><a class="el" href="classopen3d_1_1utility_1_1_scope_timer.463.d">ScopeTimer</a></li>  </ul>
</div>
</div><!-- top -->
<div class="header">
  <div class="summary">
<a href="#pub-methods">Public Member Functions</a>  </div>
  <div class="headertitle">
<div class="title">open3d::utility::ScopeTimer Class Reference</div>  </div>
</div><!--header-->
<div class="contents">

<p><code>#include &lt;<a class="el" href="_timer_8h_source.html">Timer.h</a>&gt;</code></p>
<div class="dynheader">
Inheritance diagram for open3d::utility::ScopeTimer:</div>
<div class="dyncontent">
 <div class="center">
  <img src="classopen3d_1_1utility_1_1_scope_timer.6cf.d" usemap="#open3d::utility::ScopeTimer_map" alt=""/>
  <map id="open3d::utility::ScopeTimer_map" name="open3d::utility::ScopeTimer_map">
<area href="classopen3d_1_1utility_1_1_timer.html" alt="open3d::utility::Timer" shape="rect" coords="0,0,162,24"/>
  </map>
</div></div>
<table class="memberdecls">
<tr class="heading"><td colspan="2"><h2 class="groupheader"><a name="pub-methods"></a>
Public Member Functions</h2></td></tr>
<tr class="memitem:a55cb27e086770cce8e6a59ecac31a475"><td class="memItemLeft" align="right" valign="top">&#160;</td><td class="memItemRight" valign="bottom"><a class="el" href="classopen3d_1_1utility_1_1_scope_timer.463.d#a55cb27e086770cce8e6a59ecac31a475">ScopeTimer</a> (const std::string &amp;scope_timer_info=&quot;&quot;)</td></tr>
<tr class="separator:a55cb27e086770cce8e6a59ecac31a475"><td class="memSeparator" colspan="2">&#160;</td></tr>
<tr class="memitem:ae89462502c3047f965e1c3085c6b29f2"><td class="memItemLeft" align="right" valign="top">&#160;</td><td class="memItemRight" valign="bottom"><a class="el" href="classopen3d_1_1utility_1_1_scope_timer.463.d#ae89462502c3047f965e1c3085c6b29f2">~ScopeTimer</a> ()</td></tr>
<tr class="separator:ae89462502c3047f965e1c3085c6b29f2"><td class="memSeparator" colspan="2">&#160;</td></tr>
<tr class="inherit_header pub_methods_classopen3d_1_1utility_1_1_timer"><td colspan="2" onclick="javascript:toggleInherit('pub_methods_classopen3d_1_1utility_1_1_timer')"><img src="closed.png" alt="-"/>&#160;Public Member Functions inherited from <a class="el" href="classopen3d_1_1utility_1_1_timer.html">open3d::utility::Timer</a></td></tr>
<tr class="memitem:af667e775c9ebb2c40d6155e005f777b5 inherit pub_methods_classopen3d_1_1utility_1_1_timer"><td class="memItemLeft" align="right" valign="top">&#160;</td><td class="memItemRight" valign="bottom"><a class="el" href="classopen3d_1_1utility_1_1_timer.html#af667e775c9ebb2c40d6155e005f777b5">Timer</a> ()</td></tr>
<tr class="separator:af667e775c9ebb2c40d6155e005f777b5 inherit pub_methods_classopen3d_1_1utility_1_1_timer"><td class="memSeparator" colspan="2">&#160;</td></tr>
<tr class="memitem:a3af6fcb47d704e43e1ca08bac82e7896 inherit pub_methods_classopen3d_1_1utility_1_1_timer"><td class="memItemLeft" align="right" valign="top">&#160;</td><td class="memItemRight" valign="bottom"><a class="el" href="classopen3d_1_1utility_1_1_timer.html#a3af6fcb47d704e43e1ca08bac82e7896">~Timer</a> ()</td></tr>
<tr class="separator:a3af6fcb47d704e43e1ca08bac82e7896 inherit pub_methods_classopen3d_1_1utility_1_1_timer"><td class="memSeparator" colspan="2">&#160;</td></tr>
<tr class="memitem:a8b892d4f27c532e8d60bb527a9795296 inherit pub_methods_classopen3d_1_1utility_1_1_timer"><td class="memItemLeft" align="right" valign="top">void&#160;</td><td class="memItemRight" valign="bottom"><a class="el" href="classopen3d_1_1utility_1_1_timer.html#a8b892d4f27c532e8d60bb527a9795296">Start</a> ()</td></tr>
<tr class="separator:a8b892d4f27c532e8d60bb527a9795296 inherit pub_methods_classopen3d_1_1utility_1_1_timer"><td class="memSeparator" colspan="2">&#160;</td></tr>
<tr class="memitem:ad0bc6aab45cdc1c02c72fe1ac08dc70e inherit pub_methods_classopen3d_1_1utility_1_1_timer"><td class="memItemLeft" align="right" valign="top">void&#160;</td><td class="memItemRight" valign="bottom"><a class="el" href="classopen3d_1_1utility_1_1_timer.html#ad0bc6aab45cdc1c02c72fe1ac08dc70e">Stop</a> ()</td></tr>
<tr class="separator:ad0bc6aab45cdc1c02c72fe1ac08dc70e inherit pub_methods_classopen3d_1_1utility_1_1_timer"><td class="memSeparator" colspan="2">&#160;</td></tr>
<tr class="memitem:a5fdf34bb6587763b2f8e0d353309ebee inherit pub_methods_classopen3d_1_1utility_1_1_timer"><td class="memItemLeft" align="right" valign="top">void&#160;</td><td class="memItemRight" valign="bottom"><a class="el" href="classopen3d_1_1utility_1_1_timer.html#a5fdf34bb6587763b2f8e0d353309ebee">Print</a> (const std::string &amp;timer_info) const</td></tr>
<tr class="separator:a5fdf34bb6587763b2f8e0d353309ebee inherit pub_methods_classopen3d_1_1utility_1_1_timer"><td class="memSeparator" colspan="2">&#160;</td></tr>
<tr class="memitem:a198267882d221315f260d231da3f3ad1 inherit pub_methods_classopen3d_1_1utility_1_1_timer"><td class="memItemLeft" align="right" valign="top">double&#160;</td><td class="memItemRight" valign="bottom"><a class="el" href="classopen3d_1_1utility_1_1_timer.html#a198267882d221315f260d231da3f3ad1">GetDurationInSecond</a> () const</td></tr>
<tr class="separator:a198267882d221315f260d231da3f3ad1 inherit pub_methods_classopen3d_1_1utility_1_1_timer"><td class="memSeparator" colspan="2">&#160;</td></tr>
<tr class="memitem:a71344ebeea2f7f332d461a9004432a5f inherit pub_methods_classopen3d_1_1utility_1_1_timer"><td class="memItemLeft" align="right" valign="top">double&#160;</td><td class="memItemRight" valign="bottom"><a class="el" href="classopen3d_1_1utility_1_1_timer.html#a71344ebeea2f7f332d461a9004432a5f">GetDurationInMillisecond</a> () const</td></tr>
<tr class="separator:a71344ebeea2f7f332d461a9004432a5f inherit pub_methods_classopen3d_1_1utility_1_1_timer"><td class="memSeparator" colspan="2">&#160;</td></tr>
<tr class="memitem:a2334dcad46b192fa77efd26b00162752 inherit pub_methods_classopen3d_1_1utility_1_1_timer"><td class="memItemLeft" align="right" valign="top">std::tuple&lt; int, int, double &gt;&#160;</td><td class="memItemRight" valign="bottom"><a class="el" href="classopen3d_1_1utility_1_1_timer.html#a2334dcad46b192fa77efd26b00162752">GetDurationInHMS</a> () const</td></tr>
<tr class="separator:a2334dcad46b192fa77efd26b00162752 inherit pub_methods_classopen3d_1_1utility_1_1_timer"><td class="memSeparator" colspan="2">&#160;</td></tr>
</table><table class="memberdecls">
<tr class="heading"><td colspan="2"><h2 class="groupheader"><a name="inherited"></a>
Additional Inherited Members</h2></td></tr>
<tr class="inherit_header pub_static_methods_classopen3d_1_1utility_1_1_timer"><td colspan="2" onclick="javascript:toggleInherit('pub_static_methods_classopen3d_1_1utility_1_1_timer')"><img src="closed.png" alt="-"/>&#160;Static Public Member Functions inherited from <a class="el" href="classopen3d_1_1utility_1_1_timer.html">open3d::utility::Timer</a></td></tr>
<tr class="memitem:abaa0971339006fd5158090e7973e3e9f inherit pub_static_methods_classopen3d_1_1utility_1_1_timer"><td class="memItemLeft" align="right" valign="top">static double&#160;</td><td class="memItemRight" valign="bottom"><a class="el" href="classopen3d_1_1utility_1_1_timer.html#abaa0971339006fd5158090e7973e3e9f">GetSystemTimeInMilliseconds</a> ()</td></tr>
<tr class="separator:abaa0971339006fd5158090e7973e3e9f inherit pub_static_methods_classopen3d_1_1utility_1_1_timer"><td class="memSeparator" colspan="2">&#160;</td></tr>
</table>
<h2 class="groupheader">Constructor &amp; Destructor Documentation</h2>
<a id="a55cb27e086770cce8e6a59ecac31a475"></a>
<h2 class="memtitle"><span class="permalink"><a href="#a55cb27e086770cce8e6a59ecac31a475">&#9670;&nbsp;</a></span>ScopeTimer()</h2>

<div class="memitem">
<div class="memproto">
      <table class="memname">
        <tr>
          <td class="memname">open3d::utility::ScopeTimer::ScopeTimer </td>
          <td>(</td>
          <td class="paramtype">const std::string &amp;&#160;</td>
          <td class="paramname"><em>scope_timer_info</em> = <code>&quot;&quot;</code></td><td>)</td>
          <td></td>
        </tr>
      </table>
</div><div class="memdoc">

</div>
</div>
<a id="ae89462502c3047f965e1c3085c6b29f2"></a>
<h2 class="memtitle"><span class="permalink"><a href="#ae89462502c3047f965e1c3085c6b29f2">&#9670;&nbsp;</a></span>~ScopeTimer()</h2>

<div class="memitem">
<div class="memproto">
      <table class="memname">
        <tr>
          <td class="memname">open3d::utility::ScopeTimer::~ScopeTimer </td>
          <td>(</td>
          <td class="paramname"></td><td>)</td>
          <td></td>
        </tr>
      </table>
</div><div class="memdoc">

</div>
</div>
<hr/>The documentation for this class was generated from the following files:<ul>
<li>/home/runner/work/Open3D/Open3D/cpp/open3d/utility/<a class="el" href="_timer_8h_source.html">Timer.h (9238339 (Tue Mar 14 18:49:09 2023 -0700))</a></li>
<li>/home/runner/work/Open3D/Open3D/cpp/open3d/utility/<a class="el" href="_timer_8cpp.html">Timer.cpp (9238339 (Tue Mar 14 18:49:09 2023 -0700))</a></li>
</ul>
</div><!-- contents -->
<!-- start footer part -->
<hr class="footer"/><address class="footer"><small>
Generated by&#160;<a href="https://www.doxygen.org/index.html"><img class="footer" src="doxygen.svg" width="104" height="31" alt="doxygen"/></a> 1.9.1
</small></address>
</body>

<!-- Mirrored from www.open3d.org/docs/release/cpp_api/classopen3d_1_1utility_1_1_scope_timer.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 14 May 2023 10:56:43 GMT -->
</html>
