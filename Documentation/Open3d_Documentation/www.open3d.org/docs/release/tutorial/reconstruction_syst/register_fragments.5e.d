

<!DOCTYPE html>
<!--[if IE 8]><html class="no-js lt-ie9" lang="en" > <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang="en" > <!--<![endif]-->

<!-- Mirrored from www.open3d.org/docs/release/tutorial/reconstruction_system/register_fragments.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 14 May 2023 10:47:12 GMT -->
<head>
  <meta charset="utf-8">
  
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  
  <title>Register fragments &mdash; Open3D 0.17.0 documentation</title>
  

  
  
    <link rel="shortcut icon" href="../../_static/open3d_logo.ico"/>
  
  
  

  
  <script type="text/javascript" src="../../_static/js/modernizr.min.js"></script>
  
    
      <script type="text/javascript" id="documentation_options" data-url_root="../../" src="../../_static/documentation_options.js"></script>
        <script src="../../_static/jquery.js"></script>
        <script src="../../_static/underscore.js"></script>
        <script src="../../_static/doctools.js"></script>
        <script src="../../_static/language_data.js"></script>
        <script async="async" src="https://www.googletagmanager.com/gtag/js?id=G-3TQPKGV6Z3"></script>
        <script >
        window.dataLayer = window.dataLayer || [];
        function gtag(){dataLayer.push(arguments);}
        gtag('js', new Date());
        gtag('config', 'G-3TQPKGV6Z3');</script>
        <script crossorigin="anonymous" integrity="sha256-Ae2Vz/4ePdIu6ZyI/5ZGsYnb+m0JlOmKPjt6XZ9JJkA=" src="../../../../../cdnjs.cloudflare.com/ajax/libs/require.js/2.3.4/require.min.js"></script>
        <script async="async" src="../../../../../cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.7/latestdda6.js?config=TeX-AMS-MML_HTMLorMML"></script>
        <script type="text/x-mathjax-config">MathJax.Hub.Config({"tex2jax": {"inlineMath": [["$", "$"], ["\\(", "\\)"]], "processEscapes": true, "ignoreClass": "document", "processClass": "math|output_area"}})</script>
    
    <script type="text/javascript" src="../../_static/js/theme.js"></script>

    

  
  <link rel="stylesheet" href="../../_static/css/theme.css" type="text/css" />
  <link rel="stylesheet" href="../../_static/pygments.css" type="text/css" />
  <link rel="stylesheet" href="../../_static/theme_overrides.css" type="text/css" />
    <link rel="index" title="Index" href="../../genindex.html" />
    <link rel="search" title="Search" href="../../search.html" />
    <link rel="next" title="Refine registration" href="refine_registration.5f" />
    <link rel="prev" title="Make fragments" href="make_fragments.5d.delay" /> 
</head>

<body class="wy-body-for-nav">

   
  <div class="wy-grid-for-nav">
    
    <nav data-toggle="wy-nav-shift" class="wy-nav-side">
      <div class="wy-side-scroll">
        <div class="wy-side-nav-search" >
          

          
            <a href="../../index-2.html" class="icon icon-home"> Open3D
          

          
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
<li class="toctree-l1"><a class="reference internal" href="../../introduction.html">Introduction</a></li>
<li class="toctree-l1"><a class="reference internal" href="../../getting_started.html">Getting started</a></li>
<li class="toctree-l1"><a class="reference internal" href="../../compilation.html">Build from source</a></li>
<li class="toctree-l1"><a class="reference internal" href="../../cpp_project.html">Link Open3D in C++ projects</a></li>
<li class="toctree-l1"><a class="reference internal" href="../../builddocs.html">Build documentation</a></li>
<li class="toctree-l1"><a class="reference internal" href="../../open3d_ml.html">Open3D-ML</a></li>
<li class="toctree-l1"><a class="reference internal" href="../../arm.html">ARM support</a></li>
<li class="toctree-l1"><a class="reference internal" href="../../docker.html">Docker</a></li>
</ul>
<p class="caption"><span class="caption-text">Tutorial</span></p>
<ul class="current">
<li class="toctree-l1"><a class="reference internal" href="../geometry/index.html">Geometry</a></li>
<li class="toctree-l1"><a class="reference internal" href="../t_geometry/index.html">Geometry (Tensor)</a></li>
<li class="toctree-l1"><a class="reference internal" href="../pipelines/index.html">Pipelines</a></li>
<li class="toctree-l1"><a class="reference internal" href="../t_pipelines/index.html">Pipelines (Tensor)</a></li>
<li class="toctree-l1"><a class="reference internal" href="../visualization/index.html">Visualization</a></li>
<li class="toctree-l1"><a class="reference internal" href="../core/index.html">Core</a></li>
<li class="toctree-l1"><a class="reference internal" href="../data/index.html">Dataset</a></li>
<li class="toctree-l1 current"><a class="reference internal" href="../reconstruction_system/index.html">Reconstruction system</a><ul class="current">
<li class="toctree-l2"><a class="reference internal" href="system_overview.5c.dela">System overview</a></li>
<li class="toctree-l2"><a class="reference internal" href="make_fragments.5d.delay">Make fragments</a></li>
<li class="toctree-l2 current"><a class="current reference internal" href="#">Register fragments</a><ul>
<li class="toctree-l3"><a class="reference internal" href="#input-arguments">Input arguments</a></li>
<li class="toctree-l3"><a class="reference internal" href="#preprocess-point-cloud">Preprocess point cloud</a></li>
<li class="toctree-l3"><a class="reference internal" href="#compute-initial-registration">Compute initial registration</a></li>
<li class="toctree-l3"><a class="reference internal" href="#pairwise-global-registration">Pairwise global registration</a></li>
<li class="toctree-l3"><a class="reference internal" href="#multiway-registration">Multiway registration</a></li>
<li class="toctree-l3"><a class="reference internal" href="#main-registration-loop">Main registration loop</a></li>
<li class="toctree-l3"><a class="reference internal" href="#results">Results</a></li>
</ul>
</li>
<li class="toctree-l2"><a class="reference internal" href="refine_registration.5f">Refine registration</a></li>
<li class="toctree-l2"><a class="reference internal" href="integrate_scene.60.dela">Integrate scene</a></li>
<li class="toctree-l2"><a class="reference internal" href="capture_your_own_datase">Capture your own dataset</a></li>
</ul>
</li>
<li class="toctree-l1"><a class="reference internal" href="../t_reconstruction_system/index.html">Reconstruction system (Tensor)</a></li>
<li class="toctree-l1"><a class="reference internal" href="../sensor/index.html">Sensor</a></li>
<li class="toctree-l1"><a class="reference internal" href="../reference.html">Reference</a></li>
</ul>
<p class="caption"><span class="caption-text">Contribute</span></p>
<ul>
<li class="toctree-l1"><a class="reference internal" href="../../contribute/contribute.html">Contributing to Open3D</a></li>
<li class="toctree-l1"><a class="reference internal" href="../../contribute/contribution_recipes.html">Contribution methods</a></li>
<li class="toctree-l1"><a class="reference internal" href="../../contribute/styleguide.html">Open3D style guide</a></li>
</ul>
<p class="caption"><span class="caption-text">C++ API</span></p>
<ul>
<li class="toctree-l1"><a class="reference internal" href="../../cpp_api.html">C++ documentation</a></li>
</ul>
<p class="caption"><span class="caption-text">Python API</span></p>
<ul>
<li class="toctree-l1"><a class="reference internal" href="../../python_api/open3d.camera.html">open3d.camera</a></li>
<li class="toctree-l1"><a class="reference internal" href="../../python_api/open3d.core.html">open3d.core</a></li>
<li class="toctree-l1"><a class="reference internal" href="../../python_api/open3d.data.html">open3d.data</a></li>
<li class="toctree-l1"><a class="reference internal" href="../../python_api/open3d.geometry.html">open3d.geometry</a></li>
<li class="toctree-l1"><a class="reference internal" href="../../python_api/open3d.io.html">open3d.io</a></li>
<li class="toctree-l1"><a class="reference internal" href="../../python_api/open3d.t.html">open3d.t</a></li>
<li class="toctree-l1"><a class="reference internal" href="../../python_api/open3d.ml.html">open3d.ml</a></li>
<li class="toctree-l1"><a class="reference internal" href="../../python_api/open3d.pipelines.html">open3d.pipelines</a></li>
<li class="toctree-l1"><a class="reference internal" href="../../python_api/open3d.utility.html">open3d.utility</a></li>
<li class="toctree-l1"><a class="reference internal" href="../../python_api/open3d.visualization.html">open3d.visualization</a></li>
</ul>
<p class="caption"><span class="caption-text">Python Examples</span></p>
<ul>
<li class="toctree-l1"><a class="reference internal" href="../../python_example/camera/index.html">Camera</a></li>
<li class="toctree-l1"><a class="reference internal" href="../../python_example/geometry/index.html">Geometry</a></li>
<li class="toctree-l1"><a class="reference internal" href="../../python_example/io/index.html">IO</a></li>
<li class="toctree-l1"><a class="reference internal" href="../../python_example/pipelines/index.html">Pipelines</a></li>
<li class="toctree-l1"><a class="reference internal" href="../../python_example/utility/index.html">Utility</a></li>
<li class="toctree-l1"><a class="reference internal" href="../../python_example/visualization/index.html">Visualization</a></li>
</ul>

            
          
        </div>
      </div>
    </nav>

    <section data-toggle="wy-nav-shift" class="wy-nav-content-wrap">

      
      <nav class="wy-nav-top" aria-label="top navigation">
        
          <i data-toggle="wy-nav-top" class="fa fa-bars"></i>
          <a href="../../index-2.html">Open3D</a>
        
      </nav>


      <div class="wy-nav-content">
        
        <div class="rst-content">
        
          















