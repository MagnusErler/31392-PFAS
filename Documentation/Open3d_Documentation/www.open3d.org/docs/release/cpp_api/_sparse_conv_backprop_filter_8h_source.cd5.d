<!-- HTML header for doxygen 1.8.20-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "https://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<!-- Mirrored from www.open3d.org/docs/release/cpp_api/_sparse_conv_backprop_filter_8h_source.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 14 May 2023 11:04:55 GMT -->
<head>
<meta http-equiv="Content-Type" content="text/xhtml;charset=UTF-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=9"/>
<meta name="generator" content="Doxygen 1.9.1"/>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<title>Open3D (C++ API): /home/runner/work/Open3D/Open3D/cpp/open3d/ml/impl/sparse_conv/SparseConvBackpropFilter.h (9238339 (Tue Mar 14 18:49:09 2023 -0700)) Source File</title>
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
<li class="navelem"><a class="el" href="dir_df511e5bd85cec96854b39d5e1c27aa8.357.del">cpp</a></li><li class="navelem"><a class="el" href="dir_f8cc15b2217ff526bd336cf17635da2a.358.del">open3d</a></li><li class="navelem"><a class="el" href="dir_b383250e6a9804e003b118f7109c729e.4d9.del">ml</a></li><li class="navelem"><a class="el" href="dir_d2402e7861dbbf5555a99e031eda3ca3.8e8.del">impl</a></li><li class="navelem"><a class="el" href="dir_e476ebaabcae68b847fc36240619236d.c12.del">sparse_conv</a></li>  </ul>
</div>
</div><!-- top -->
<div class="header">
  <div class="headertitle">
