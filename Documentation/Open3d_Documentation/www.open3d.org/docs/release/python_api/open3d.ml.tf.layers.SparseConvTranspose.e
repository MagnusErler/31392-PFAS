

<!DOCTYPE html>
<!--[if IE 8]><html class="no-js lt-ie9" lang="en" > <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang="en" > <!--<![endif]-->

<!-- Mirrored from www.open3d.org/docs/release/python_api/open3d.ml.tf.layers.SparseConvTranspose.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 14 May 2023 10:51:59 GMT -->
<head>
  <meta charset="utf-8">
  
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  
  <title>open3d.ml.tf.layers.SparseConvTranspose &mdash; Open3D 0.17.0 documentation</title>
  

  
  
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
    <link rel="next" title="open3d.ml.tf.layers.VoxelPooling" href="open3d.ml.tf.layers.VoxelPooling.f0.delay" />
    <link rel="prev" title="open3d.ml.tf.layers.SparseConv" href="open3d.ml.tf.layers.SparseConv.html" /> 
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
<li class="toctree-l2 current"><a class="reference internal" href="open3d.ml.tf.html">tf</a><ul class="current">
<li class="toctree-l3"><a class="reference internal" href="open3d.ml.tf.dataloaders.html">dataloaders</a></li>
<li class="toctree-l3"><a class="reference internal" href="open3d.ml.tf.datasets.html">datasets</a></li>
<li class="toctree-l3 current"><a class="reference internal" href="open3d.ml.tf.layers.html">layers</a><ul class="current">
<li class="toctree-l4"><a class="reference internal" href="open3d.ml.tf.layers.ContinuousConv.ea.del">ContinuousConv</a></li>
<li class="toctree-l4"><a class="reference internal" href="open3d.ml.tf.layers.FixedRadiusSearch.eb">FixedRadiusSearch</a></li>
<li class="toctree-l4"><a class="reference internal" href="open3d.ml.tf.layers.KNNSearch.html">KNNSearch</a></li>
<li class="toctree-l4"><a class="reference internal" href="open3d.ml.tf.layers.RadiusSearch.ed.delay">RadiusSearch</a></li>
<li class="toctree-l4"><a class="reference internal" href="open3d.ml.tf.layers.SparseConv.html">SparseConv</a></li>
<li class="toctree-l4 current"><a class="current reference internal" href="#">SparseConvTranspose</a></li>
<li class="toctree-l4"><a class="reference internal" href="open3d.ml.tf.layers.VoxelPooling.f0.delay">VoxelPooling</a></li>
</ul>
</li>
<li class="toctree-l3"><a class="reference internal" href="open3d.ml.tf.models.html">models</a></li>
<li class="toctree-l3"><a class="reference internal" href="open3d.ml.tf.modules.html">modules</a></li>
<li class="toctree-l3"><a class="reference internal" href="open3d.ml.tf.ops.html">ops</a></li>
<li class="toctree-l3"><a class="reference internal" href="open3d.ml.tf.pipelines.html">pipelines</a></li>
<li class="toctree-l3"><a class="reference internal" href="open3d.ml.tf.vis.html">vis</a></li>
</ul>
</li>
<li class="toctree-l2"><a class="reference internal" href="open3d.ml.torch.html">torch</a></li>
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
        
          <li><a href="open3d.ml.tf.html">open3d.ml.tf</a> &raquo;</li>
        
          <li><a href="open3d.ml.tf.layers.html">open3d.ml.tf.layers</a> &raquo;</li>
        
      <li>open3d.ml.tf.layers.SparseConvTranspose</li>
    
    
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
<div class="section" id="open3d-ml-tf-layers-sparseconvtranspose">
<h1>open3d.ml.tf.layers.SparseConvTranspose<a class="headerlink" href="#open3d-ml-tf-layers-sparseconvtranspose" title="Permalink to this headline">¶</a></h1>
<dl class="py class">
<dt id="open3d.ml.tf.layers.SparseConvTranspose">
<em class="property">class </em><code class="sig-prename descclassname">open3d.ml.tf.layers.</code><code class="sig-name descname">SparseConvTranspose</code><span class="sig-paren">(</span><em class="sig-param"><span class="o">*</span><span class="n">args</span></em>, <em class="sig-param"><span class="o">**</span><span class="n">kwargs</span></em><span class="sig-paren">)</span><a class="headerlink" href="#open3d.ml.tf.layers.SparseConvTranspose" title="Permalink to this definition">¶</a></dt>
<dd><p>Sparse Transposed Convolution. This layer computes a transposed convolution which is only evaluated at the specified output positions.</p>
<p class="rubric">Example</p>
<p>This shows a minimal example of how to use the layer:</p>
<div class="highlight-default notranslate"><div class="highlight"><pre><span></span><span class="kn">import</span> <span class="nn">tensorflow</span> <span class="k">as</span> <span class="nn">tf</span>
<span class="kn">import</span> <span class="nn">open3d.ml.tf</span> <span class="k">as</span> <span class="nn">ml3d</span>

