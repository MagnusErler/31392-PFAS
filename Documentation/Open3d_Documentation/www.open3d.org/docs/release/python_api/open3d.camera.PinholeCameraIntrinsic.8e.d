

<!DOCTYPE html>
<!--[if IE 8]><html class="no-js lt-ie9" lang="en" > <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang="en" > <!--<![endif]-->

<!-- Mirrored from www.open3d.org/docs/release/python_api/open3d.camera.PinholeCameraIntrinsic.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 14 May 2023 10:51:51 GMT -->
<head>
  <meta charset="utf-8">
  
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  
  <title>open3d.camera.PinholeCameraIntrinsic &mdash; Open3D 0.17.0 documentation</title>
  

  
  
    <link rel="shortcut icon" href="../_static/open3d_logo.ico"/>
  
  
  

  
  <script type="text/javascript" src="../_static/js/modernizr.min.js"></script>
  
    
      <script type="text/javascript" id="documentation_options" data-url_root="../" src="../_static/documentation_options.js"></script>
        <script src="../_static/jquery.js"></script>
        <script src="../_static/underscore.js"></script>
        <script src="../_static/doctools.js"></script>
        <script src="../_static/language_data.js"></script>
        <script async="async" src="https://www.googletagmanager.com/gtag/js?id=G-3TQPKGV6Z3"></script>
        <script >
        window.dataLayer = window.dataLayer || [];
        function gtag(){dataLayer.push(arguments);}
        gtag('js', new Date());
        gtag('config', 'G-3TQPKGV6Z3');</script>
        <script crossorigin="anonymous" integrity="sha256-Ae2Vz/4ePdIu6ZyI/5ZGsYnb+m0JlOmKPjt6XZ9JJkA=" src="../../../../cdnjs.cloudflare.com/ajax/libs/require.js/2.3.4/require.min.js"></script>
        <script async="async" src="../../../../cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.7/latestdda6.js?config=TeX-AMS-MML_HTMLorMML"></script>
        <script type="text/x-mathjax-config">MathJax.Hub.Config({"tex2jax": {"inlineMath": [["$", "$"], ["\\(", "\\)"]], "processEscapes": true, "ignoreClass": "document", "processClass": "math|output_area"}})</script>
    
    <script type="text/javascript" src="../_static/js/theme.js"></script>

    

  
  <link rel="stylesheet" href="../_static/css/theme.css" type="text/css" />
  <link rel="stylesheet" href="../_static/pygments.css" type="text/css" />
  <link rel="stylesheet" href="../_static/theme_overrides.css" type="text/css" />
    <link rel="index" title="Index" href="../genindex.html" />
    <link rel="search" title="Search" href="../search.html" />
    <link rel="next" title="open3d.camera.PinholeCameraIntrinsicParameters" href="open3d.camera.PinholeCameraIntrinsicParam" />
    <link rel="prev" title="open3d.camera" href="open3d.camera.html" /> 
</head>

<body class="wy-body-for-nav">

   
  <div class="wy-grid-for-nav">
    
    <nav data-toggle="wy-nav-shift" class="wy-nav-side">
      <div class="wy-side-scroll">
        <div class="wy-side-nav-search" >
          

          
            <a href="../index-2.html" class="icon icon-home"> Open3D
          

          
          </a>

          
            
            
              <div class="version">
                0.17.0
              </div>
            
          

          
<div role="search">
  <form id="rtd-search-form" class="wy-form" action="http://www.open3d.org/docs/release/search.html" method="get">
    <input type="text" name="q" placeholder="Search docs" />
    <input type="hidden" name="check_keywords" value="yes" />
    <input type="hidden" name="area" value="default" />
  </form>
</div>

          
        </div>

        <div class="wy-menu wy-menu-vertical" data-spy="affix" role="navigation" aria-label="main navigation">
          
            
            
              
            
            
              <p class="caption"><span class="caption-text">Getting Started</span></p>
