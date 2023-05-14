

<!DOCTYPE html>
<!--[if IE 8]><html class="no-js lt-ie9" lang="en" > <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang="en" > <!--<![endif]-->

<!-- Mirrored from www.open3d.org/docs/release/python_api/open3d.ml.torch.classes.RaggedTensor.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 14 May 2023 10:51:59 GMT -->
<head>
  <meta charset="utf-8">
  
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  
  <title>open3d.ml.torch.classes.RaggedTensor &mdash; Open3D 0.17.0 documentation</title>
  

  
  
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
    <link rel="next" title="open3d.ml.torch.dataloaders" href="open3d.ml.torch.dataloaders.html" />
    <link rel="prev" title="open3d.ml.torch.classes" href="open3d.ml.torch.classes.html" /> 
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
<li class="toctree-l1"><a class="reference internal" href="open3d.camera.html">open3d.camera</a></li>
<li class="toctree-l1"><a class="reference internal" href="open3d.core.html">open3d.core</a></li>
<li class="toctree-l1"><a class="reference internal" href="open3d.data.html">open3d.data</a></li>
<li class="toctree-l1"><a class="reference internal" href="open3d.geometry.html">open3d.geometry</a></li>
<li class="toctree-l1"><a class="reference internal" href="open3d.io.html">open3d.io</a></li>
<li class="toctree-l1"><a class="reference internal" href="open3d.t.html">open3d.t</a></li>
<li class="toctree-l1 current"><a class="reference internal" href="open3d.ml.html">open3d.ml</a><ul class="current">
<li class="toctree-l2"><a class="reference internal" href="open3d.ml.tf.html">tf</a></li>
<li class="toctree-l2 current"><a class="reference internal" href="open3d.ml.torch.html">torch</a><ul class="current">
<li class="toctree-l3 current"><a class="reference internal" href="open3d.ml.torch.classes.html">classes</a><ul class="current">
<li class="toctree-l4 current"><a class="current reference internal" href="#">RaggedTensor</a></li>
</ul>
</li>
<li class="toctree-l3"><a class="reference internal" href="open3d.ml.torch.dataloaders.html">dataloaders</a></li>
<li class="toctree-l3"><a class="reference internal" href="open3d.ml.torch.datasets.html">datasets</a></li>
<li class="toctree-l3"><a class="reference internal" href="open3d.ml.torch.layers.html">layers</a></li>
<li class="toctree-l3"><a class="reference internal" href="open3d.ml.torch.models.html">models</a></li>
<li class="toctree-l3"><a class="reference internal" href="open3d.ml.torch.modules.html">modules</a></li>
<li class="toctree-l3"><a class="reference internal" href="open3d.ml.torch.ops.html">ops</a></li>
<li class="toctree-l3"><a class="reference internal" href="open3d.ml.torch.pipelines.html">pipelines</a></li>
<li class="toctree-l3"><a class="reference internal" href="open3d.ml.torch.vis.html">vis</a></li>
</ul>
</li>
</ul>
</li>
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
        
          <li><a href="open3d.ml.html">open3d.ml</a> &raquo;</li>
        
          <li><a href="open3d.ml.torch.html">open3d.ml.torch</a> &raquo;</li>
        
          <li><a href="open3d.ml.torch.classes.html">open3d.ml.torch.classes</a> &raquo;</li>
        
      <li>open3d.ml.torch.classes.RaggedTensor</li>
    
    
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
<div class="section" id="open3d-ml-torch-classes-raggedtensor">
<h1>open3d.ml.torch.classes.RaggedTensor<a class="headerlink" href="#open3d-ml-torch-classes-raggedtensor" title="Permalink to this headline">¶</a></h1>
<dl class="py class">
<dt id="open3d.ml.torch.classes.RaggedTensor">
<em class="property">class </em><code class="sig-prename descclassname">open3d.ml.torch.classes.</code><code class="sig-name descname">RaggedTensor</code><span class="sig-paren">(</span><em class="sig-param"><span class="n">r_tensor</span></em>, <em class="sig-param"><span class="n">internal</span><span class="o">=</span><span class="default_value">False</span></em><span class="sig-paren">)</span><a class="headerlink" href="#open3d.ml.torch.classes.RaggedTensor" title="Permalink to this definition">¶</a></dt>
<dd><p>RaggedTensor.</p>
<p>A RaggedTensor is a tensor with ragged dimension, whose slice may
have different lengths. We define a container for ragged tensor to
support operations involving batches whose elements may have different
shape.</p>
<dl class="py method">
<dt id="open3d.ml.torch.classes.RaggedTensor.__init__">
<code class="sig-name descname">__init__</code><span class="sig-paren">(</span><em class="sig-param"><span class="n">r_tensor</span></em>, <em class="sig-param"><span class="n">internal</span><span class="o">=</span><span class="default_value">False</span></em><span class="sig-paren">)</span><a class="headerlink" href="#open3d.ml.torch.classes.RaggedTensor.__init__" title="Permalink to this definition">¶</a></dt>
<dd><p>Creates a <cite>RaggedTensor</cite> with specified torch script object.</p>
<p>This constructor is private – please use one of the following ops
to build <cite>RaggedTensor</cite>’s:</p>
<ul class="simple">
<li><p><cite>ml3d.classes.RaggedTensor.from_row_splits</cite></p></li>
</ul>
<dl class="field-list simple">
<dt class="field-odd">Raises</dt>
<dd class="field-odd"><p><strong>ValueError</strong> – If internal = False. This method is intended for internal use.</p>
</dd>
</dl>
</dd></dl>