<span class="c1"># +0.5 to move the points to the voxel center</span>
<span class="n">inp_positions</span> <span class="o">=</span> <span class="n">tf</span><span class="o">.</span><span class="n">cast</span><span class="p">(</span><span class="n">tf</span><span class="o">.</span><span class="n">random</span><span class="o">.</span><span class="n">uniform</span><span class="p">([</span><span class="mi">20</span><span class="p">,</span><span class="mi">3</span><span class="p">],</span> <span class="mi">0</span><span class="p">,</span> <span class="mi">10</span><span class="p">,</span> <span class="n">dtype</span><span class="o">=</span><span class="n">tf</span><span class="o">.</span><span class="n">int32</span><span class="p">),</span> <span class="n">tf</span><span class="o">.</span><span class="n">float32</span><span class="p">)</span><span class="o">+</span><span class="mf">0.5</span>
<span class="n">inp_features</span> <span class="o">=</span> <span class="n">tf</span><span class="o">.</span><span class="n">random</span><span class="o">.</span><span class="n">normal</span><span class="p">([</span><span class="mi">20</span><span class="p">,</span><span class="mi">8</span><span class="p">])</span>
<span class="n">out_positions</span> <span class="o">=</span> <span class="n">tf</span><span class="o">.</span><span class="n">cast</span><span class="p">(</span><span class="n">tf</span><span class="o">.</span><span class="n">random</span><span class="o">.</span><span class="n">uniform</span><span class="p">([</span><span class="mi">20</span><span class="p">,</span><span class="mi">3</span><span class="p">],</span> <span class="mi">0</span><span class="p">,</span> <span class="mi">10</span><span class="p">,</span> <span class="n">dtype</span><span class="o">=</span><span class="n">tf</span><span class="o">.</span><span class="n">int32</span><span class="p">),</span> <span class="n">tf</span><span class="o">.</span><span class="n">float32</span><span class="p">)</span><span class="o">+</span><span class="mf">0.5</span>