<ul>
<li class="toctree-l1"><a class="reference internal" href="../introduction.html">Introduction</a></li>
<li class="toctree-l1"><a class="reference internal" href="../getting_started.html">Getting started</a></li>
<li class="toctree-l1"><a class="reference internal" href="../compilation.html">Build from source</a></li>
<li class="toctree-l1"><a class="reference internal" href="../cpp_project.html">Link Open3D in C++ projects</a></li>
<li class="toctree-l1"><a class="reference internal" href="../builddocs.html">Build documentation</a></li>
<li class="toctree-l1"><a class="reference internal" href="../open3d_ml.html">Open3D-ML</a></li>
<li class="toctree-l1"><a class="reference internal" href="../arm.html">ARM support</a></li>
<li class="toctree-l1"><a class="reference internal" href="../docker.html">Docker</a></li>
</ul>
<p class="caption"><span class="caption-text">Tutorial</span></p>
<ul>
<li class="toctree-l1"><a class="reference internal" href="../tutorial/geometry/index.html">Geometry</a></li>
<li class="toctree-l1"><a class="reference internal" href="../tutorial/t_geometry/index.html">Geometry (Tensor)</a></li>
<li class="toctree-l1"><a class="reference internal" href="../tutorial/pipelines/index.html">Pipelines</a></li>
<li class="toctree-l1"><a class="reference internal" href="../tutorial/t_pipelines/index.html">Pipelines (Tensor)</a></li>
<li class="toctree-l1"><a class="reference internal" href="../tutorial/visualization/index.html">Visualization</a></li>
<li class="toctree-l1"><a class="reference internal" href="../tutorial/core/index.html">Core</a></li>
<li class="toctree-l1"><a class="reference internal" href="../tutorial/data/index.html">Dataset</a></li>
<li class="toctree-l1"><a class="reference internal" href="../tutorial/reconstruction_system/index.html">Reconstruction system</a></li>
<li class="toctree-l1"><a class="reference internal" href="../tutorial/t_reconstruction_system/index.html">Reconstruction system (Tensor)</a></li>
<li class="toctree-l1"><a class="reference internal" href="../tutorial/sensor/index.html">Sensor</a></li>
<li class="toctree-l1"><a class="reference internal" href="../tutorial/reference.html">Reference</a></li>
</ul>
<p class="caption"><span class="caption-text">Contribute</span></p>
<ul>
<li class="toctree-l1"><a class="reference internal" href="../contribute/contribute.html">Contributing to Open3D</a></li>
<li class="toctree-l1"><a class="reference internal" href="../contribute/contribution_recipes.html">Contribution methods</a></li>
<li class="toctree-l1"><a class="reference internal" href="../contribute/styleguide.html">Open3D style guide</a></li>
</ul>
<p class="caption"><span class="caption-text">C++ API</span></p>
<ul>
<li class="toctree-l1"><a class="reference internal" href="../cpp_api.html">C++ documentation</a></li>
</ul>
<p class="caption"><span class="caption-text">Python API</span></p>
<ul class="current">
<li class="toctree-l1 current"><a class="reference internal" href="open3d.camera.html">open3d.camera</a><ul class="current">
<li class="toctree-l2 current"><a class="current reference internal" href="#">PinholeCameraIntrinsic</a></li>
<li class="toctree-l2"><a class="reference internal" href="open3d.camera.PinholeCameraIntrinsicParam">PinholeCameraIntrinsicParameters</a></li>
<li class="toctree-l2"><a class="reference internal" href="open3d.camera.PinholeCameraParameters.8f">PinholeCameraParameters</a></li>
<li class="toctree-l2"><a class="reference internal" href="open3d.camera.PinholeCameraTrajectory.90">PinholeCameraTrajectory</a></li>
</ul>
</li>
<li class="toctree-l1"><a class="reference internal" href="open3d.core.html">open3d.core</a></li>
<li class="toctree-l1"><a class="reference internal" href="open3d.data.html">open3d.data</a></li>
<li class="toctree-l1"><a class="reference internal" href="open3d.geometry.html">open3d.geometry</a></li>
<li class="toctree-l1"><a class="reference internal" href="open3d.io.html">open3d.io</a></li>
<li class="toctree-l1"><a class="reference internal" href="open3d.t.html">open3d.t</a></li>
<li class="toctree-l1"><a class="reference internal" href="open3d.ml.html">open3d.ml</a></li>
<li class="toctree-l1"><a class="reference internal" href="open3d.pipelines.html">open3d.pipelines</a></li>
<li class="toctree-l1"><a class="reference internal" href="open3d.utility.html">open3d.utility</a></li>
<li class="toctree-l1"><a class="reference internal" href="open3d.visualization.html">open3d.visualization</a></li>
</ul>
<p class="caption"><span class="caption-text">Python Examples</span></p>
<ul>
<li class="toctree-l1"><a class="reference internal" href="../python_example/camera/index.html">Camera</a></li>
<li class="toctree-l1"><a class="reference internal" href="../python_example/geometry/index.html">Geometry</a></li>
<li class="toctree-l1"><a class="reference internal" href="../python_example/io/index.html">IO</a></li>
<li class="toctree-l1"><a class="reference internal" href="../python_example/pipelines/index.html">Pipelines</a></li>
<li class="toctree-l1"><a class="reference internal" href="../python_example/utility/index.html">Utility</a></li>
<li class="toctree-l1"><a class="reference internal" href="../python_example/visualization/index.html">Visualization</a></li>
</ul>

            
          
        </div>
      </div>
    </nav>

    <section data-toggle="wy-nav-shift" class="wy-nav-content-wrap">

      
      <nav class="wy-nav-top" aria-label="top navigation">
        
          <i data-toggle="wy-nav-top" class="fa fa-bars"></i>
          <a href="../index-2.html">Open3D</a>
        
      </nav>


      <div class="wy-nav-content">
        
        <div class="rst-content">
        
          