<div role="navigation" aria-label="breadcrumbs navigation">

  <ul class="wy-breadcrumbs">
    
      <li><a href="../../index-2.html">Docs</a> &raquo;</li>
        
          <li><a href="../reconstruction_system/index.html">Reconstruction system</a> &raquo;</li>
        
      <li>Register fragments</li>
    
    
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
<div class="section" id="register-fragments">
<span id="reconstruction-system-register-fragments"></span><h1>Register fragments<a class="headerlink" href="#register-fragments" title="Permalink to this headline">¶</a></h1>
<p>Once the fragments of the scene are created, the next step is to align them in a
global space.</p>
<div class="section" id="input-arguments">
<h2>Input arguments<a class="headerlink" href="#input-arguments" title="Permalink to this headline">¶</a></h2>
<p>This script runs with <code class="docutils literal notranslate"><span class="pre">python</span> <span class="pre">run_system.py</span> <span class="pre">[config]</span> <span class="pre">--register</span></code>. In <code class="docutils literal notranslate"><span class="pre">[config]</span></code>, <code class="docutils literal notranslate"><span class="pre">[&quot;path_dataset&quot;]</span></code> should have subfolders <code class="docutils literal notranslate"><span class="pre">fragments</span></code> which stores fragments in <code class="docutils literal notranslate"><span class="pre">.ply</span></code> files and a pose graph in a <code class="docutils literal notranslate"><span class="pre">.json</span></code> file.</p>
<p>The main function runs <code class="docutils literal notranslate"><span class="pre">make_posegraph_for_scene</span></code> and
<code class="docutils literal notranslate"><span class="pre">optimize_posegraph_for_scene</span></code>. The first function performs pairwise
registration. The second function performs multiway registration.</p>
</div>
<div class="section" id="preprocess-point-cloud">
<h2>Preprocess point cloud<a class="headerlink" href="#preprocess-point-cloud" title="Permalink to this headline">¶</a></h2>
<div class="highlight-python notranslate"><div class="highlight"><table class="highlighttable"><tr><td class="linenos"><div class="linenodiv"><pre><span class="normal">41</span>
<span class="normal">42</span>
<span class="normal">43</span>
<span class="normal">44</span>
<span class="normal">45</span>
<span class="normal">46</span>
<span class="normal">47</span>
<span class="normal">48</span>
<span class="normal">49</span>
<span class="normal">50</span>
<span class="normal">51</span>
<span class="normal">52</span>
<span class="normal">53</span>
<span class="normal">54</span></pre></div></td><td class="code"><div><pre><span></span>    <span class="n">pcd_down</span><span class="o">.</span><span class="n">estimate_normals</span><span class="p">(</span>
            <span class="n">source</span><span class="p">,</span> <span class="n">target</span><span class="p">,</span> <span class="n">source_fpfh</span><span class="p">,</span> <span class="n">target_fpfh</span><span class="p">,</span>
            <span class="n">o3d</span><span class="o">.</span><span class="n">pipelines</span><span class="o">.</span><span class="n">registration</span><span class="o">.</span><span class="n">FastGlobalRegistrationOption</span><span class="p">(</span>
                <span class="n">maximum_correspondence_distance</span><span class="o">=</span><span class="n">distance_threshold</span><span class="p">))</span>
    <span class="k">if</span> <span class="n">config</span><span class="p">[</span><span class="s2">&quot;global_registration&quot;</span><span class="p">]</span> <span class="o">==</span> <span class="s2">&quot;ransac&quot;</span><span class="p">:</span>
        <span class="c1"># Fallback to preset parameters that works better</span>
        <span class="n">result</span> <span class="o">=</span> <span class="n">o3d</span><span class="o">.</span><span class="n">pipelines</span><span class="o">.</span><span class="n">registration</span><span class="o">.</span><span class="n">registration_ransac_based_on_feature_matching</span><span class="p">(</span>
            <span class="n">source</span><span class="p">,</span> <span class="n">target</span><span class="p">,</span> <span class="n">source_fpfh</span><span class="p">,</span> <span class="n">target_fpfh</span><span class="p">,</span> <span class="kc">False</span><span class="p">,</span> <span class="n">distance_threshold</span><span class="p">,</span>
            <span class="n">o3d</span><span class="o">.</span><span class="n">pipelines</span><span class="o">.</span><span class="n">registration</span><span class="o">.</span><span class="n">TransformationEstimationPointToPoint</span><span class="p">(</span>
                <span class="kc">False</span><span class="p">),</span> <span class="mi">4</span><span class="p">,</span>
            <span class="p">[</span>
                <span class="n">o3d</span><span class="o">.</span><span class="n">pipelines</span><span class="o">.</span><span class="n">registration</span><span class="o">.</span>
                <span class="n">CorrespondenceCheckerBasedOnEdgeLength</span><span class="p">(</span><span class="mf">0.9</span><span class="p">),</span>
                <span class="n">o3d</span><span class="o">.</span><span class="n">pipelines</span><span class="o">.</span><span class="n">registration</span><span class="o">.</span><span class="n">CorrespondenceCheckerBasedOnDistance</span><span class="p">(</span>
</pre></div></td></tr></table></div>
</div>
<p>This function downsamples a point cloud to make it sparser and regularly
distributed. Normals and FPFH feature are precomputed. See
<a class="reference internal" href="../geometry/pointcloud.html#Voxel-downsampling"><span class="std std-ref">Voxel downsampling</span></a>,
<a class="reference internal" href="../geometry/pointcloud.html#Vertex-normal-estimation"><span class="std std-ref">Vertex normal estimation</span></a>, and
<a class="reference internal" href="../pipelines/global_registration.html#Extract-geometric-feature"><span class="std std-ref">Extract geometric feature</span></a>
for more details.</p>
</div>
<div class="section" id="compute-initial-registration">
<h2>Compute initial registration<a class="headerlink" href="#compute-initial-registration" title="Permalink to this headline">¶</a></h2>
<div class="highlight-python notranslate"><div class="highlight"><table class="highlighttable"><tr><td class="linenos"><div class="linenodiv"><pre><span class="normal"> 85</span>
<span class="normal"> 86</span>
<span class="normal"> 87</span>
<span class="normal"> 88</span>
<span class="normal"> 89</span>
<span class="normal"> 90</span>
<span class="normal"> 91</span>
<span class="normal"> 92</span>
<span class="normal"> 93</span>
<span class="normal"> 94</span>
<span class="normal"> 95</span>
<span class="normal"> 96</span>
<span class="normal"> 97</span>
<span class="normal"> 98</span>
<span class="normal"> 99</span>
<span class="normal">100</span>
<span class="normal">101</span>
<span class="normal">102</span>
<span class="normal">103</span>
<span class="normal">104</span>
<span class="normal">105</span>
<span class="normal">106</span>
<span class="normal">107</span>
<span class="normal">108</span>
<span class="normal">109</span>
<span class="normal">110</span>
<span class="normal">111</span>
<span class="normal">112</span>
<span class="normal">113</span>
<span class="normal">114</span></pre></div></td><td class="code"><div><pre><span></span>    <span class="n">pcd_down</span><span class="o">.</span><span class="n">estimate_normals</span><span class="p">(</span>
                                                  <span class="n">config</span><span class="p">)</span>
        <span class="k">if</span> <span class="ow">not</span> <span class="n">success</span><span class="p">:</span>
            <span class="nb">print</span><span class="p">(</span><span class="s2">&quot;No reasonable solution. Skip this pair&quot;</span><span class="p">)</span>
            <span class="k">return</span> <span class="p">(</span><span class="kc">False</span><span class="p">,</span> <span class="n">np</span><span class="o">.</span><span class="n">identity</span><span class="p">(</span><span class="mi">4</span><span class="p">),</span> <span class="n">np</span><span class="o">.</span><span class="n">zeros</span><span class="p">((</span><span class="mi">6</span><span class="p">,</span> <span class="mi">6</span><span class="p">)))</span>
    <span class="nb">print</span><span class="p">(</span><span class="n">transformation</span><span class="p">)</span>

    <span class="k">if</span> <span class="n">config</span><span class="p">[</span><span class="s2">&quot;debug_mode&quot;</span><span class="p">]:</span>
        <span class="n">draw_registration_result</span><span class="p">(</span><span class="n">source_down</span><span class="p">,</span> <span class="n">target_down</span><span class="p">,</span> <span class="n">transformation</span><span class="p">)</span>
    <span class="k">return</span> <span class="p">(</span><span class="kc">True</span><span class="p">,</span> <span class="n">transformation</span><span class="p">,</span> <span class="n">information</span><span class="p">)</span>


<span class="k">def</span> <span class="nf">update_posegraph_for_scene</span><span class="p">(</span><span class="n">s</span><span class="p">,</span> <span class="n">t</span><span class="p">,</span> <span class="n">transformation</span><span class="p">,</span> <span class="n">information</span><span class="p">,</span> <span class="n">odometry</span><span class="p">,</span>
                               <span class="n">pose_graph</span><span class="p">):</span>
    <span class="k">if</span> <span class="n">t</span> <span class="o">==</span> <span class="n">s</span> <span class="o">+</span> <span class="mi">1</span><span class="p">:</span>  <span class="c1"># odometry case</span>
        <span class="n">odometry</span> <span class="o">=</span> <span class="n">np</span><span class="o">.</span><span class="n">dot</span><span class="p">(</span><span class="n">transformation</span><span class="p">,</span> <span class="n">odometry</span><span class="p">)</span>
        <span class="n">odometry_inv</span> <span class="o">=</span> <span class="n">np</span><span class="o">.</span><span class="n">linalg</span><span class="o">.</span><span class="n">inv</span><span class="p">(</span><span class="n">odometry</span><span class="p">)</span>
        <span class="n">pose_graph</span><span class="o">.</span><span class="n">nodes</span><span class="o">.</span><span class="n">append</span><span class="p">(</span>
            <span class="n">o3d</span><span class="o">.</span><span class="n">pipelines</span><span class="o">.</span><span class="n">registration</span><span class="o">.</span><span class="n">PoseGraphNode</span><span class="p">(</span><span class="n">odometry_inv</span><span class="p">))</span>
        <span class="n">pose_graph</span><span class="o">.</span><span class="n">edges</span><span class="o">.</span><span class="n">append</span><span class="p">(</span>
            <span class="n">o3d</span><span class="o">.</span><span class="n">pipelines</span><span class="o">.</span><span class="n">registration</span><span class="o">.</span><span class="n">PoseGraphEdge</span><span class="p">(</span><span class="n">s</span><span class="p">,</span>
                                                     <span class="n">t</span><span class="p">,</span>
                                                     <span class="n">transformation</span><span class="p">,</span>
                                                     <span class="n">information</span><span class="p">,</span>
                                                     <span class="n">uncertain</span><span class="o">=</span><span class="kc">False</span><span class="p">))</span>
    <span class="k">else</span><span class="p">:</span>  <span class="c1"># loop closure case</span>
        <span class="n">pose_graph</span><span class="o">.</span><span class="n">edges</span><span class="o">.</span><span class="n">append</span><span class="p">(</span>
            <span class="n">o3d</span><span class="o">.</span><span class="n">pipelines</span><span class="o">.</span><span class="n">registration</span><span class="o">.</span><span class="n">PoseGraphEdge</span><span class="p">(</span><span class="n">s</span><span class="p">,</span>
                                                     <span class="n">t</span><span class="p">,</span>
                                                     <span class="n">transformation</span><span class="p">,</span>
</pre></div></td></tr></table></div>
</div>
<p>This function computes a rough alignment between two fragments. If the fragments
are neighboring fragments, the rough alignment is determined by an aggregating
RGBD odometry obtained from <a class="reference internal" href="make_fragments.5d.delay#reconstruction-system-make-fragments"><span class="std std-ref">Make fragments</span></a>.
Otherwise, <code class="docutils literal notranslate"><span class="pre">register_point_cloud_fpfh</span></code> is called to perform global
registration. Note that global registration is less reliable according to <a class="reference internal" href="../reference.html#choi2015" id="id1"><span>[Choi2015]</span></a>.</p>
</div>
<div class="section" id="pairwise-global-registration">
<span id="reconstruction-system-feature-matching"></span><h2>Pairwise global registration<a class="headerlink" href="#pairwise-global-registration" title="Permalink to this headline">¶</a></h2>
<div class="highlight-python notranslate"><div class="highlight"><table class="highlighttable"><tr><td class="linenos"><div class="linenodiv"><pre><span class="normal">54</span>
<span class="normal">55</span>
<span class="normal">56</span>
<span class="normal">57</span>
<span class="normal">58</span>
<span class="normal">59</span>
<span class="normal">60</span>
<span class="normal">61</span>
<span class="normal">62</span>
<span class="normal">63</span>
<span class="normal">64</span>
<span class="normal">65</span>
<span class="normal">66</span>
<span class="normal">67</span>
<span class="normal">68</span>
<span class="normal">69</span>
<span class="normal">70</span>
<span class="normal">71</span>
<span class="normal">72</span>
<span class="normal">73</span>
<span class="normal">74</span>
<span class="normal">75</span>
<span class="normal">76</span>
<span class="normal">77</span>
<span class="normal">78</span>
<span class="normal">79</span>
<span class="normal">80</span>
<span class="normal">81</span>
<span class="normal">82</span>
<span class="normal">83</span>
<span class="normal">84</span>
<span class="normal">85</span></pre></div></td><td class="code"><div><pre><span></span>    <span class="n">pcd_down</span><span class="o">.</span><span class="n">estimate_normals</span><span class="p">(</span>
                    <span class="n">distance_threshold</span><span class="p">)</span>
            <span class="p">],</span>
            <span class="n">o3d</span><span class="o">.</span><span class="n">pipelines</span><span class="o">.</span><span class="n">registration</span><span class="o">.</span><span class="n">RANSACConvergenceCriteria</span><span class="p">(</span>
                <span class="mi">1000000</span><span class="p">,</span> <span class="mf">0.999</span><span class="p">))</span>
    <span class="k">if</span> <span class="p">(</span><span class="n">result</span><span class="o">.</span><span class="n">transformation</span><span class="o">.</span><span class="n">trace</span><span class="p">()</span> <span class="o">==</span> <span class="mf">4.0</span><span class="p">):</span>
        <span class="k">return</span> <span class="p">(</span><span class="kc">False</span><span class="p">,</span> <span class="n">np</span><span class="o">.</span><span class="n">identity</span><span class="p">(</span><span class="mi">4</span><span class="p">),</span> <span class="n">np</span><span class="o">.</span><span class="n">zeros</span><span class="p">((</span><span class="mi">6</span><span class="p">,</span> <span class="mi">6</span><span class="p">)))</span>
    <span class="n">information</span> <span class="o">=</span> <span class="n">o3d</span><span class="o">.</span><span class="n">pipelines</span><span class="o">.</span><span class="n">registration</span><span class="o">.</span><span class="n">get_information_matrix_from_point_clouds</span><span class="p">(</span>
        <span class="n">source</span><span class="p">,</span> <span class="n">target</span><span class="p">,</span> <span class="n">distance_threshold</span><span class="p">,</span> <span class="n">result</span><span class="o">.</span><span class="n">transformation</span><span class="p">)</span>
    <span class="k">if</span> <span class="n">information</span><span class="p">[</span><span class="mi">5</span><span class="p">,</span> <span class="mi">5</span><span class="p">]</span> <span class="o">/</span> <span class="nb">min</span><span class="p">(</span><span class="nb">len</span><span class="p">(</span><span class="n">source</span><span class="o">.</span><span class="n">points</span><span class="p">),</span> <span class="nb">len</span><span class="p">(</span><span class="n">target</span><span class="o">.</span><span class="n">points</span><span class="p">))</span> <span class="o">&lt;</span> <span class="mf">0.3</span><span class="p">:</span>
        <span class="k">return</span> <span class="p">(</span><span class="kc">False</span><span class="p">,</span> <span class="n">np</span><span class="o">.</span><span class="n">identity</span><span class="p">(</span><span class="mi">4</span><span class="p">),</span> <span class="n">np</span><span class="o">.</span><span class="n">zeros</span><span class="p">((</span><span class="mi">6</span><span class="p">,</span> <span class="mi">6</span><span class="p">)))</span>
    <span class="k">return</span> <span class="p">(</span><span class="kc">True</span><span class="p">,</span> <span class="n">result</span><span class="o">.</span><span class="n">transformation</span><span class="p">,</span> <span class="n">information</span><span class="p">)</span>


<span class="k">def</span> <span class="nf">compute_initial_registration</span><span class="p">(</span><span class="n">s</span><span class="p">,</span> <span class="n">t</span><span class="p">,</span> <span class="n">source_down</span><span class="p">,</span> <span class="n">target_down</span><span class="p">,</span> <span class="n">source_fpfh</span><span class="p">,</span>
                                 <span class="n">target_fpfh</span><span class="p">,</span> <span class="n">path_dataset</span><span class="p">,</span> <span class="n">config</span><span class="p">):</span>

    <span class="k">if</span> <span class="n">t</span> <span class="o">==</span> <span class="n">s</span> <span class="o">+</span> <span class="mi">1</span><span class="p">:</span>  <span class="c1"># odometry case</span>
        <span class="nb">print</span><span class="p">(</span><span class="s2">&quot;Using RGBD odometry&quot;</span><span class="p">)</span>
        <span class="n">pose_graph_frag</span> <span class="o">=</span> <span class="n">o3d</span><span class="o">.</span><span class="n">io</span><span class="o">.</span><span class="n">read_pose_graph</span><span class="p">(</span>
            <span class="n">join</span><span class="p">(</span><span class="n">path_dataset</span><span class="p">,</span>
                 <span class="n">config</span><span class="p">[</span><span class="s2">&quot;template_fragment_posegraph_optimized&quot;</span><span class="p">]</span> <span class="o">%</span> <span class="n">s</span><span class="p">))</span>
        <span class="n">n_nodes</span> <span class="o">=</span> <span class="nb">len</span><span class="p">(</span><span class="n">pose_graph_frag</span><span class="o">.</span><span class="n">nodes</span><span class="p">)</span>
        <span class="n">transformation_init</span> <span class="o">=</span> <span class="n">np</span><span class="o">.</span><span class="n">linalg</span><span class="o">.</span><span class="n">inv</span><span class="p">(</span><span class="n">pose_graph_frag</span><span class="o">.</span><span class="n">nodes</span><span class="p">[</span><span class="n">n_nodes</span> <span class="o">-</span>
                                                                  <span class="mi">1</span><span class="p">]</span><span class="o">.</span><span class="n">pose</span><span class="p">)</span>
        <span class="p">(</span><span class="n">transformation</span><span class="p">,</span> <span class="n">information</span><span class="p">)</span> <span class="o">=</span> \
                <span class="n">multiscale_icp</span><span class="p">(</span><span class="n">source_down</span><span class="p">,</span> <span class="n">target_down</span><span class="p">,</span>
                <span class="p">[</span><span class="n">config</span><span class="p">[</span><span class="s2">&quot;voxel_size&quot;</span><span class="p">]],</span> <span class="p">[</span><span class="mi">50</span><span class="p">],</span> <span class="n">config</span><span class="p">,</span> <span class="n">transformation_init</span><span class="p">)</span>
    <span class="k">else</span><span class="p">:</span>  <span class="c1"># loop closure case</span>
        <span class="p">(</span><span class="n">success</span><span class="p">,</span> <span class="n">transformation</span><span class="p">,</span>
         <span class="n">information</span><span class="p">)</span> <span class="o">=</span> <span class="n">register_point_cloud_fpfh</span><span class="p">(</span><span class="n">source_down</span><span class="p">,</span> <span class="n">target_down</span><span class="p">,</span>
                                                  <span class="n">source_fpfh</span><span class="p">,</span> <span class="n">target_fpfh</span><span class="p">,</span>
</pre></div></td></tr></table></div>
</div>
<p>This function uses <a class="reference internal" href="../pipelines/global_registration.html#RANSAC"><span class="std std-ref">RANSAC</span></a> or <a class="reference internal" href="../pipelines/global_registration.html#Fast-global-registration"><span class="std std-ref">Fast global registration</span></a> for pairwise global registration.</p>
</div>
<div class="section" id="multiway-registration">
<span id="reconstruction-system-compute-initial-registration"></span><h2>Multiway registration<a class="headerlink" href="#multiway-registration" title="Permalink to this headline">¶</a></h2>
<div class="highlight-python notranslate"><div class="highlight"><table class="highlighttable"><tr><td class="linenos"><div class="linenodiv"><pre><span class="normal">114</span>
<span class="normal">115</span>
<span class="normal">116</span>
<span class="normal">117</span>
<span class="normal">118</span>
<span class="normal">119</span>
<span class="normal">120</span>
<span class="normal">121</span>
<span class="normal">122</span>
<span class="normal">123</span>
<span class="normal">124</span>
<span class="normal">125</span>
<span class="normal">126</span>
<span class="normal">127</span>
<span class="normal">128</span>
<span class="normal">129</span>
<span class="normal">130</span>
<span class="normal">131</span>
<span class="normal">132</span>
<span class="normal">133</span>
<span class="normal">134</span>
<span class="normal">135</span>
<span class="normal">136</span>
<span class="normal">137</span></pre></div></td><td class="code"><div><pre><span></span>    <span class="n">pcd_down</span><span class="o">.</span><span class="n">estimate_normals</span><span class="p">(</span>
                                                     <span class="n">information</span><span class="p">,</span>
                                                     <span class="n">uncertain</span><span class="o">=</span><span class="kc">True</span><span class="p">))</span>
    <span class="k">return</span> <span class="p">(</span><span class="n">odometry</span><span class="p">,</span> <span class="n">pose_graph</span><span class="p">)</span>


<span class="k">def</span> <span class="nf">register_point_cloud_pair</span><span class="p">(</span><span class="n">ply_file_names</span><span class="p">,</span> <span class="n">s</span><span class="p">,</span> <span class="n">t</span><span class="p">,</span> <span class="n">config</span><span class="p">):</span>
    <span class="nb">print</span><span class="p">(</span><span class="s2">&quot;reading </span><span class="si">%s</span><span class="s2"> ...&quot;</span> <span class="o">%</span> <span class="n">ply_file_names</span><span class="p">[</span><span class="n">s</span><span class="p">])</span>
    <span class="n">source</span> <span class="o">=</span> <span class="n">o3d</span><span class="o">.</span><span class="n">io</span><span class="o">.</span><span class="n">read_point_cloud</span><span class="p">(</span><span class="n">ply_file_names</span><span class="p">[</span><span class="n">s</span><span class="p">])</span>
    <span class="nb">print</span><span class="p">(</span><span class="s2">&quot;reading </span><span class="si">%s</span><span class="s2"> ...&quot;</span> <span class="o">%</span> <span class="n">ply_file_names</span><span class="p">[</span><span class="n">t</span><span class="p">])</span>
    <span class="n">target</span> <span class="o">=</span> <span class="n">o3d</span><span class="o">.</span><span class="n">io</span><span class="o">.</span><span class="n">read_point_cloud</span><span class="p">(</span><span class="n">ply_file_names</span><span class="p">[</span><span class="n">t</span><span class="p">])</span>
    <span class="p">(</span><span class="n">source_down</span><span class="p">,</span> <span class="n">source_fpfh</span><span class="p">)</span> <span class="o">=</span> <span class="n">preprocess_point_cloud</span><span class="p">(</span><span class="n">source</span><span class="p">,</span> <span class="n">config</span><span class="p">)</span>
    <span class="p">(</span><span class="n">target_down</span><span class="p">,</span> <span class="n">target_fpfh</span><span class="p">)</span> <span class="o">=</span> <span class="n">preprocess_point_cloud</span><span class="p">(</span><span class="n">target</span><span class="p">,</span> <span class="n">config</span><span class="p">)</span>
    <span class="p">(</span><span class="n">success</span><span class="p">,</span> <span class="n">transformation</span><span class="p">,</span> <span class="n">information</span><span class="p">)</span> <span class="o">=</span> \
            <span class="n">compute_initial_registration</span><span class="p">(</span>
            <span class="n">s</span><span class="p">,</span> <span class="n">t</span><span class="p">,</span> <span class="n">source_down</span><span class="p">,</span> <span class="n">target_down</span><span class="p">,</span>
            <span class="n">source_fpfh</span><span class="p">,</span> <span class="n">target_fpfh</span><span class="p">,</span> <span class="n">config</span><span class="p">[</span><span class="s2">&quot;path_dataset&quot;</span><span class="p">],</span> <span class="n">config</span><span class="p">)</span>
    <span class="k">if</span> <span class="n">t</span> <span class="o">!=</span> <span class="n">s</span> <span class="o">+</span> <span class="mi">1</span> <span class="ow">and</span> <span class="ow">not</span> <span class="n">success</span><span class="p">:</span>
        <span class="k">return</span> <span class="p">(</span><span class="kc">False</span><span class="p">,</span> <span class="n">np</span><span class="o">.</span><span class="n">identity</span><span class="p">(</span><span class="mi">4</span><span class="p">),</span> <span class="n">np</span><span class="o">.</span><span class="n">identity</span><span class="p">(</span><span class="mi">6</span><span class="p">))</span>
    <span class="k">if</span> <span class="n">config</span><span class="p">[</span><span class="s2">&quot;debug_mode&quot;</span><span class="p">]:</span>
        <span class="nb">print</span><span class="p">(</span><span class="n">transformation</span><span class="p">)</span>
        <span class="nb">print</span><span class="p">(</span><span class="n">information</span><span class="p">)</span>
    <span class="k">return</span> <span class="p">(</span><span class="kc">True</span><span class="p">,</span> <span class="n">transformation</span><span class="p">,</span> <span class="n">information</span><span class="p">)</span>

</pre></div></td></tr></table></div>
</div>
<p>This script uses the technique demonstrated in
<a class="reference internal" href="../pipelines/multiway_registration.html"><span class="std std-ref">Multiway registration</span></a>. The function
<code class="docutils literal notranslate"><span class="pre">update_posegraph_for_scene</span></code> builds a pose graph for multiway registration of
all fragments. Each graph node represents a fragment and its pose which
transforms the geometry to the global space.</p>
<p>Once a pose graph is built, the function <code class="docutils literal notranslate"><span class="pre">optimize_posegraph_for_scene</span></code> is
called for multiway registration.</p>
<div class="highlight-python notranslate"><div class="highlight"><table class="highlighttable"><tr><td class="linenos"><div class="linenodiv"><pre><span class="normal">63</span></pre></div></td><td class="code"><div><pre><span></span>    <span class="n">pose_graph</span> <span class="o">=</span> <span class="n">o3d</span><span class="o">.</span><span class="n">io</span><span class="o">.</span><span class="n">read_pose_graph</span><span class="p">(</span><span class="n">pose_graph_name</span><span class="p">)</span>
</pre></div></td></tr></table></div>
</div>
</div>
<div class="section" id="main-registration-loop">
<h2>Main registration loop<a class="headerlink" href="#main-registration-loop" title="Permalink to this headline">¶</a></h2>
<p>The function <code class="docutils literal notranslate"><span class="pre">make_posegraph_for_scene</span></code> below calls all the functions
introduced above. The main workflow is: pairwise global registration -&gt;
multiway registration.</p>
<div class="highlight-python notranslate"><div class="highlight"><table class="highlighttable"><tr><td class="linenos"><div class="linenodiv"><pre><span class="normal">167</span>
<span class="normal">168</span>
<span class="normal">169</span>
<span class="normal">170</span>
<span class="normal">171</span>
<span class="normal">172</span>
<span class="normal">173</span>
<span class="normal">174</span>
<span class="normal">175</span>
<span class="normal">176</span>
<span class="normal">177</span>
<span class="normal">178</span>
<span class="normal">179</span>
<span class="normal">180</span>
<span class="normal">181</span>
<span class="normal">182</span>
<span class="normal">183</span>
<span class="normal">184</span>
<span class="normal">185</span>
<span class="normal">186</span>
<span class="normal">187</span>
<span class="normal">188</span>
<span class="normal">189</span>
<span class="normal">190</span>
<span class="normal">191</span>
<span class="normal">192</span>
<span class="normal">193</span>
<span class="normal">194</span>
<span class="normal">195</span>
<span class="normal">196</span>
<span class="normal">197</span>
<span class="normal">198</span>
<span class="normal">199</span>
<span class="normal">200</span></pre></div></td><td class="code"><div><pre><span></span>    <span class="n">pcd_down</span><span class="o">.</span><span class="n">estimate_normals</span><span class="p">(</span>
            <span class="n">register_point_cloud_pair</span><span class="p">)(</span><span class="n">ply_file_names</span><span class="p">,</span> <span class="n">matching_results</span><span class="p">[</span><span class="n">r</span><span class="p">]</span><span class="o">.</span><span class="n">s</span><span class="p">,</span>
                                       <span class="n">matching_results</span><span class="p">[</span><span class="n">r</span><span class="p">]</span><span class="o">.</span><span class="n">t</span><span class="p">,</span> <span class="n">config</span><span class="p">)</span>
                                              <span class="k">for</span> <span class="n">r</span> <span class="ow">in</span> <span class="n">matching_results</span><span class="p">)</span>
        <span class="k">for</span> <span class="n">i</span><span class="p">,</span> <span class="n">r</span> <span class="ow">in</span> <span class="nb">enumerate</span><span class="p">(</span><span class="n">matching_results</span><span class="p">):</span>
            <span class="n">matching_results</span><span class="p">[</span><span class="n">r</span><span class="p">]</span><span class="o">.</span><span class="n">success</span> <span class="o">=</span> <span class="n">results</span><span class="p">[</span><span class="n">i</span><span class="p">][</span><span class="mi">0</span><span class="p">]</span>
            <span class="n">matching_results</span><span class="p">[</span><span class="n">r</span><span class="p">]</span><span class="o">.</span><span class="n">transformation</span> <span class="o">=</span> <span class="n">results</span><span class="p">[</span><span class="n">i</span><span class="p">][</span><span class="mi">1</span><span class="p">]</span>
            <span class="n">matching_results</span><span class="p">[</span><span class="n">r</span><span class="p">]</span><span class="o">.</span><span class="n">information</span> <span class="o">=</span> <span class="n">results</span><span class="p">[</span><span class="n">i</span><span class="p">][</span><span class="mi">2</span><span class="p">]</span>
    <span class="k">else</span><span class="p">:</span>
        <span class="k">for</span> <span class="n">r</span> <span class="ow">in</span> <span class="n">matching_results</span><span class="p">:</span>
            <span class="p">(</span><span class="n">matching_results</span><span class="p">[</span><span class="n">r</span><span class="p">]</span><span class="o">.</span><span class="n">success</span><span class="p">,</span> <span class="n">matching_results</span><span class="p">[</span><span class="n">r</span><span class="p">]</span><span class="o">.</span><span class="n">transformation</span><span class="p">,</span>
                    <span class="n">matching_results</span><span class="p">[</span><span class="n">r</span><span class="p">]</span><span class="o">.</span><span class="n">information</span><span class="p">)</span> <span class="o">=</span> \
                    <span class="n">register_point_cloud_pair</span><span class="p">(</span><span class="n">ply_file_names</span><span class="p">,</span>
                    <span class="n">matching_results</span><span class="p">[</span><span class="n">r</span><span class="p">]</span><span class="o">.</span><span class="n">s</span><span class="p">,</span> <span class="n">matching_results</span><span class="p">[</span><span class="n">r</span><span class="p">]</span><span class="o">.</span><span class="n">t</span><span class="p">,</span> <span class="n">config</span><span class="p">)</span>

    <span class="k">for</span> <span class="n">r</span> <span class="ow">in</span> <span class="n">matching_results</span><span class="p">:</span>
        <span class="k">if</span> <span class="n">matching_results</span><span class="p">[</span><span class="n">r</span><span class="p">]</span><span class="o">.</span><span class="n">success</span><span class="p">:</span>
            <span class="p">(</span><span class="n">odometry</span><span class="p">,</span> <span class="n">pose_graph</span><span class="p">)</span> <span class="o">=</span> <span class="n">update_posegraph_for_scene</span><span class="p">(</span>
                <span class="n">matching_results</span><span class="p">[</span><span class="n">r</span><span class="p">]</span><span class="o">.</span><span class="n">s</span><span class="p">,</span> <span class="n">matching_results</span><span class="p">[</span><span class="n">r</span><span class="p">]</span><span class="o">.</span><span class="n">t</span><span class="p">,</span>
                <span class="n">matching_results</span><span class="p">[</span><span class="n">r</span><span class="p">]</span><span class="o">.</span><span class="n">transformation</span><span class="p">,</span>
                <span class="n">matching_results</span><span class="p">[</span><span class="n">r</span><span class="p">]</span><span class="o">.</span><span class="n">information</span><span class="p">,</span> <span class="n">odometry</span><span class="p">,</span> <span class="n">pose_graph</span><span class="p">)</span>
    <span class="n">o3d</span><span class="o">.</span><span class="n">io</span><span class="o">.</span><span class="n">write_pose_graph</span><span class="p">(</span>
        <span class="n">join</span><span class="p">(</span><span class="n">config</span><span class="p">[</span><span class="s2">&quot;path_dataset&quot;</span><span class="p">],</span> <span class="n">config</span><span class="p">[</span><span class="s2">&quot;template_global_posegraph&quot;</span><span class="p">]),</span>
        <span class="n">pose_graph</span><span class="p">)</span>


<span class="k">def</span> <span class="nf">run</span><span class="p">(</span><span class="n">config</span><span class="p">):</span>
    <span class="nb">print</span><span class="p">(</span><span class="s2">&quot;register fragments.&quot;</span><span class="p">)</span>
    <span class="n">o3d</span><span class="o">.</span><span class="n">utility</span><span class="o">.</span><span class="n">set_verbosity_level</span><span class="p">(</span><span class="n">o3d</span><span class="o">.</span><span class="n">utility</span><span class="o">.</span><span class="n">VerbosityLevel</span><span class="o">.</span><span class="n">Debug</span><span class="p">)</span>
    <span class="n">ply_file_names</span> <span class="o">=</span> <span class="n">get_file_list</span><span class="p">(</span>
        <span class="n">join</span><span class="p">(</span><span class="n">config</span><span class="p">[</span><span class="s2">&quot;path_dataset&quot;</span><span class="p">],</span> <span class="n">config</span><span class="p">[</span><span class="s2">&quot;folder_fragment&quot;</span><span class="p">]),</span> <span class="s2">&quot;.ply&quot;</span><span class="p">)</span>
    <span class="n">make_clean_folder</span><span class="p">(</span><span class="n">join</span><span class="p">(</span><span class="n">config</span><span class="p">[</span><span class="s2">&quot;path_dataset&quot;</span><span class="p">],</span> <span class="n">config</span><span class="p">[</span><span class="s2">&quot;folder_scene&quot;</span><span class="p">]))</span>
    <span class="n">make_posegraph_for_scene</span><span class="p">(</span><span class="n">ply_file_names</span><span class="p">,</span> <span class="n">config</span><span class="p">)</span>
    <span class="n">optimize_posegraph_for_scene</span><span class="p">(</span><span class="n">config</span><span class="p">[</span><span class="s2">&quot;path_dataset&quot;</span><span class="p">],</span> <span class="n">config</span><span class="p">)</span>
</pre></div></td></tr></table></div>
</div>
</div>
<div class="section" id="results">
<h2>Results<a class="headerlink" href="#results" title="Permalink to this headline">¶</a></h2>
<p>The pose graph optimization outputs the following messages:</p>
<div class="highlight-sh notranslate"><div class="highlight"><pre><span></span><span class="o">[</span>GlobalOptimizationLM<span class="o">]</span><span class="w"> </span>Optimizing<span class="w"> </span>PoseGraph<span class="w"> </span>having<span class="w"> </span><span class="m">14</span><span class="w"> </span>nodes<span class="w"> </span>and<span class="w"> </span><span class="m">42</span><span class="w"> </span>edges.
Line<span class="w"> </span>process<span class="w"> </span>weight<span class="w"> </span>:<span class="w"> </span><span class="m">55</span>.885667
<span class="o">[</span>Initial<span class="w">     </span><span class="o">]</span><span class="w"> </span>residual<span class="w"> </span>:<span class="w"> </span><span class="m">7</span>.791139e+04,<span class="w"> </span>lambda<span class="w"> </span>:<span class="w"> </span><span class="m">1</span>.205976e+00
<span class="o">[</span>Iteration<span class="w"> </span><span class="m">00</span><span class="o">]</span><span class="w"> </span>residual<span class="w"> </span>:<span class="w"> </span><span class="m">6</span>.094275e+02,<span class="w"> </span>valid<span class="w"> </span>edges<span class="w"> </span>:<span class="w"> </span><span class="m">22</span>,<span class="w"> </span><span class="nb">time</span><span class="w"> </span>:<span class="w"> </span><span class="m">0</span>.001<span class="w"> </span>sec.
<span class="o">[</span>Iteration<span class="w"> </span><span class="m">01</span><span class="o">]</span><span class="w"> </span>residual<span class="w"> </span>:<span class="w"> </span><span class="m">4</span>.526879e+02,<span class="w"> </span>valid<span class="w"> </span>edges<span class="w"> </span>:<span class="w"> </span><span class="m">22</span>,<span class="w"> </span><span class="nb">time</span><span class="w"> </span>:<span class="w"> </span><span class="m">0</span>.000<span class="w"> </span>sec.
<span class="o">[</span>Iteration<span class="w"> </span><span class="m">02</span><span class="o">]</span><span class="w"> </span>residual<span class="w"> </span>:<span class="w"> </span><span class="m">4</span>.515039e+02,<span class="w"> </span>valid<span class="w"> </span>edges<span class="w"> </span>:<span class="w"> </span><span class="m">22</span>,<span class="w"> </span><span class="nb">time</span><span class="w"> </span>:<span class="w"> </span><span class="m">0</span>.000<span class="w"> </span>sec.
<span class="o">[</span>Iteration<span class="w"> </span><span class="m">03</span><span class="o">]</span><span class="w"> </span>residual<span class="w"> </span>:<span class="w"> </span><span class="m">4</span>.514832e+02,<span class="w"> </span>valid<span class="w"> </span>edges<span class="w"> </span>:<span class="w"> </span><span class="m">22</span>,<span class="w"> </span><span class="nb">time</span><span class="w"> </span>:<span class="w"> </span><span class="m">0</span>.000<span class="w"> </span>sec.
<span class="o">[</span>Iteration<span class="w"> </span><span class="m">04</span><span class="o">]</span><span class="w"> </span>residual<span class="w"> </span>:<span class="w"> </span><span class="m">4</span>.514825e+02,<span class="w"> </span>valid<span class="w"> </span>edges<span class="w"> </span>:<span class="w"> </span><span class="m">22</span>,<span class="w"> </span><span class="nb">time</span><span class="w"> </span>:<span class="w"> </span><span class="m">0</span>.000<span class="w"> </span>sec.
Current_residual<span class="w"> </span>-<span class="w"> </span>new_residual<span class="w"> </span>&lt;<span class="w"> </span><span class="m">1</span>.000000e-06<span class="w"> </span>*<span class="w"> </span>current_residual
<span class="o">[</span>GlobalOptimizationLM<span class="o">]</span><span class="w"> </span>total<span class="w"> </span><span class="nb">time</span><span class="w"> </span>:<span class="w"> </span><span class="m">0</span>.003<span class="w"> </span>sec.
<span class="o">[</span>GlobalOptimizationLM<span class="o">]</span><span class="w"> </span>Optimizing<span class="w"> </span>PoseGraph<span class="w"> </span>having<span class="w"> </span><span class="m">14</span><span class="w"> </span>nodes<span class="w"> </span>and<span class="w"> </span><span class="m">35</span><span class="w"> </span>edges.
Line<span class="w"> </span>process<span class="w"> </span>weight<span class="w"> </span>:<span class="w"> </span><span class="m">60</span>.762800
<span class="o">[</span>Initial<span class="w">     </span><span class="o">]</span><span class="w"> </span>residual<span class="w"> </span>:<span class="w"> </span><span class="m">6</span>.336097e+01,<span class="w"> </span>lambda<span class="w"> </span>:<span class="w"> </span><span class="m">1</span>.324043e+00
<span class="o">[</span>Iteration<span class="w"> </span><span class="m">00</span><span class="o">]</span><span class="w"> </span>residual<span class="w"> </span>:<span class="w"> </span><span class="m">6</span>.334147e+01,<span class="w"> </span>valid<span class="w"> </span>edges<span class="w"> </span>:<span class="w"> </span><span class="m">22</span>,<span class="w"> </span><span class="nb">time</span><span class="w"> </span>:<span class="w"> </span><span class="m">0</span>.000<span class="w"> </span>sec.
<span class="o">[</span>Iteration<span class="w"> </span><span class="m">01</span><span class="o">]</span><span class="w"> </span>residual<span class="w"> </span>:<span class="w"> </span><span class="m">6</span>.334138e+01,<span class="w"> </span>valid<span class="w"> </span>edges<span class="w"> </span>:<span class="w"> </span><span class="m">22</span>,<span class="w"> </span><span class="nb">time</span><span class="w"> </span>:<span class="w"> </span><span class="m">0</span>.000<span class="w"> </span>sec.
Current_residual<span class="w"> </span>-<span class="w"> </span>new_residual<span class="w"> </span>&lt;<span class="w"> </span><span class="m">1</span>.000000e-06<span class="w"> </span>*<span class="w"> </span>current_residual
<span class="o">[</span>GlobalOptimizationLM<span class="o">]</span><span class="w"> </span>total<span class="w"> </span><span class="nb">time</span><span class="w"> </span>:<span class="w"> </span><span class="m">0</span>.001<span class="w"> </span>sec.
CompensateReferencePoseGraphNode<span class="w"> </span>:<span class="w"> </span>reference<span class="w"> </span>:<span class="w"> </span><span class="m">0</span>
</pre></div>
</div>
<p>There are 14 fragments and 52 valid matching pairs among the fragments. After
23 iterations, 11 edges are detected to be false positives. After they are
pruned, pose graph optimization runs again to achieve tight alignment.</p>
</div>
</div>


           </div>
           
          </div>
          <footer>
  
    <div class="rst-footer-buttons" role="navigation" aria-label="footer navigation">
      
        <a href="refine_registration.5f" class="btn btn-neutral float-right" title="Refine registration" accesskey="n" rel="next">Next <span class="fa fa-arrow-circle-right"></span></a>
      
      
        <a href="make_fragments.5d.delay" class="btn btn-neutral float-left" title="Make fragments" accesskey="p" rel="prev"><span class="fa fa-arrow-circle-left"></span> Previous</a>
      
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
            <script src="../../../versions.js"></script>
        </ul></dd>
    </dl>
</div>

  <script type="text/javascript">
      jQuery(function () {
          SphinxRtdTheme.Navigation.enable(true);
      });
  </script>

  
  
    
   

</body>

<!-- Mirrored from www.open3d.org/docs/release/tutorial/reconstruction_system/register_fragments.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 14 May 2023 10:47:12 GMT -->
</html>