<div class="title">SparseConvBackpropFilter.h</div>  </div>
</div><!--header-->
<div class="contents">
<a href="_sparse_conv_backprop_filter_8h.html">Go to the documentation of this file.</a><div class="fragment"><div class="line"><a name="l00001"></a><span class="lineno">    1</span>&#160;<span class="comment">// ----------------------------------------------------------------------------</span></div>
<div class="line"><a name="l00002"></a><span class="lineno">    2</span>&#160;<span class="comment">// -                        Open3D: www.open3d.org                            -</span></div>
<div class="line"><a name="l00003"></a><span class="lineno">    3</span>&#160;<span class="comment">// ----------------------------------------------------------------------------</span></div>
<div class="line"><a name="l00004"></a><span class="lineno">    4</span>&#160;<span class="comment">// Copyright (c) 2018-2023 www.open3d.org</span></div>
<div class="line"><a name="l00005"></a><span class="lineno">    5</span>&#160;<span class="comment">// SPDX-License-Identifier: MIT</span></div>
<div class="line"><a name="l00006"></a><span class="lineno">    6</span>&#160;<span class="comment">// ----------------------------------------------------------------------------</span></div>
<div class="line"><a name="l00007"></a><span class="lineno">    7</span>&#160; </div>
<div class="line"><a name="l00008"></a><span class="lineno">    8</span>&#160;<span class="preprocessor">#pragma once</span></div>
<div class="line"><a name="l00009"></a><span class="lineno">    9</span>&#160;<span class="preprocessor">#include &lt;tbb/parallel_for.h&gt;</span></div>
<div class="line"><a name="l00010"></a><span class="lineno">   10</span>&#160; </div>
<div class="line"><a name="l00011"></a><span class="lineno">   11</span>&#160;<span class="preprocessor">#include &lt;Eigen/Core&gt;</span></div>
<div class="line"><a name="l00012"></a><span class="lineno">   12</span>&#160;<span class="preprocessor">#include &lt;mutex&gt;</span></div>
<div class="line"><a name="l00013"></a><span class="lineno">   13</span>&#160; </div>
<div class="line"><a name="l00014"></a><span class="lineno">   14</span>&#160;<span class="keyword">namespace </span><a class="code" href="namespaceopen3d.html">open3d</a> {</div>
<div class="line"><a name="l00015"></a><span class="lineno">   15</span>&#160;<span class="keyword">namespace </span>ml {</div>
<div class="line"><a name="l00016"></a><span class="lineno">   16</span>&#160;<span class="keyword">namespace </span>impl {</div>
<div class="line"><a name="l00017"></a><span class="lineno">   17</span>&#160; </div>
<div class="line"><a name="l00018"></a><span class="lineno">   18</span>&#160;<span class="comment">// Implementation of SparseConvBackropFilterCPU</span></div>
<div class="line"><a name="l00019"></a><span class="lineno">   19</span>&#160;<span class="keyword">template</span> &lt;<span class="keyword">class </span>TFeat,</div>
<div class="line"><a name="l00020"></a><span class="lineno">   20</span>&#160;          <span class="keyword">class </span>TOut,</div>
<div class="line"><a name="l00021"></a><span class="lineno">   21</span>&#160;          <span class="keyword">class </span>TIndex,</div>
<div class="line"><a name="l00022"></a><span class="lineno">   22</span>&#160;          <span class="keyword">class </span>TKernelIndex,</div>
<div class="line"><a name="l00023"></a><span class="lineno">   23</span>&#160;          <span class="keywordtype">bool</span> POINT_IMPORTANCE&gt;</div>
<div class="line"><a name="l00024"></a><span class="lineno"><a class="line" href="namespaceopen3d_1_1ml_1_1impl.html#a63a896262f55b1d3ae980406434a80e4">   24</a></span>&#160;<span class="keywordtype">void</span> <a class="code" href="namespaceopen3d_1_1ml_1_1impl.html#a63a896262f55b1d3ae980406434a80e4">_SparseConvBackropFilterCPU</a>(TOut* filter_backprop,</div>
<div class="line"><a name="l00025"></a><span class="lineno">   25</span>&#160;                                 <span class="keyword">const</span> std::vector&lt;int&gt;&amp; filter_dims,</div>
<div class="line"><a name="l00026"></a><span class="lineno">   26</span>&#160;                                 <span class="keywordtype">size_t</span> num_out,</div>
<div class="line"><a name="l00027"></a><span class="lineno">   27</span>&#160;                                 <span class="keywordtype">size_t</span> num_inp,</div>
<div class="line"><a name="l00028"></a><span class="lineno">   28</span>&#160;                                 <span class="keyword">const</span> TFeat* inp_features,</div>
<div class="line"><a name="l00029"></a><span class="lineno">   29</span>&#160;                                 <span class="keyword">const</span> TFeat* inp_importance,</div>
<div class="line"><a name="l00030"></a><span class="lineno">   30</span>&#160;                                 <span class="keyword">const</span> TIndex* neighbors_index,</div>
<div class="line"><a name="l00031"></a><span class="lineno">   31</span>&#160;                                 <span class="keyword">const</span> TKernelIndex* neighbors_kernel_index,</div>
<div class="line"><a name="l00032"></a><span class="lineno">   32</span>&#160;                                 <span class="keyword">const</span> TFeat* neighbors_importance,</div>
<div class="line"><a name="l00033"></a><span class="lineno">   33</span>&#160;                                 <span class="keyword">const</span> int64_t* neighbors_row_splits,</div>
<div class="line"><a name="l00034"></a><span class="lineno">   34</span>&#160;                                 <span class="keyword">const</span> TFeat* out_features_gradient,</div>
<div class="line"><a name="l00035"></a><span class="lineno">   35</span>&#160;                                 <span class="keywordtype">bool</span> normalize) {</div>
<div class="line"><a name="l00036"></a><span class="lineno">   36</span>&#160;    <span class="keyword">const</span> <span class="keywordtype">bool</span> NEIGHBOR_IMPORTANCE = neighbors_importance;</div>
<div class="line"><a name="l00037"></a><span class="lineno">   37</span>&#160; </div>
<div class="line"><a name="l00038"></a><span class="lineno">   38</span>&#160;    <span class="keyword">const</span> <span class="keywordtype">int</span> in_channels = filter_dims[filter_dims.size() - 2];</div>
<div class="line"><a name="l00039"></a><span class="lineno">   39</span>&#160;    <span class="keyword">const</span> <span class="keywordtype">int</span> out_channels = filter_dims[filter_dims.size() - 1];</div>
<div class="line"><a name="l00040"></a><span class="lineno">   40</span>&#160; </div>
<div class="line"><a name="l00041"></a><span class="lineno">   41</span>&#160;    <span class="keywordtype">int</span> num_kernel_elements = 1;</div>
<div class="line"><a name="l00042"></a><span class="lineno">   42</span>&#160;    <span class="keywordflow">for</span> (<span class="keywordtype">int</span> i = 0; i &lt; filter_dims.size() - 2; ++i)</div>
<div class="line"><a name="l00043"></a><span class="lineno">   43</span>&#160;        num_kernel_elements *= filter_dims[i];</div>
<div class="line"><a name="l00044"></a><span class="lineno">   44</span>&#160;    <span class="keyword">const</span> <span class="keywordtype">int</span> total_filter_size =</div>
<div class="line"><a name="l00045"></a><span class="lineno">   45</span>&#160;            num_kernel_elements * in_channels * out_channels;</div>
<div class="line"><a name="l00046"></a><span class="lineno">   46</span>&#160; </div>
<div class="line"><a name="l00047"></a><span class="lineno">   47</span>&#160;    memset(filter_backprop, 0, <span class="keyword">sizeof</span>(TOut) * total_filter_size);</div>
<div class="line"><a name="l00048"></a><span class="lineno">   48</span>&#160;    std::mutex filter_backprop_mutex;</div>
<div class="line"><a name="l00049"></a><span class="lineno">   49</span>&#160; </div>
<div class="line"><a name="l00050"></a><span class="lineno">   50</span>&#160;    tbb::parallel_for(</div>
<div class="line"><a name="l00051"></a><span class="lineno">   51</span>&#160;            tbb::blocked_range&lt;size_t&gt;(0, num_out, 10032),</div>
<div class="line"><a name="l00052"></a><span class="lineno">   52</span>&#160;            [&amp;](<span class="keyword">const</span> tbb::blocked_range&lt;size_t&gt;&amp; r) {</div>
<div class="line"><a name="l00053"></a><span class="lineno">   53</span>&#160;                <span class="keywordtype">int</span> range_length = r.end() - r.begin();</div>
<div class="line"><a name="l00054"></a><span class="lineno">   54</span>&#160; </div>
<div class="line"><a name="l00055"></a><span class="lineno">   55</span>&#160;                Eigen::Matrix&lt;TFeat, Eigen::Dynamic, Eigen::Dynamic&gt; <a class="code" href="_point_cloud_planar_patch_detection_8cpp.3c3#ac970fa185e639f6057b92195881e2512">B</a>(</div>
<div class="line"><a name="l00056"></a><span class="lineno">   56</span>&#160;                        in_channels * num_kernel_elements, range_length);</div>
<div class="line"><a name="l00057"></a><span class="lineno">   57</span>&#160;                <a class="code" href="_point_cloud_planar_patch_detection_8cpp.3c3#ac970fa185e639f6057b92195881e2512">B</a>.setZero();</div>
<div class="line"><a name="l00058"></a><span class="lineno">   58</span>&#160;                Eigen::Matrix&lt;TFeat, Eigen::Dynamic, Eigen::Dynamic&gt; C(</div>
<div class="line"><a name="l00059"></a><span class="lineno">   59</span>&#160;                        out_channels, range_length);</div>
<div class="line"><a name="l00060"></a><span class="lineno">   60</span>&#160; </div>
<div class="line"><a name="l00061"></a><span class="lineno">   61</span>&#160;                Eigen::Array&lt;TFeat, Eigen::Dynamic, 1&gt; infeat(in_channels, 1);</div>
<div class="line"><a name="l00062"></a><span class="lineno">   62</span>&#160; </div>
<div class="line"><a name="l00063"></a><span class="lineno">   63</span>&#160;                <span class="keywordflow">for</span> (<span class="keywordtype">size_t</span> out_idx = r.begin(); out_idx != r.end();</div>
<div class="line"><a name="l00064"></a><span class="lineno">   64</span>&#160;                     ++out_idx) {</div>
<div class="line"><a name="l00065"></a><span class="lineno">   65</span>&#160;                    <span class="keyword">const</span> <span class="keywordtype">int</span> out_col = out_idx - r.begin();</div>
<div class="line"><a name="l00066"></a><span class="lineno">   66</span>&#160;                    <span class="keyword">const</span> <span class="keywordtype">size_t</span> neighbor_start = neighbors_row_splits[out_idx];</div>
<div class="line"><a name="l00067"></a><span class="lineno">   67</span>&#160;                    <span class="keyword">const</span> <span class="keywordtype">size_t</span> neighbor_end =</div>
<div class="line"><a name="l00068"></a><span class="lineno">   68</span>&#160;                            neighbors_row_splits[out_idx + 1];</div>
<div class="line"><a name="l00069"></a><span class="lineno">   69</span>&#160;                    TFeat normalizer(0);</div>
<div class="line"><a name="l00070"></a><span class="lineno">   70</span>&#160; </div>
<div class="line"><a name="l00071"></a><span class="lineno">   71</span>&#160;                    <span class="keywordflow">for</span> (<span class="keywordtype">size_t</span> n = neighbor_start; n &lt; neighbor_end; ++n) {</div>
<div class="line"><a name="l00072"></a><span class="lineno">   72</span>&#160;                        <span class="keyword">const</span> <span class="keywordtype">size_t</span> inp_idx = neighbors_index[n];</div>
<div class="line"><a name="l00073"></a><span class="lineno">   73</span>&#160;                        <span class="keyword">const</span> <span class="keywordtype">int</span> kernel_idx = neighbors_kernel_index[n];</div>
<div class="line"><a name="l00074"></a><span class="lineno">   74</span>&#160; </div>
<div class="line"><a name="l00075"></a><span class="lineno">   75</span>&#160;                        <span class="keyword">const</span> TFeat n_importance =</div>
<div class="line"><a name="l00076"></a><span class="lineno">   76</span>&#160;                                (NEIGHBOR_IMPORTANCE ? neighbors_importance[n]</div>
<div class="line"><a name="l00077"></a><span class="lineno">   77</span>&#160;                                                     : TFeat(1));</div>
<div class="line"><a name="l00078"></a><span class="lineno">   78</span>&#160;                        normalizer += n_importance;</div>
<div class="line"><a name="l00079"></a><span class="lineno">   79</span>&#160; </div>
<div class="line"><a name="l00080"></a><span class="lineno">   80</span>&#160;                        <span class="keywordflow">for</span> (<span class="keywordtype">int</span> ic = 0; ic &lt; in_channels; ++ic)</div>
<div class="line"><a name="l00081"></a><span class="lineno">   81</span>&#160;                            infeat(ic) =</div>
<div class="line"><a name="l00082"></a><span class="lineno">   82</span>&#160;                                    inp_features[inp_idx * in_channels + ic];</div>
<div class="line"><a name="l00083"></a><span class="lineno">   83</span>&#160; </div>
<div class="line"><a name="l00084"></a><span class="lineno">   84</span>&#160;                        TFeat importance(1);</div>
<div class="line"><a name="l00085"></a><span class="lineno">   85</span>&#160;                        <span class="keywordflow">if</span> (POINT_IMPORTANCE)</div>
<div class="line"><a name="l00086"></a><span class="lineno">   86</span>&#160;                            importance = inp_importance[inp_idx];</div>
<div class="line"><a name="l00087"></a><span class="lineno">   87</span>&#160;                        <span class="keywordflow">if</span> (NEIGHBOR_IMPORTANCE) importance *= n_importance;</div>
<div class="line"><a name="l00088"></a><span class="lineno">   88</span>&#160; </div>
<div class="line"><a name="l00089"></a><span class="lineno">   89</span>&#160;                        <span class="keywordflow">if</span> (POINT_IMPORTANCE || NEIGHBOR_IMPORTANCE) {</div>
<div class="line"><a name="l00090"></a><span class="lineno">   90</span>&#160;                            <span class="keywordflow">for</span> (<span class="keywordtype">int</span> ic = 0; ic &lt; in_channels; ++ic)</div>
<div class="line"><a name="l00091"></a><span class="lineno">   91</span>&#160;                                infeat(ic) *= importance;</div>
<div class="line"><a name="l00092"></a><span class="lineno">   92</span>&#160;                        }</div>
<div class="line"><a name="l00093"></a><span class="lineno">   93</span>&#160;                        <span class="keywordflow">for</span> (<span class="keywordtype">int</span> ic = 0; ic &lt; in_channels; ++ic) {</div>
<div class="line"><a name="l00094"></a><span class="lineno">   94</span>&#160;                            <a class="code" href="_point_cloud_planar_patch_detection_8cpp.3c3#ac970fa185e639f6057b92195881e2512">B</a>(kernel_idx * in_channels + ic, out_col) =</div>
<div class="line"><a name="l00095"></a><span class="lineno">   95</span>&#160;                                    infeat(ic);</div>
<div class="line"><a name="l00096"></a><span class="lineno">   96</span>&#160;                        }</div>
<div class="line"><a name="l00097"></a><span class="lineno">   97</span>&#160;                    }</div>
<div class="line"><a name="l00098"></a><span class="lineno">   98</span>&#160; </div>
<div class="line"><a name="l00099"></a><span class="lineno">   99</span>&#160;                    C.col(out_col) = Eigen::Map&lt;</div>
<div class="line"><a name="l00100"></a><span class="lineno">  100</span>&#160;                            <span class="keyword">const</span> Eigen::Array&lt;TFeat, Eigen::Dynamic, 1&gt;&gt;(</div>
<div class="line"><a name="l00101"></a><span class="lineno">  101</span>&#160;                            out_features_gradient + out_idx * out_channels,</div>
<div class="line"><a name="l00102"></a><span class="lineno">  102</span>&#160;                            out_channels, 1);</div>
<div class="line"><a name="l00103"></a><span class="lineno">  103</span>&#160; </div>
<div class="line"><a name="l00104"></a><span class="lineno">  104</span>&#160;                    <span class="keywordflow">if</span> (normalize &amp;&amp; normalizer != TFeat(0))</div>
<div class="line"><a name="l00105"></a><span class="lineno">  105</span>&#160;                        C.col(out_col) /= normalizer;</div>
<div class="line"><a name="l00106"></a><span class="lineno">  106</span>&#160; </div>
<div class="line"><a name="l00107"></a><span class="lineno">  107</span>&#160;                }  <span class="comment">// out_idx</span></div>
<div class="line"><a name="l00108"></a><span class="lineno">  108</span>&#160; </div>
<div class="line"><a name="l00109"></a><span class="lineno">  109</span>&#160;                Eigen::Matrix&lt;TFeat, Eigen::Dynamic, Eigen::Dynamic&gt; A(</div>
<div class="line"><a name="l00110"></a><span class="lineno">  110</span>&#160;                        out_channels, num_kernel_elements * in_channels);</div>
<div class="line"><a name="l00111"></a><span class="lineno">  111</span>&#160; </div>
<div class="line"><a name="l00112"></a><span class="lineno">  112</span>&#160;                A = C * <a class="code" href="_point_cloud_planar_patch_detection_8cpp.3c3#ac970fa185e639f6057b92195881e2512">B</a>.transpose();</div>
<div class="line"><a name="l00113"></a><span class="lineno">  113</span>&#160; </div>
<div class="line"><a name="l00114"></a><span class="lineno">  114</span>&#160;                {</div>
<div class="line"><a name="l00115"></a><span class="lineno">  115</span>&#160;                    std::lock_guard&lt;std::mutex&gt; lock(filter_backprop_mutex);</div>
<div class="line"><a name="l00116"></a><span class="lineno">  116</span>&#160;                    <span class="keywordtype">int</span> linear_i = 0;</div>
<div class="line"><a name="l00117"></a><span class="lineno">  117</span>&#160;                    <span class="keywordflow">for</span> (<span class="keywordtype">int</span> j = 0; j &lt; num_kernel_elements * in_channels; ++j)</div>
<div class="line"><a name="l00118"></a><span class="lineno">  118</span>&#160;                        <span class="keywordflow">for</span> (<span class="keywordtype">int</span> i = 0; i &lt; out_channels; ++i, ++linear_i) {</div>
<div class="line"><a name="l00119"></a><span class="lineno">  119</span>&#160;                            filter_backprop[linear_i] += TOut(A(i, j));</div>
<div class="line"><a name="l00120"></a><span class="lineno">  120</span>&#160;                        }</div>
<div class="line"><a name="l00121"></a><span class="lineno">  121</span>&#160;                }</div>
<div class="line"><a name="l00122"></a><span class="lineno">  122</span>&#160;            });</div>
<div class="line"><a name="l00123"></a><span class="lineno">  123</span>&#160;}</div>
<div class="line"><a name="l00124"></a><span class="lineno">  124</span>&#160; </div>
<div class="line"><a name="l00179"></a><span class="lineno">  179</span>&#160;<span class="keyword">template</span> &lt;<span class="keyword">class</span> TFeat, <span class="keyword">class</span> TOut, <span class="keyword">class</span> TIndex, <span class="keyword">class</span> TKernelIndex&gt;</div>
<div class="line"><a name="l00180"></a><span class="lineno"><a class="line" href="namespaceopen3d_1_1ml_1_1impl.html#af0b31d4e95c88cba83800bec19cf79a1">  180</a></span>&#160;<span class="keywordtype">void</span> <a class="code" href="namespaceopen3d_1_1ml_1_1impl.html#af0b31d4e95c88cba83800bec19cf79a1">SparseConvBackpropFilterCPU</a>(TOut* filter_backprop,</div>
<div class="line"><a name="l00181"></a><span class="lineno">  181</span>&#160;                                 <span class="keyword">const</span> std::vector&lt;int&gt;&amp; filter_dims,</div>
<div class="line"><a name="l00182"></a><span class="lineno">  182</span>&#160;                                 <span class="keywordtype">size_t</span> num_out,</div>
<div class="line"><a name="l00183"></a><span class="lineno">  183</span>&#160;                                 <span class="keywordtype">size_t</span> num_inp,</div>
<div class="line"><a name="l00184"></a><span class="lineno">  184</span>&#160;                                 <span class="keyword">const</span> TFeat* inp_features,</div>
<div class="line"><a name="l00185"></a><span class="lineno">  185</span>&#160;                                 <span class="keyword">const</span> TFeat* inp_importance,</div>
<div class="line"><a name="l00186"></a><span class="lineno">  186</span>&#160;                                 <span class="keyword">const</span> TIndex* neighbors_index,</div>
<div class="line"><a name="l00187"></a><span class="lineno">  187</span>&#160;                                 <span class="keyword">const</span> TKernelIndex* neighbors_kernel_index,</div>
<div class="line"><a name="l00188"></a><span class="lineno">  188</span>&#160;                                 <span class="keyword">const</span> TFeat* neighbors_importance,</div>
<div class="line"><a name="l00189"></a><span class="lineno">  189</span>&#160;                                 <span class="keyword">const</span> int64_t* neighbors_row_splits,</div>
<div class="line"><a name="l00190"></a><span class="lineno">  190</span>&#160;                                 <span class="keyword">const</span> TFeat* out_features_gradient,</div>
<div class="line"><a name="l00191"></a><span class="lineno">  191</span>&#160;                                 <span class="keywordtype">bool</span> normalize) {</div>
<div class="line"><a name="l00192"></a><span class="lineno">  192</span>&#160;    <span class="keywordtype">bool</span> has_importance = inp_importance;</div>
<div class="line"><a name="l00193"></a><span class="lineno">  193</span>&#160; </div>
<div class="line"><a name="l00194"></a><span class="lineno">  194</span>&#160;<span class="preprocessor">#define FN_PARAMETERS                                                          \</span></div>
<div class="line"><a name="l00195"></a><span class="lineno">  195</span>&#160;<span class="preprocessor">    filter_backprop, filter_dims, num_out, num_inp, inp_features,              \</span></div>
<div class="line"><a name="l00196"></a><span class="lineno">  196</span>&#160;<span class="preprocessor">            inp_importance, neighbors_index, neighbors_kernel_index,           \</span></div>
<div class="line"><a name="l00197"></a><span class="lineno">  197</span>&#160;<span class="preprocessor">            neighbors_importance, neighbors_row_splits, out_features_gradient, \</span></div>
<div class="line"><a name="l00198"></a><span class="lineno">  198</span>&#160;<span class="preprocessor">            normalize</span></div>
<div class="line"><a name="l00199"></a><span class="lineno">  199</span>&#160; </div>
<div class="line"><a name="l00200"></a><span class="lineno">  200</span>&#160;<span class="preprocessor">#define CALL_TEMPLATE(HAS_IMPORTANCE)                                  \</span></div>
<div class="line"><a name="l00201"></a><span class="lineno">  201</span>&#160;<span class="preprocessor">    if (HAS_IMPORTANCE == has_importance)                              \</span></div>
<div class="line"><a name="l00202"></a><span class="lineno">  202</span>&#160;<span class="preprocessor">        _SparseConvBackropFilterCPU&lt;TFeat, TOut, TIndex, TKernelIndex, \</span></div>
<div class="line"><a name="l00203"></a><span class="lineno">  203</span>&#160;<span class="preprocessor">                                    HAS_IMPORTANCE&gt;(FN_PARAMETERS);</span></div>
<div class="line"><a name="l00204"></a><span class="lineno">  204</span>&#160; </div>
<div class="line"><a name="l00205"></a><span class="lineno">  205</span>&#160;<span class="preprocessor">#define CALL_TEMPLATE2  \</span></div>
<div class="line"><a name="l00206"></a><span class="lineno">  206</span>&#160;<span class="preprocessor">    CALL_TEMPLATE(true) \</span></div>
<div class="line"><a name="l00207"></a><span class="lineno">  207</span>&#160;<span class="preprocessor">    CALL_TEMPLATE(false)</span></div>
<div class="line"><a name="l00208"></a><span class="lineno">  208</span>&#160; </div>
<div class="line"><a name="l00209"></a><span class="lineno">  209</span>&#160;    <a class="code" href="_sparse_conv_backprop_filter_8h.html#a134108eb2a54fc4a83849a791f372ba2">CALL_TEMPLATE2</a></div>
<div class="line"><a name="l00210"></a><span class="lineno">  210</span>&#160; </div>
<div class="line"><a name="l00211"></a><span class="lineno">  211</span>&#160;<span class="preprocessor">#undef CALL_TEMPLATE</span></div>
<div class="line"><a name="l00212"></a><span class="lineno">  212</span>&#160;<span class="preprocessor">#undef CALL_TEMPLATE2</span></div>
<div class="line"><a name="l00213"></a><span class="lineno">  213</span>&#160; </div>
<div class="line"><a name="l00214"></a><span class="lineno">  214</span>&#160;<span class="preprocessor">#undef FN_PARAMETERS</span></div>
<div class="line"><a name="l00215"></a><span class="lineno">  215</span>&#160;}</div>
<div class="line"><a name="l00216"></a><span class="lineno">  216</span>&#160; </div>
<div class="line"><a name="l00217"></a><span class="lineno">  217</span>&#160;}  <span class="comment">// namespace impl</span></div>
<div class="line"><a name="l00218"></a><span class="lineno">  218</span>&#160;}  <span class="comment">// namespace ml</span></div>
<div class="line"><a name="l00219"></a><span class="lineno">  219</span>&#160;}  <span class="comment">// namespace open3d</span></div>
<div class="ttc" id="a_point_cloud_planar_patch_detection_8cpp_html_ac970fa185e639f6057b92195881e2512"><div class="ttname"><a href="_point_cloud_planar_patch_detection_8cpp.3c3#ac970fa185e639f6057b92195881e2512">B</a></div><div class="ttdeci">Eigen::Matrix3d B</div><div class="ttdef"><b>Definition:</b> PointCloudPlanarPatchDetection.cpp:506</div></div>
<div class="ttc" id="a_sparse_conv_backprop_filter_8h_html_a134108eb2a54fc4a83849a791f372ba2"><div class="ttname"><a href="_sparse_conv_backprop_filter_8h.html#a134108eb2a54fc4a83849a791f372ba2">CALL_TEMPLATE2</a></div><div class="ttdeci">#define CALL_TEMPLATE2</div></div>
<div class="ttc" id="anamespaceopen3d_1_1ml_1_1impl_html_a63a896262f55b1d3ae980406434a80e4"><div class="ttname"><a href="namespaceopen3d_1_1ml_1_1impl.html#a63a896262f55b1d3ae980406434a80e4">open3d::ml::impl::_SparseConvBackropFilterCPU</a></div><div class="ttdeci">void _SparseConvBackropFilterCPU(TOut *filter_backprop, const std::vector&lt; int &gt; &amp;filter_dims, size_t num_out, size_t num_inp, const TFeat *inp_features, const TFeat *inp_importance, const TIndex *neighbors_index, const TKernelIndex *neighbors_kernel_index, const TFeat *neighbors_importance, const int64_t *neighbors_row_splits, const TFeat *out_features_gradient, bool normalize)</div><div class="ttdef"><b>Definition:</b> SparseConvBackpropFilter.h:24</div></div>
<div class="ttc" id="anamespaceopen3d_1_1ml_1_1impl_html_af0b31d4e95c88cba83800bec19cf79a1"><div class="ttname"><a href="namespaceopen3d_1_1ml_1_1impl.html#af0b31d4e95c88cba83800bec19cf79a1">open3d::ml::impl::SparseConvBackpropFilterCPU</a></div><div class="ttdeci">void SparseConvBackpropFilterCPU(TOut *filter_backprop, const std::vector&lt; int &gt; &amp;filter_dims, size_t num_out, size_t num_inp, const TFeat *inp_features, const TFeat *inp_importance, const TIndex *neighbors_index, const TKernelIndex *neighbors_kernel_index, const TFeat *neighbors_importance, const int64_t *neighbors_row_splits, const TFeat *out_features_gradient, bool normalize)</div><div class="ttdef"><b>Definition:</b> SparseConvBackpropFilter.h:180</div></div>
<div class="ttc" id="anamespaceopen3d_html"><div class="ttname"><a href="namespaceopen3d.html">open3d</a></div><div class="ttdef"><b>Definition:</b> PinholeCameraIntrinsic.cpp:16</div></div>
</div><!-- fragment --></div><!-- contents -->
<!-- start footer part -->
<hr class="footer"/><address class="footer"><small>
Generated by&#160;<a href="https://www.doxygen.org/index.html"><img class="footer" src="doxygen.svg" width="104" height="31" alt="doxygen"/></a> 1.9.1
</small></address>
</body>

<!-- Mirrored from www.open3d.org/docs/release/cpp_api/_sparse_conv_backprop_filter_8h_source.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 14 May 2023 11:04:55 GMT -->
</html>