<div role="navigation" aria-label="breadcrumbs navigation">

  <ul class="wy-breadcrumbs">
    
      <li><a href="../index-2.html">Docs</a> &raquo;</li>
        
          <li><a href="open3d.camera.html">open3d.camera</a> &raquo;</li>
        
      <li>open3d.camera.PinholeCameraIntrinsic</li>
    
    
      <li class="wy-breadcrumbs-aside">
        
            
        
      </li>
    
  </ul>

  
  <hr/>
</div>
          <div role="main" class="document" itemscope="itemscope" itemtype="http://schema.org/Article">
           <div itemprop="articleBody">
            
  
<style>
/* CSS overrides for sphinx_rtd_theme */

/* 24px margin */
.nbinput.nblast.container,
.nboutput.nblast.container {
    margin-bottom: 19px;  /* padding has already 5px */
}

/* ... except between code cells! */
.nblast.container + .nbinput.container {
    margin-top: -19px;
}

.admonition > p:before {
    margin-right: 4px;  /* make room for the exclamation icon */
}

/* Fix math alignment, see https://github.com/rtfd/sphinx_rtd_theme/pull/686 */
.math {
    text-align: unset;
}
</style>
<div class="section" id="open3d-camera-pinholecameraintrinsic">
<h1>open3d.camera.PinholeCameraIntrinsic<a class="headerlink" href="#open3d-camera-pinholecameraintrinsic" title="Permalink to this headline">¶</a></h1>
<dl class="py class">
<dt id="open3d.camera.PinholeCameraIntrinsic">
<em class="property">class </em><code class="sig-prename descclassname">open3d.camera.</code><code class="sig-name descname">PinholeCameraIntrinsic</code><a class="headerlink" href="#open3d.camera.PinholeCameraIntrinsic" title="Permalink to this definition">¶</a></dt>
<dd><p>PinholeCameraIntrinsic class stores intrinsic camera matrix, and image height and width.</p>
<dl class="py method">
<dt id="open3d.camera.PinholeCameraIntrinsic.__init__">
<code class="sig-name descname">__init__</code><span class="sig-paren">(</span><em class="sig-param"><span class="o">*</span><span class="n">args</span></em>, <em class="sig-param"><span class="o">**</span><span class="n">kwargs</span></em><span class="sig-paren">)</span><a class="headerlink" href="#open3d.camera.PinholeCameraIntrinsic.__init__" title="Permalink to this definition">¶</a></dt>
<dd><p>Overloaded function.</p>
<ol class="arabic simple">
<li><dl class="simple">
<dt>__init__(self)</dt><dd><p>Default constructor</p>
</dd>
</dl>
</li>
<li><dl class="simple">
<dt>__init__(self, arg0)</dt><dd><p>Copy constructor</p>
</dd>
</dl>
</li>
</ol>
<dl class="field-list simple">
<dt class="field-odd">Parameters</dt>
<dd class="field-odd"><p><strong>arg0</strong> (<a class="reference internal" href="#open3d.camera.PinholeCameraIntrinsic" title="open3d.camera.PinholeCameraIntrinsic"><em>open3d.camera.PinholeCameraIntrinsic</em></a>) – </p>
</dd>
</dl>
<ol class="arabic simple" start="3">
<li><p>__init__(self, width, height, intrinsic_matrix)</p></li>
</ol>
<dl class="field-list simple">
<dt class="field-odd">Parameters</dt>
<dd class="field-odd"><ul class="simple">
<li><p><strong>width</strong> (<em>int</em>) – </p></li>
<li><p><strong>height</strong> (<em>int</em>) – </p></li>
<li><p><strong>intrinsic_matrix</strong> (<em>numpy.ndarray</em><em>[</em><em>numpy.float64</em><em>[</em><em>3</em><em>, </em><em>3</em><em>]</em><em>]</em>) – </p></li>
</ul>
</dd>
</dl>
<ol class="arabic simple" start="4">
<li><p>__init__(self, width, height, fx, fy, cx, cy)</p></li>
</ol>
<dl class="field-list simple">
<dt class="field-odd">Parameters</dt>
<dd class="field-odd"><ul class="simple">
<li><p><strong>width</strong> (<em>int</em>) – </p></li>
<li><p><strong>height</strong> (<em>int</em>) – </p></li>
<li><p><strong>fx</strong> (<em>float</em>) – </p></li>
<li><p><strong>fy</strong> (<em>float</em>) – </p></li>
<li><p><strong>cx</strong> (<em>float</em>) – </p></li>
<li><p><strong>cy</strong> (<em>float</em>) – </p></li>
</ul>
</dd>
</dl>
<ol class="arabic simple" start="5">
<li><p>__init__(self, param)</p></li>
</ol>
<dl class="field-list simple">
<dt class="field-odd">Parameters</dt>
<dd class="field-odd"><p><strong>param</strong> (<a class="reference internal" href="open3d.camera.PinholeCameraIntrinsicParam#open3d.camera.PinholeCameraIntrinsicParameters" title="open3d.camera.PinholeCameraIntrinsicParameters"><em>open3d.camera.PinholeCameraIntrinsicParameters</em></a>) – </p>
</dd>
</dl>
</dd></dl>