<dl class="py method">
<dt id="open3d.ml.torch.classes.RaggedTensor.clone">
<code class="sig-name descname">clone</code><span class="sig-paren">(</span><span class="sig-paren">)</span><a class="headerlink" href="#open3d.ml.torch.classes.RaggedTensor.clone" title="Permalink to this definition">¶</a></dt>
<dd><p>Returns a clone of object.</p>
</dd></dl>

<dl class="py method">
<dt id="open3d.ml.torch.classes.RaggedTensor.from_row_splits">
<em class="property">classmethod </em><code class="sig-name descname">from_row_splits</code><span class="sig-paren">(</span><em class="sig-param"><span class="n">values</span></em>, <em class="sig-param"><span class="n">row_splits</span></em>, <em class="sig-param"><span class="n">validate</span><span class="o">=</span><span class="default_value">True</span></em>, <em class="sig-param"><span class="n">copy</span><span class="o">=</span><span class="default_value">True</span></em><span class="sig-paren">)</span><a class="headerlink" href="#open3d.ml.torch.classes.RaggedTensor.from_row_splits" title="Permalink to this definition">¶</a></dt>
<dd><p>Creates a RaggedTensor with rows partitioned by row_splits.</p>
<p>The returned <cite>RaggedTensor</cite> corresponds with the python list defined by:</p>
<div class="highlight-default notranslate"><div class="highlight"><pre><span></span><span class="n">result</span> <span class="o">=</span> <span class="p">[</span><span class="n">values</span><span class="p">[</span><span class="n">row_splits</span><span class="p">[</span><span class="n">i</span><span class="p">]:</span><span class="n">row_splits</span><span class="p">[</span><span class="n">i</span> <span class="o">+</span> <span class="mi">1</span><span class="p">]]</span>
        <span class="k">for</span> <span class="n">i</span> <span class="ow">in</span> <span class="nb">range</span><span class="p">(</span><span class="nb">len</span><span class="p">(</span><span class="n">row_splits</span><span class="p">)</span> <span class="o">-</span> <span class="mi">1</span><span class="p">)]</span>
</pre></div>
</div>
<dl class="field-list simple">
<dt class="field-odd">Parameters</dt>
<dd class="field-odd"><ul class="simple">
<li><p><strong>values</strong> – A Tensor with shape [N, None].</p></li>
<li><p><strong>row_splits</strong> – A 1-D integer tensor with shape <cite>[N+1]</cite>. Must not be
empty, and must be stored in ascending order. <cite>row_splits[0]</cite> must
be zero and <cite>row_splits[-1]</cite> must be <cite>N</cite>.</p></li>
<li><p><strong>validate</strong> – Verify that <cite>row_splits</cite> are compatible with <cite>values</cite>.
Set it to False to avoid expensive checks.</p></li>
<li><p><strong>copy</strong> – Whether to do a deep copy for <cite>values</cite> and <cite>row_splits</cite>.
Set it to False to save memory for short term usage.</p></li>
</ul>
</dd>
<dt class="field-even">Returns</dt>
<dd class="field-even"><p>A <cite>RaggedTensor</cite> container.</p>
</dd>
</dl>
<p>Example:</p>
<div class="doctest highlight-default notranslate"><div class="highlight"><pre><span></span><span class="gp">&gt;&gt;&gt; </span><span class="nb">print</span><span class="p">(</span><span class="n">ml3d</span><span class="o">.</span><span class="n">classes</span><span class="o">.</span><span class="n">RaggedTensor</span><span class="o">.</span><span class="n">from_row_splits</span><span class="p">(</span>
<span class="gp">... </span>    <span class="n">values</span><span class="o">=</span><span class="p">[</span><span class="mi">3</span><span class="p">,</span> <span class="mi">1</span><span class="p">,</span> <span class="mi">4</span><span class="p">,</span> <span class="mi">1</span><span class="p">,</span> <span class="mi">5</span><span class="p">,</span> <span class="mi">9</span><span class="p">,</span> <span class="mi">2</span><span class="p">,</span> <span class="mi">6</span><span class="p">],</span>
<span class="gp">... </span>    <span class="n">row_splits</span><span class="o">=</span><span class="p">[</span><span class="mi">0</span><span class="p">,</span> <span class="mi">4</span><span class="p">,</span> <span class="mi">4</span><span class="p">,</span> <span class="mi">7</span><span class="p">,</span> <span class="mi">8</span><span class="p">,</span> <span class="mi">8</span><span class="p">]))</span>
<span class="go">&lt;RaggedTensor [[3, 1, 4, 1], [], [5, 9, 2], [6], []]&gt;</span>
</pre></div>
</div>
</dd></dl>