<span class="n">conv</span> <span class="o">=</span> <span class="n">ml3d</span><span class="o">.</span><span class="n">layers</span><span class="o">.</span><span class="n">SparseConvTranspose</span><span class="p">(</span><span class="n">filters</span><span class="o">=</span><span class="mi">16</span><span class="p">,</span> <span class="n">kernel_size</span><span class="o">=</span><span class="p">[</span><span class="mi">3</span><span class="p">,</span><span class="mi">3</span><span class="p">,</span><span class="mi">3</span><span class="p">])</span>
<span class="n">out_features</span> <span class="o">=</span> <span class="n">conv</span><span class="p">(</span><span class="n">inp_features</span><span class="p">,</span> <span class="n">inp_positions</span><span class="p">,</span> <span class="n">out_positions</span><span class="p">,</span> <span class="n">voxel_size</span><span class="o">=</span><span class="mf">1.0</span><span class="p">)</span>
</pre></div>
</div>
<dl class="field-list simple">
<dt class="field-odd">Parameters</dt>
<dd class="field-odd"><ul class="simple">
<li><p><strong>filters</strong> – The number of filters/output channels.</p></li>
<li><p><strong>kernel_size</strong> – The spatial resolution of the filter, e.g. [3,3,3].</p></li>
<li><p><strong>activation</strong> – The activation function to use. None means no activation.</p></li>
<li><p><strong>use_bias</strong> – If True adds an additive bias vector.</p></li>
<li><p><strong>kernel_initializer</strong> – Initializer for the kernel weights.</p></li>
<li><p><strong>bias_initializer</strong> – Initializer for the bias vector.</p></li>
<li><p><strong>kernel_regularizer</strong> – Regularizer for the kernel weights.</p></li>
<li><p><strong>bias_regularizer</strong> – Regularizer for the bias vector.</p></li>
<li><p><strong>normalize</strong> – If true then the input features will be normalized with the number of
output points.</p></li>
<li><p><strong>offset</strong> – A single 3D vector used in the filter coordinate computation.
The shape is [3]. This can be used to control how the filters are
centered. It will be set automatically for kernels with even sizes.</p></li>
<li><p><strong>in_channels</strong> – This keyword argument is for compatibility with PyTorch.
It is not used and in_channels will be inferred at the first execution
of the layer.</p></li>
</ul>
</dd>
</dl>
<dl class="py method">
<dt id="open3d.ml.tf.layers.SparseConvTranspose.__init__">
<code class="sig-name descname">__init__</code><span class="sig-paren">(</span><em class="sig-param"><span class="n">filters</span></em>, <em class="sig-param"><span class="n">kernel_size</span></em>, <em class="sig-param"><span class="n">activation</span><span class="o">=</span><span class="default_value">None</span></em>, <em class="sig-param"><span class="n">use_bias</span><span class="o">=</span><span class="default_value">True</span></em>, <em class="sig-param"><span class="n">kernel_initializer</span><span class="o">=</span><span class="default_value">'uniform'</span></em>, <em class="sig-param"><span class="n">bias_initializer</span><span class="o">=</span><span class="default_value">'zeros'</span></em>, <em class="sig-param"><span class="n">kernel_regularizer</span><span class="o">=</span><span class="default_value">None</span></em>, <em class="sig-param"><span class="n">bias_regularizer</span><span class="o">=</span><span class="default_value">None</span></em>, <em class="sig-param"><span class="n">normalize</span><span class="o">=</span><span class="default_value">False</span></em>, <em class="sig-param"><span class="n">offset</span><span class="o">=</span><span class="default_value">None</span></em>, <em class="sig-param"><span class="n">in_channels</span><span class="o">=</span><span class="default_value">None</span></em>, <em class="sig-param"><span class="o">**</span><span class="n">kwargs</span></em><span class="sig-paren">)</span><a class="headerlink" href="#open3d.ml.tf.layers.SparseConvTranspose.__init__" title="Permalink to this definition">¶</a></dt>
<dd></dd></dl>

<dl class="py method">
<dt id="open3d.ml.tf.layers.SparseConvTranspose.build">
<code class="sig-name descname">build</code><span class="sig-paren">(</span><em class="sig-param"><span class="n">inp_features_shape</span></em><span class="sig-paren">)</span><a class="headerlink" href="#open3d.ml.tf.layers.SparseConvTranspose.build" title="Permalink to this definition">¶</a></dt>
<dd><p>Creates the variables of the layer (optional, for subclass implementers).</p>
<p>This is a method that implementers of subclasses of <cite>Layer</cite> or <cite>Model</cite>
can override if they need a state-creation step in-between
layer instantiation and layer call. It is invoked automatically before
the first execution of <cite>call()</cite>.</p>
<p>This is typically used to create the weights of <cite>Layer</cite> subclasses
(at the discretion of the subclass implementer).</p>
<dl class="field-list simple">
<dt class="field-odd">Parameters</dt>
<dd class="field-odd"><p><strong>input_shape</strong> – Instance of <cite>TensorShape</cite>, or list of instances of
<cite>TensorShape</cite> if the layer expects a list of inputs
(one instance per input).</p>
</dd>
</dl>
</dd></dl>