<dl class="py method">
<dt id="open3d.camera.PinholeCameraIntrinsic.get_focal_length">
<code class="sig-name descname">get_focal_length</code><span class="sig-paren">(</span><em class="sig-param"><span class="n">self</span></em><span class="sig-paren">)</span><a class="headerlink" href="#open3d.camera.PinholeCameraIntrinsic.get_focal_length" title="Permalink to this definition">¶</a></dt>
<dd><p>Returns the focal length in a tuple of X-axis and Y-axisfocal lengths.</p>
<dl class="field-list simple">
<dt class="field-odd">Returns</dt>
<dd class="field-odd"><p>Tuple[float, float]</p>
</dd>
</dl>
</dd></dl>

<dl class="py method">
<dt id="open3d.camera.PinholeCameraIntrinsic.get_principal_point">
<code class="sig-name descname">get_principal_point</code><span class="sig-paren">(</span><em class="sig-param"><span class="n">self</span></em><span class="sig-paren">)</span><a class="headerlink" href="#open3d.camera.PinholeCameraIntrinsic.get_principal_point" title="Permalink to this definition">¶</a></dt>
<dd><p>Returns the principle point in a tuple of X-axis and.Y-axis principle points</p>
<dl class="field-list simple">
<dt class="field-odd">Returns</dt>
<dd class="field-odd"><p>Tuple[float, float]</p>
</dd>
</dl>
</dd></dl>

