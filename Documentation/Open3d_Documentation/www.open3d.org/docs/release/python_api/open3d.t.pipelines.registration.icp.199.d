

<!DOCTYPE html>
<!--[if IE 8]><html class="no-js lt-ie9" lang="en" > <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang="en" > <!--<![endif]-->

<!-- Mirrored from www.open3d.org/docs/release/python_api/open3d.t.pipelines.registration.icp.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 14 May 2023 10:52:14 GMT -->
<head>
  <meta charset="utf-8">
  
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  
  <title>open3d.t.pipelines.registration.icp &mdash; Open3D 0.17.0 documentation</title>
  

  
  
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
    <link rel="next" title="open3d.t.pipelines.registration.multi_scale_icp" href="open3d.t.pipelines.registration.multi_sca" />
    <link rel="prev" title="open3d.t.pipelines.registration.get_information_matrix" href="open3d.t.pipelines.registration.get_infor" /> 
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
<li class="toctree-l1 current"><a class="reference internal" href="open3d.t.html">open3d.t</a><ul class="current">
<li class="toctree-l2"><a class="reference internal" href="open3d.t.geometry.html">geometry</a></li>
<li class="toctree-l2"><a class="reference internal" href="open3d.t.io.html">io</a></li>
<li class="toctree-l2 current"><a class="reference internal" href="open3d.t.pipelines.html">pipelines</a><ul class="current">
<li class="toctree-l3"><a class="reference internal" href="open3d.t.pipelines.odometry.html">odometry</a></li>
<li class="toctree-l3 current"><a class="reference internal" href="open3d.t.pipelines.registration.30b.delay">registration</a><ul class="current">
<li class="toctree-l4"><a class="reference internal" href="open3d.t.pipelines.registration.ICPConver">ICPConvergenceCriteria</a></li>
<li class="toctree-l4"><a class="reference internal" href="open3d.t.pipelines.registration.Registrat">RegistrationResult</a></li>
<li class="toctree-l4"><a class="reference internal" href="open3d.t.pipelines.registration.Transform">TransformationEstimation</a></li>
<li class="toctree-l4"><a class="reference internal" href="open3d.t.pipelines.registration-2.Transform">TransformationEstimationForColoredICP</a></li>
<li class="toctree-l4"><a class="reference internal" href="open3d.t.pipelines.registration-3.Transform">TransformationEstimationPointToPlane</a></li>
<li class="toctree-l4"><a class="reference internal" href="open3d.t.pipelines.registration-4.Transform">TransformationEstimationPointToPoint</a></li>
<li class="toctree-l4"><a class="reference internal" href="open3d.t.pipelines.registration.compute_f">compute_fpfh_feature</a></li>
<li class="toctree-l4"><a class="reference internal" href="open3d.t.pipelines.registration.evaluate_">evaluate_registration</a></li>
<li class="toctree-l4"><a class="reference internal" href="open3d.t.pipelines.registration.get_infor">get_information_matrix</a></li>
<li class="toctree-l4 current"><a class="current reference internal" href="#">icp</a></li>
<li class="toctree-l4"><a class="reference internal" href="open3d.t.pipelines.registration.multi_sca">multi_scale_icp</a></li>
</ul>
</li>
<li class="toctree-l3"><a class="reference internal" href="open3d.t.pipelines.slac.html">slac</a></li>
<li class="toctree-l3"><a class="reference internal" href="open3d.t.pipelines.slam.html">slam</a></li>
</ul>
</li>
</ul>
</li>
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
        
          <li><a href="open3d.t.html">open3d.t</a> &raquo;</li>
        
          <li><a href="open3d.t.pipelines.html">open3d.t.pipelines</a> &raquo;</li>
        
          <li><a href="open3d.t.pipelines.registration.30b.delay">open3d.t.pipelines.registration</a> &raquo;</li>
        
      <li>open3d.t.pipelines.registration.icp</li>
    
    
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
<div class="section" id="open3d-t-pipelines-registration-icp">
<h1>open3d.t.pipelines.registration.icp<a class="headerlink" href="#open3d-t-pipelines-registration-icp" title="Permalink to this headline">¶</a></h1>
<dl class="py function">
<dt id="open3d.t.pipelines.registration.icp">
<code class="sig-prename descclassname">open3d.t.pipelines.registration.</code><code class="sig-name descname">icp</code><span class="sig-paren">(</span><em class="sig-param">source</em>, <em class="sig-param">target</em>, <em class="sig-param">max_correspondence_distance</em>, <em class="sig-param">init_source_to_target=(with default value)</em>, <em class="sig-param">estimation_method=TransformationEstimationPointToPoint</em>, <em class="sig-param">criteria=ICPConvergenceCriteria[relative_fitness_=1.000000e-06</em>, <em class="sig-param">relative_rmse=1.000000e-06</em>, <em class="sig-param">max_iteration_=30].</em>, <em class="sig-param">voxel_size=-1.0</em>, <em class="sig-param">callback_after_iteration=None</em><span class="sig-paren">)</span><a class="headerlink" href="#open3d.t.pipelines.registration.icp" title="Permalink to this definition">¶</a></dt>
<dd><p>Function for ICP registration</p>
<dl class="field-list simple">
<dt class="field-odd">Parameters</dt>
<dd class="field-odd"><ul class="simple">
<li><p><strong>source</strong> (<a class="reference internal" href="open3d.t.geometry.PointCloud.html#open3d.t.geometry.PointCloud" title="open3d.t.geometry.PointCloud"><em>open3d.t.geometry.PointCloud</em></a>) – The source point cloud.</p></li>
<li><p><strong>target</strong> (<a class="reference internal" href="open3d.t.geometry.PointCloud.html#open3d.t.geometry.PointCloud" title="open3d.t.geometry.PointCloud"><em>open3d.t.geometry.PointCloud</em></a>) – The target point cloud.</p></li>
<li><p><strong>max_correspondence_distance</strong> (<em>float</em>) – Maximum correspondence points-pair distance.</p></li>
<li><p><strong>init_source_to_target</strong> (<a class="reference internal" href="open3d.core.Tensor.html#open3d.core.Tensor" title="open3d.core.Tensor"><em>open3d.core.Tensor</em></a><em>, </em><em>optional</em>) – <p>Initial transformation estimation Default value:</p>
<blockquote>
<div><p>[[1 0 0 0],
[0 1 0 0],
[0 0 1 0],
[0 0 0 1]]
Tensor[shape={4, 4}, stride={4, 1}, Float64</p>
</div></blockquote>
<p>()</p>
</p></li>
<li><p><strong>estimation_method</strong> (<a class="reference internal" href="open3d.t.pipelines.registration.Transform#open3d.t.pipelines.registration.TransformationEstimation" title="open3d.t.pipelines.registration.TransformationEstimation"><em>open3d.t.pipelines.registration.TransformationEstimation</em></a><em>, </em><em>optional</em><em>, </em><em>default=TransformationEstimationPointToPoint</em>) – Estimation method. One of (<code class="docutils literal notranslate"><span class="pre">TransformationEstimationPointToPoint</span></code>, <code class="docutils literal notranslate"><span class="pre">TransformationEstimationPointToPlane</span></code>, <code class="docutils literal notranslate"><span class="pre">TransformationEstimationForColoredICP</span></code>, <code class="docutils literal notranslate"><span class="pre">TransformationEstimationForGeneralizedICP</span></code>)</p></li>
<li><p><strong>criteria</strong> (<a class="reference internal" href="open3d.t.pipelines.registration.ICPConver#open3d.t.pipelines.registration.ICPConvergenceCriteria" title="open3d.t.pipelines.registration.ICPConvergenceCriteria"><em>open3d.t.pipelines.registration.ICPConvergenceCriteria</em></a><em>, </em><em>optional</em><em>, </em><em>default=ICPConvergenceCriteria</em><em>[</em><em>relative_fitness_=1.000000e-06</em><em>, </em><em>relative_rmse=1.000000e-06</em><em>, </em><em>max_iteration_=30</em><em>]</em><em></em>) – Convergence criteria</p></li>
<li><p><strong>voxel_size</strong> (<em>float</em><em>, </em><em>optional</em><em>, </em><em>default=-1.0</em>) – The input pointclouds will be down-sampled to this <cite>voxel_size</cite> scale. If <cite>voxel_size</cite> &lt; 0, original scale will be used. However it is highly recommended to down-sample the point-cloud for performance. By default original scale of the point-cloud will be used.</p></li>
<li><p><strong>callback_after_iteration</strong> (<em>Callable</em><em>[</em><em>[</em><em>Dict</em><em>[</em><em>str</em><em>, </em><a class="reference internal" href="open3d.core.Tensor.html#open3d.core.Tensor" title="open3d.core.Tensor"><em>open3d.core.Tensor</em></a><em>]</em><em>]</em><em>, </em><em>None</em><em>]</em><em>, </em><em>optional</em><em>, </em><em>default=None</em>) – Optional lambda function, saves string to tensor map of attributes such as iteration_index, scale_index, scale_iteration_index, inlier_rmse, fitness, transformation, on CPU device, updated after each iteration.</p></li>
</ul>
</dd>
<dt class="field-even">Returns</dt>
<dd class="field-even"><p>open3d.t.pipelines.registration.RegistrationResult</p>
</dd>
</dl>
</dd></dl>

</div>


           </div>
           
          </div>
          <footer>
  
    <div class="rst-footer-buttons" role="navigation" aria-label="footer navigation">
      
        <a href="open3d.t.pipelines.registration.multi_sca" class="btn btn-neutral float-right" title="open3d.t.pipelines.registration.multi_scale_icp" accesskey="n" rel="next">Next <span class="fa fa-arrow-circle-right"></span></a>
      
      
        <a href="open3d.t.pipelines.registration.get_infor" class="btn btn-neutral float-left" title="open3d.t.pipelines.registration.get_information_matrix" accesskey="p" rel="prev"><span class="fa fa-arrow-circle-left"></span> Previous</a>
      
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

<!-- Mirrored from www.open3d.org/docs/release/python_api/open3d.t.pipelines.registration.icp.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 14 May 2023 10:52:14 GMT -->
</html>