<dl class="py method">
<dt id="open3d.ml.tf.layers.SparseConvTranspose.call">
<code class="sig-name descname">call</code><span class="sig-paren">(</span><em class="sig-param"><span class="n">inp_features</span></em>, <em class="sig-param"><span class="n">inp_positions</span></em>, <em class="sig-param"><span class="n">out_positions</span></em>, <em class="sig-param"><span class="n">voxel_size</span></em>, <em class="sig-param"><span class="n">out_importance</span><span class="o">=</span><span class="default_value">None</span></em>, <em class="sig-param"><span class="n">fixed_radius_search_hash_table</span><span class="o">=</span><span class="default_value">None</span></em><span class="sig-paren">)</span><a class="headerlink" href="#open3d.ml.tf.layers.SparseConvTranspose.call" title="Permalink to this definition">¶</a></dt>
<dd><p>This function computes the output features.</p>
<dl class="field-list simple">
<dt class="field-odd">Parameters</dt>
<dd class="field-odd"><ul class="simple">
<li><p><strong>inp_features</strong> – A 2D tensor which stores a feature vector for each input
point. <em>This argument must be given as a positional argument!</em></p></li>
<li><p><strong>inp_positions</strong> – A 2D tensor with the 3D point positions of each input
point. The coordinates for each point is a vector with format [x,y,z].</p></li>
<li><p><strong>out_positions</strong> – A 2D tensor with the 3D point positions of each output
point. The coordinates for each point is a vector with format [x,y,z].</p></li>
<li><p><strong>voxel_size</strong> – A scalar float that defines the edge length of a voxel.</p></li>
<li><p><strong>out_importance</strong> – Optional scalar importance value for each output point.</p></li>
<li><p><strong>fixed_radius_search_hash_table</strong> – A precomputed hash table generated with
build_spatial_hash_table(). This input can be used to explicitly force the
reuse of a hash table in special cases and is usually not needed.
Note that the hash table must have been generated with the same ‘points’
array. Note that this parameter is only used if ‘extents’ is a scalar.</p></li>
</ul>
</dd>
</dl>
<dl class="simple">
<dt>Returns: A tensor of shape [num output points, filters] with the output</dt><dd><p>features.</p>
</dd>
</dl>
</dd></dl>

<dl class="py method">
<dt id="open3d.ml.tf.layers.SparseConvTranspose.compute_output_shape">
<code class="sig-name descname">compute_output_shape</code><span class="sig-paren">(</span><em class="sig-param"><span class="n">inp_features_shape</span></em><span class="sig-paren">)</span><a class="headerlink" href="#open3d.ml.tf.layers.SparseConvTranspose.compute_output_shape" title="Permalink to this definition">¶</a></dt>
<dd><p>Computes the output shape of the layer.</p>
<p>This method will cause the layer’s state to be built, if that has not
happened before. This requires that the layer will later be used with
inputs that match the input shape provided here.</p>
<dl class="field-list simple">
<dt class="field-odd">Parameters</dt>
<dd class="field-odd"><p><strong>input_shape</strong> – Shape tuple (tuple of integers)
or list of shape tuples (one per output tensor of the layer).
Shape tuples can include None for free dimensions,
instead of an integer.</p>
</dd>
<dt class="field-even">Returns</dt>
<dd class="field-even"><p>An input shape tuple.</p>
</dd>
</dl>
</dd></dl>

</dd></dl>

</div>


           </div>
           
          </div>
          <footer>
  
    <div class="rst-footer-buttons" role="navigation" aria-label="footer navigation">
      
        <a href="open3d.ml.tf.layers.VoxelPooling.f0.delay" class="btn btn-neutral float-right" title="open3d.ml.tf.layers.VoxelPooling" accesskey="n" rel="next">Next <span class="fa fa-arrow-circle-right"></span></a>
      
      
        <a href="open3d.ml.tf.layers.SparseConv.html" class="btn btn-neutral float-left" title="open3d.ml.tf.layers.SparseConv" accesskey="p" rel="prev"><span class="fa fa-arrow-circle-left"></span> Previous</a>
      
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

<!-- Mirrored from www.open3d.org/docs/release/python_api/open3d.ml.tf.layers.SparseConvTranspose.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 14 May 2023 10:51:59 GMT -->
</html>