<dl class="py method">
<dt id="open3d.camera.PinholeCameraIntrinsic.get_skew">
<code class="sig-name descname">get_skew</code><span class="sig-paren">(</span><em class="sig-param"><span class="n">self</span></em><span class="sig-paren">)</span><a class="headerlink" href="#open3d.camera.PinholeCameraIntrinsic.get_skew" title="Permalink to this definition">¶</a></dt>
<dd><p>Returns the skew.</p>
<dl class="field-list simple">
<dt class="field-odd">Returns</dt>
<dd class="field-odd"><p>float</p>
</dd>
</dl>
</dd></dl>

<dl class="py method">
<dt id="open3d.camera.PinholeCameraIntrinsic.is_valid">
<code class="sig-name descname">is_valid</code><span class="sig-paren">(</span><em class="sig-param"><span class="n">self</span></em><span class="sig-paren">)</span><a class="headerlink" href="#open3d.camera.PinholeCameraIntrinsic.is_valid" title="Permalink to this definition">¶</a></dt>
<dd><p>Returns True iff both the width and height are greater than 0.</p>
<dl class="field-list simple">
<dt class="field-odd">Returns</dt>
<dd class="field-odd"><p>bool</p>
</dd>
</dl>
</dd></dl>

<dl class="py method">
<dt id="open3d.camera.PinholeCameraIntrinsic.set_intrinsics">
<code class="sig-name descname">set_intrinsics</code><span class="sig-paren">(</span><em class="sig-param"><span class="n">self</span></em>, <em class="sig-param"><span class="n">width</span></em>, <em class="sig-param"><span class="n">height</span></em>, <em class="sig-param"><span class="n">fx</span></em>, <em class="sig-param"><span class="n">fy</span></em>, <em class="sig-param"><span class="n">cx</span></em>, <em class="sig-param"><span class="n">cy</span></em><span class="sig-paren">)</span><a class="headerlink" href="#open3d.camera.PinholeCameraIntrinsic.set_intrinsics" title="Permalink to this definition">¶</a></dt>
<dd><p>Set camera intrinsic parameters.</p>
<dl class="field-list simple">
<dt class="field-odd">Parameters</dt>
<dd class="field-odd"><ul class="simple">
<li><p><strong>width</strong> (<em>int</em>) – Width of the image.</p></li>
<li><p><strong>height</strong> (<em>int</em>) – Height of the image.</p></li>
<li><p><strong>fx</strong> (<em>float</em>) – X-axis focal length</p></li>
<li><p><strong>fy</strong> (<em>float</em>) – Y-axis focal length.</p></li>
<li><p><strong>cx</strong> (<em>float</em>) – X-axis principle point.</p></li>
<li><p><strong>cy</strong> (<em>float</em>) – Y-axis principle point.</p></li>
</ul>
</dd>
<dt class="field-even">Returns</dt>
<dd class="field-even"><p>None</p>
</dd>
</dl>
</dd></dl>