<dl class="py method">
<dt id="open3d.ml.torch.classes.RaggedTensor.to_list">
<code class="sig-name descname">to_list</code><span class="sig-paren">(</span><span class="sig-paren">)</span><a class="headerlink" href="#open3d.ml.torch.classes.RaggedTensor.to_list" title="Permalink to this definition">¶</a></dt>
<dd><p>Returns a list of tensors</p>
</dd></dl>

<dl class="py method">
<dt id="open3d.ml.torch.classes.RaggedTensor.device">
<em class="property">property </em><code class="sig-name descname">device</code><a class="headerlink" href="#open3d.ml.torch.classes.RaggedTensor.device" title="Permalink to this definition">¶</a></dt>
<dd><p>The device of values in this ragged tensor.</p>
</dd></dl>

<dl class="py method">
<dt id="open3d.ml.torch.classes.RaggedTensor.dtype">
<em class="property">property </em><code class="sig-name descname">dtype</code><a class="headerlink" href="#open3d.ml.torch.classes.RaggedTensor.dtype" title="Permalink to this definition">¶</a></dt>
<dd><p>The <cite>DType</cite> of values in this ragged tensor.</p>
</dd></dl>

<dl class="py method">
<dt id="open3d.ml.torch.classes.RaggedTensor.requires_grad">
<em class="property">property </em><code class="sig-name descname">requires_grad</code><a class="headerlink" href="#open3d.ml.torch.classes.RaggedTensor.requires_grad" title="Permalink to this definition">¶</a></dt>
<dd><p>Read/writeble <cite>requires_grad</cite> for values.</p>
</dd></dl>

<dl class="py method">
<dt id="open3d.ml.torch.classes.RaggedTensor.row_splits">
<em class="property">property </em><code class="sig-name descname">row_splits</code><a class="headerlink" href="#open3d.ml.torch.classes.RaggedTensor.row_splits" title="Permalink to this definition">¶</a></dt>
<dd><p>The row-split indices for this ragged tensor’s <cite>values</cite>.</p>
</dd></dl>

<dl class="py method">
<dt id="open3d.ml.torch.classes.RaggedTensor.shape">
<em class="property">property </em><code class="sig-name descname">shape</code><a class="headerlink" href="#open3d.ml.torch.classes.RaggedTensor.shape" title="Permalink to this definition">¶</a></dt>
<dd><p>The statically known shape of this ragged tensor.</p>
</dd></dl>

<dl class="py method">
<dt id="open3d.ml.torch.classes.RaggedTensor.values">
<em class="property">property </em><code class="sig-name descname">values</code><a class="headerlink" href="#open3d.ml.torch.classes.RaggedTensor.values" title="Permalink to this definition">¶</a></dt>
<dd><p>The concatenated rows for this ragged tensor.</p>
</dd></dl>

</dd></dl>

</div>


           </div>
           
          </div>
          <footer>
  
    <div class="rst-footer-buttons" role="navigation" aria-label="footer navigation">
      
        <a href="open3d.ml.torch.dataloaders.html" class="btn btn-neutral float-right" title="open3d.ml.torch.dataloaders" accesskey="n" rel="next">Next <span class="fa fa-arrow-circle-right"></span></a>
      
      
        <a href="open3d.ml.torch.classes.html" class="btn btn-neutral float-left" title="open3d.ml.torch.classes" accesskey="p" rel="prev"><span class="fa fa-arrow-circle-left"></span> Previous</a>
      
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

<!-- Mirrored from www.open3d.org/docs/release/python_api/open3d.ml.torch.classes.RaggedTensor.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 14 May 2023 10:52:01 GMT -->
</html>