

<!DOCTYPE html>
<!--[if IE 8]><html class="no-js lt-ie9" lang="en" > <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang="en" > <!--<![endif]-->

<!-- Mirrored from www.open3d.org/docs/release/python_api/open3d.ml.tf.ops.voxel_pooling_grad.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 14 May 2023 10:52:20 GMT -->
<head>
  <meta charset="utf-8">
  
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  
  <title>open3d.ml.tf.ops.voxel_pooling_grad &mdash; Open3D 0.17.0 documentation</title>
  

  
  
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
    <link rel="next" title="open3d.ml.tf.ops.voxelize" href="open3d.ml.tf.ops.voxelize.html" />
    <link rel="prev" title="open3d.ml.tf.ops.voxel_pooling" href="open3d.ml.tf.ops.voxel_pooling.1f1.delaye" /> 
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
<li class="toctree-l3"><a class="reference internal" href="open3d.ml.tf.layers.html">layers</a></li>
<li class="toctree-l3"><a class="reference internal" href="open3d.ml.tf.models.html">models</a></li>
<li class="toctree-l3"><a class="reference internal" href="open3d.ml.tf.modules.html">modules</a></li>
<li class="toctree-l3 current"><a class="reference internal" href="open3d.ml.tf.ops.html">ops</a><ul class="current">
<li class="toctree-l4"><a class="reference internal" href="open3d.ml.tf.ops.build_spatial_hash_table">build_spatial_hash_table</a></li>
<li class="toctree-l4"><a class="reference internal" href="open3d.ml.tf.ops.continuous_conv.170.dela">continuous_conv</a></li>
<li class="toctree-l4"><a class="reference internal" href="open3d.ml.tf.ops.continuous_conv_backprop">continuous_conv_backprop_filter</a></li>
<li class="toctree-l4"><a class="reference internal" href="open3d.ml.tf.ops.continuous_conv_transpos">continuous_conv_transpose</a></li>
<li class="toctree-l4"><a class="reference internal" href="open3d.ml.tf.ops-2.continuous_conv_transpos">continuous_conv_transpose_backprop_filter</a></li>
<li class="toctree-l4"><a class="reference internal" href="open3d.ml.tf.ops.fixed_radius_search.186">fixed_radius_search</a></li>
<li class="toctree-l4"><a class="reference internal" href="open3d.ml.tf.ops.invert_neighbors_list.19">invert_neighbors_list</a></li>
<li class="toctree-l4"><a class="reference internal" href="open3d.ml.tf.ops.knn_search.html">knn_search</a></li>
<li class="toctree-l4"><a class="reference internal" href="open3d.ml.tf.ops.nms.html">nms</a></li>
<li class="toctree-l4"><a class="reference internal" href="open3d.ml.tf.ops.radius_search.1b1.delaye">radius_search</a></li>
<li class="toctree-l4"><a class="reference internal" href="open3d.ml.tf.ops.reduce_subarrays_sum.1c7">reduce_subarrays_sum</a></li>
<li class="toctree-l4"><a class="reference internal" href="open3d.ml.tf.ops.voxel_pooling.1f1.delaye">voxel_pooling</a></li>
<li class="toctree-l4 current"><a class="current reference internal" href="#">voxel_pooling_grad</a></li>
<li class="toctree-l4"><a class="reference internal" href="open3d.ml.tf.ops.voxelize.html">voxelize</a></li>
</ul>
</li>
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
        
          <li><a href="open3d.ml.tf.ops.html">open3d.ml.tf.ops</a> &raquo;</li>
        
      <li>open3d.ml.tf.ops.voxel_pooling_grad</li>
    
    
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
<div class="section" id="open3d-ml-tf-ops-voxel-pooling-grad">
<h1>open3d.ml.tf.ops.voxel_pooling_grad<a class="headerlink" href="#open3d-ml-tf-ops-voxel-pooling-grad" title="Permalink to this headline">¶</a></h1>
<dl class="py function">
<dt id="open3d.ml.tf.ops.voxel_pooling_grad">
<code class="sig-prename descclassname">open3d.ml.tf.ops.</code><code class="sig-name descname">voxel_pooling_grad</code><span class="sig-paren">(</span><em class="sig-param"><span class="n">positions</span></em>, <em class="sig-param"><span class="n">features</span></em>, <em class="sig-param"><span class="n">voxel_size</span></em>, <em class="sig-param"><span class="n">pooled_positions</span></em>, <em class="sig-param"><span class="n">pooled_features_gradient</span></em>, <em class="sig-param"><span class="n">position_fn</span><span class="o">=</span><span class="default_value">'average'</span></em>, <em class="sig-param"><span class="n">feature_fn</span><span class="o">=</span><span class="default_value">'average'</span></em>, <em class="sig-param"><span class="n">name</span><span class="o">=</span><span class="default_value">None</span></em><span class="sig-paren">)</span><a class="headerlink" href="#open3d.ml.tf.ops.voxel_pooling_grad" title="Permalink to this definition">¶</a></dt>
<dd><p>Gradient for features in VoxelPooling. For internal use only.</p>
<dl class="field-list simple">
<dt class="field-odd">Parameters</dt>
<dd class="field-odd"><ul class="simple">
<li><p><strong>positions</strong> – A <cite>Tensor</cite>. Must be one of the following types: <cite>float32</cite>, <cite>float64</cite>.</p></li>
<li><p><strong>features</strong> – A <cite>Tensor</cite>. Must be one of the following types: <cite>float32</cite>, <cite>float64</cite>, <cite>int32</cite>, <cite>int64</cite>.</p></li>
<li><p><strong>voxel_size</strong> – A <cite>Tensor</cite>. Must have the same type as <cite>positions</cite>.</p></li>
<li><p><strong>pooled_positions</strong> – A <cite>Tensor</cite>. Must have the same type as <cite>positions</cite>.</p></li>
<li><p><strong>pooled_features_gradient</strong> – A <cite>Tensor</cite>. Must have the same type as <cite>features</cite>.</p></li>
<li><p><strong>position_fn</strong> – An optional <cite>string</cite> from: <cite>“average”, “nearest_neighbor”, “center”</cite>. Defaults to <cite>“average”</cite>.</p></li>
<li><p><strong>feature_fn</strong> – An optional <cite>string</cite> from: <cite>“average”, “nearest_neighbor”, “max”</cite>. Defaults to <cite>“average”</cite>.</p></li>
<li><p><strong>name</strong> – A name for the operation (optional).</p></li>
</ul>
</dd>
<dt class="field-even">Returns</dt>
<dd class="field-even"><p>A <cite>Tensor</cite>. Has the same type as <cite>features</cite>.</p>
</dd>
</dl>
</dd></dl>

</div>


           </div>
           
          </div>
          <footer>
  
    <div class="rst-footer-buttons" role="navigation" aria-label="footer navigation">
      
        <a href="open3d.ml.tf.ops.voxelize.html" class="btn btn-neutral float-right" title="open3d.ml.tf.ops.voxelize" accesskey="n" rel="next">Next <span class="fa fa-arrow-circle-right"></span></a>
      
      
        <a href="open3d.ml.tf.ops.voxel_pooling.1f1.delaye" class="btn btn-neutral float-left" title="open3d.ml.tf.ops.voxel_pooling" accesskey="p" rel="prev"><span class="fa fa-arrow-circle-left"></span> Previous</a>
      
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

<!-- Mirrored from www.open3d.org/docs/release/python_api/open3d.ml.tf.ops.voxel_pooling_grad.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 14 May 2023 10:52:20 GMT -->
</html>