<dl class="py method">
<dt id="open3d.camera.PinholeCameraIntrinsic.height">
<em class="property">property </em><code class="sig-name descname">height</code><a class="headerlink" href="#open3d.camera.PinholeCameraIntrinsic.height" title="Permalink to this definition">¶</a></dt>
<dd><p>Height of the image.</p>
<dl class="field-list simple">
<dt class="field-odd">Type</dt>
<dd class="field-odd"><p>int</p>
</dd>
</dl>
</dd></dl>

<dl class="py method">
<dt id="open3d.camera.PinholeCameraIntrinsic.intrinsic_matrix">
<em class="property">property </em><code class="sig-name descname">intrinsic_matrix</code><a class="headerlink" href="#open3d.camera.PinholeCameraIntrinsic.intrinsic_matrix" title="Permalink to this definition">¶</a></dt>
<dd><p>Intrinsic camera matrix <code class="docutils literal notranslate"><span class="pre">[[fx,</span> <span class="pre">0,</span> <span class="pre">cx],</span> <span class="pre">[0,</span> <span class="pre">fy,</span> <span class="pre">cy],</span> <span class="pre">[0,</span> <span class="pre">0,</span> <span class="pre">1]]</span></code></p>
<dl class="field-list simple">
<dt class="field-odd">Type</dt>
<dd class="field-odd"><p>3x3 numpy array</p>
</dd>
</dl>
</dd></dl>

<dl class="py method">
<dt id="open3d.camera.PinholeCameraIntrinsic.width">
<em class="property">property </em><code class="sig-name descname">width</code><a class="headerlink" href="#open3d.camera.PinholeCameraIntrinsic.width" title="Permalink to this definition">¶</a></dt>
<dd><p>Width of the image.</p>
<dl class="field-list simple">
<dt class="field-odd">Type</dt>
<dd class="field-odd"><p>int</p>
</dd>
</dl>
</dd></dl>

</dd></dl>

</div>


           </div>
           
          </div>
          <footer>
  
    <div class="rst-footer-buttons" role="navigation" aria-label="footer navigation">
      
        <a href="open3d.camera.PinholeCameraIntrinsicParam" class="btn btn-neutral float-right" title="open3d.camera.PinholeCameraIntrinsicParameters" accesskey="n" rel="next">Next <span class="fa fa-arrow-circle-right"></span></a>
      
      
        <a href="open3d.camera.html" class="btn btn-neutral float-left" title="open3d.camera" accesskey="p" rel="prev"><span class="fa fa-arrow-circle-left"></span> Previous</a>
      
    </div>
  

  <hr/>

  <div role="contentinfo">
    <p>
        &copy; Copyright 2018 - 2021, www.open3d.org

    </p>
  </div>
  Built with <a href="http://sphinx-doc.org/">Sphinx</a> using a <a href="https://github.com/rtfd/sphinx_rtd_theme">theme</a> provided by <a href="https://readthedocs.org/">Read the Docs</a>. 

</footer>

        </div>
      </div>

    </section>

  </div>
  
<div class="rst-versions" data-toggle="rst-versions" role="note" aria-label="versions">
<span class="rst-current-version" data-toggle="rst-current-version">
    <span class="fa fa-book"> Docs version</span>
    0.17.0
    <span class="fa fa-caret-down"></span>
</span>

<!-- A hack to include an external page to get around CORS policy -->
<!-- https://stackoverflow.com/a/15250208/1255535 -->
<div class="rst-other-versions">
    <dl>
    <dt>Versions</dt>
        <dd><ul>
            <script src="../../versions.js"></script>
        </ul></dd>
    </dl>
</div>

  <script type="text/javascript">
      jQuery(function () {
          SphinxRtdTheme.Navigation.enable(true);
      });
  </script>

  
  
    
   

</body>

<!-- Mirrored from www.open3d.org/docs/release/python_api/open3d.camera.PinholeCameraIntrinsic.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 14 May 2023 10:51:51 GMT -->
</html>