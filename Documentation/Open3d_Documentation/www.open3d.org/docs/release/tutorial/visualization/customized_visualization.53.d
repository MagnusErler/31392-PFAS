

<!DOCTYPE html>
<!--[if IE 8]><html class="no-js lt-ie9" lang="en" > <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang="en" > <!--<![endif]-->

<!-- Mirrored from www.open3d.org/docs/release/tutorial/visualization/customized_visualization.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 14 May 2023 10:29:45 GMT -->
<head>
  <meta charset="utf-8">
  
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  
  <title>Customized visualization &mdash; Open3D 0.17.0 documentation</title>
  

  
  
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
    <link rel="next" title="Interactive visualization" href="interactive_visualization.54" />
    <link rel="prev" title="Visualization" href="visualization.html" /> 
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
<li class="toctree-l1 current"><a class="reference internal" href="index.html">Visualization</a><ul class="current">
<li class="toctree-l2"><a class="reference internal" href="visualization.html">Visualization</a></li>
<li class="toctree-l2 current"><a class="current reference internal" href="#">Customized visualization</a><ul>
<li class="toctree-l3"><a class="reference internal" href="#mimic-draw-geometries-with-visualizer-class">Mimic draw_geometries() with Visualizer class</a></li>
<li class="toctree-l3"><a class="reference internal" href="#change-field-of-view">Change field of view</a></li>
<li class="toctree-l3"><a class="reference internal" href="#callback-functions">Callback functions</a></li>
<li class="toctree-l3"><a class="reference internal" href="#capture-images-in-a-customized-animation">Capture images in a customized animation</a></li>
<li class="toctree-l3"><a class="reference internal" href="#applying-texture-maps-to-objects">Applying texture maps to objects</a></li>
</ul>
</li>
<li class="toctree-l2"><a class="reference internal" href="interactive_visualization.54">Interactive visualization</a></li>
<li class="toctree-l2"><a class="reference internal" href="non_blocking_visualization.55">Non-blocking visualization</a></li>
<li class="toctree-l2"><a class="reference internal" href="headless_rendering.html">Headless rendering</a></li>
<li class="toctree-l2"><a class="reference internal" href="cpu_rendering.html">CPU (Software) Rendering</a></li>
<li class="toctree-l2"><a class="reference internal" href="web_visualizer.html">Web visualizer and Jupyter</a></li>
<li class="toctree-l2"><a class="reference internal" href="tensorboard_plugin.html">Open3D for TensorBoard</a></li>
</ul>
</li>
<li class="toctree-l1"><a class="reference internal" href="../core/index.html">Core</a></li>
<li class="toctree-l1"><a class="reference internal" href="../data/index.html">Dataset</a></li>
<li class="toctree-l1"><a class="reference internal" href="../reconstruction_system/index.html">Reconstruction system</a></li>
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
        
          <li><a href="index.html">Visualization</a> &raquo;</li>
        
      <li>Customized visualization</li>
    
    
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
<div class="section" id="customized-visualization">
<span id="id1"></span><h1>Customized visualization<a class="headerlink" href="#customized-visualization" title="Permalink to this headline">¶</a></h1>
<p>The usage of Open3D convenient visualization functions <code class="docutils literal notranslate"><span class="pre">draw_geometries</span></code> and <code class="docutils literal notranslate"><span class="pre">draw_geometries_with_custom_animation</span></code> is straightforward. Everything can be done with the GUI. Press <kbd class="kbd docutils literal notranslate">h</kbd> inside the visualizer window to see helper information. For more details, see <a class="reference internal" href="visualization.html"><span class="std std-ref">Visualization</span></a>.</p>
<p>This tutorial focuses on more advanced functionalities to customize the behavior of the visualizer window. Please refer to examples/python/visualization/customized_visualization.py to try the following examples.</p>
<div class="section" id="mimic-draw-geometries-with-visualizer-class">
<h2>Mimic draw_geometries() with Visualizer class<a class="headerlink" href="#mimic-draw-geometries-with-visualizer-class" title="Permalink to this headline">¶</a></h2>
<div class="highlight-python notranslate"><div class="highlight"><table class="highlighttable"><tr><td class="linenos"><div class="linenodiv"><pre><span class="normal">37</span>
<span class="normal">38</span>
<span class="normal">39</span>
<span class="normal">40</span>
<span class="normal">41</span>
<span class="normal">42</span>
<span class="normal">43</span>
<span class="normal">44</span></pre></div></td><td class="code"><div><pre><span></span>

<span class="k">def</span> <span class="nf">custom_draw_geometry_with_rotation</span><span class="p">(</span><span class="n">pcd</span><span class="p">):</span>

    <span class="k">def</span> <span class="nf">rotate_view</span><span class="p">(</span><span class="n">vis</span><span class="p">):</span>
        <span class="n">ctr</span> <span class="o">=</span> <span class="n">vis</span><span class="o">.</span><span class="n">get_view_control</span><span class="p">()</span>
        <span class="n">ctr</span><span class="o">.</span><span class="n">rotate</span><span class="p">(</span><span class="mf">10.0</span><span class="p">,</span> <span class="mf">0.0</span><span class="p">)</span>
        <span class="k">return</span> <span class="kc">False</span>
</pre></div></td></tr></table></div>
</div>
<p>This function produces exactly the same functionality as the convenience function <code class="docutils literal notranslate"><span class="pre">draw_geometries</span></code>.</p>
<a class="reference internal image-reference" href="../../_images/custom.png"><img alt="../../_images/custom.png" src="../../_images/custom.png" style="width: 400px;" /></a>
<p>Class <code class="docutils literal notranslate"><span class="pre">Visualizer</span></code> has a couple of variables such as a <code class="docutils literal notranslate"><span class="pre">ViewControl</span></code> and a <code class="docutils literal notranslate"><span class="pre">RenderOption</span></code>. The following function reads a predefined <code class="docutils literal notranslate"><span class="pre">RenderOption</span></code> stored in a json file.</p>
<div class="highlight-python notranslate"><div class="highlight"><table class="highlighttable"><tr><td class="linenos"><div class="linenodiv"><pre><span class="normal">70</span>
<span class="normal">71</span>
<span class="normal">72</span>
<span class="normal">73</span>
<span class="normal">74</span>
<span class="normal">75</span>
<span class="normal">76</span></pre></div></td><td class="code"><div><pre><span></span>    <span class="k">def</span> <span class="nf">capture_depth</span><span class="p">(</span><span class="n">vis</span><span class="p">):</span>
        <span class="n">depth</span> <span class="o">=</span> <span class="n">vis</span><span class="o">.</span><span class="n">capture_depth_float_buffer</span><span class="p">()</span>
        <span class="n">plt</span><span class="o">.</span><span class="n">imshow</span><span class="p">(</span><span class="n">np</span><span class="o">.</span><span class="n">asarray</span><span class="p">(</span><span class="n">depth</span><span class="p">))</span>
        <span class="n">plt</span><span class="o">.</span><span class="n">show</span><span class="p">()</span>
        <span class="k">return</span> <span class="kc">False</span>

    <span class="k">def</span> <span class="nf">capture_image</span><span class="p">(</span><span class="n">vis</span><span class="p">):</span>
</pre></div></td></tr></table></div>
</div>
<p>Outputs:</p>
<a class="reference internal image-reference" href="../../_images/normal.png"><img alt="../../_images/normal.png" src="../../_images/normal.png" style="width: 400px;" /></a>
</div>
<div class="section" id="change-field-of-view">
<h2>Change field of view<a class="headerlink" href="#change-field-of-view" title="Permalink to this headline">¶</a></h2>
<p>To change field of view of the camera, it is first necessary to get an instance of the visualizer control. To modify the field of view, use <code class="docutils literal notranslate"><span class="pre">change_field_of_view</span></code>.</p>
<div class="highlight-python notranslate"><div class="highlight"><table class="highlighttable"><tr><td class="linenos"><div class="linenodiv"><pre><span class="normal">47</span>
<span class="normal">48</span>
<span class="normal">49</span>
<span class="normal">50</span>
<span class="normal">51</span>
<span class="normal">52</span>
<span class="normal">53</span>
<span class="normal">54</span>
<span class="normal">55</span>
<span class="normal">56</span></pre></div></td><td class="code"><div><pre><span></span>                                                              <span class="n">rotate_view</span><span class="p">)</span>


<span class="k">def</span> <span class="nf">custom_draw_geometry_load_option</span><span class="p">(</span><span class="n">pcd</span><span class="p">,</span> <span class="n">render_option_path</span><span class="p">):</span>
    <span class="n">vis</span> <span class="o">=</span> <span class="n">o3d</span><span class="o">.</span><span class="n">visualization</span><span class="o">.</span><span class="n">Visualizer</span><span class="p">()</span>
    <span class="n">vis</span><span class="o">.</span><span class="n">create_window</span><span class="p">()</span>
    <span class="n">vis</span><span class="o">.</span><span class="n">add_geometry</span><span class="p">(</span><span class="n">pcd</span><span class="p">)</span>
    <span class="n">vis</span><span class="o">.</span><span class="n">get_render_option</span><span class="p">()</span><span class="o">.</span><span class="n">load_from_json</span><span class="p">(</span><span class="n">render_option_path</span><span class="p">)</span>
    <span class="n">vis</span><span class="o">.</span><span class="n">run</span><span class="p">()</span>
    <span class="n">vis</span><span class="o">.</span><span class="n">destroy_window</span><span class="p">()</span>
</pre></div></td></tr></table></div>
</div>
<p>The field of view (FoV) can be set to a degree in the range [5,90]. Note that <code class="docutils literal notranslate"><span class="pre">change_field_of_view</span></code> adds the specified FoV to the current FoV. By default, the visualizer has an FoV of 60 degrees. Calling the following code</p>
<div class="highlight-python notranslate"><div class="highlight"><pre><span></span><span class="n">custom_draw_geometry_with_custom_fov</span><span class="p">(</span><span class="n">pcd</span><span class="p">,</span> <span class="mf">90.0</span><span class="p">)</span>
</pre></div>
</div>
<p>will add the specified 90 degrees to the default 60 degrees. As it exceeds the maximum allowable FoV, the FoV is set to 90 degrees.</p>
<a class="reference internal image-reference" href="../../_images/fov_90.png"><img alt="../../_images/fov_90.png" src="../../_images/fov_90.png" style="width: 400px;" /></a>
<p>The following code</p>
<div class="highlight-python notranslate"><div class="highlight"><pre><span></span><span class="n">custom_draw_geometry_with_custom_fov</span><span class="p">(</span><span class="n">pcd</span><span class="p">,</span> <span class="o">-</span><span class="mf">90.0</span><span class="p">)</span>
</pre></div>
</div>
<p>will set FoV to 5 degrees, because 60 - 90 = -30 is less than 5 degrees.</p>
<a class="reference internal image-reference" href="../../_images/fov_5.png"><img alt="../../_images/fov_5.png" src="../../_images/fov_5.png" style="width: 400px;" /></a>
</div>
<div class="section" id="callback-functions">
<h2>Callback functions<a class="headerlink" href="#callback-functions" title="Permalink to this headline">¶</a></h2>
<div class="highlight-python notranslate"><div class="highlight"><table class="highlighttable"><tr><td class="linenos"><div class="linenodiv"><pre><span class="normal">59</span>
<span class="normal">60</span>
<span class="normal">61</span>
<span class="normal">62</span>
<span class="normal">63</span>
<span class="normal">64</span>
<span class="normal">65</span>
<span class="normal">66</span>
<span class="normal">67</span></pre></div></td><td class="code"><div><pre><span></span><span class="k">def</span> <span class="nf">custom_draw_geometry_with_key_callback</span><span class="p">(</span><span class="n">pcd</span><span class="p">,</span> <span class="n">render_option_path</span><span class="p">):</span>

    <span class="k">def</span> <span class="nf">change_background_to_black</span><span class="p">(</span><span class="n">vis</span><span class="p">):</span>
        <span class="n">opt</span> <span class="o">=</span> <span class="n">vis</span><span class="o">.</span><span class="n">get_render_option</span><span class="p">()</span>
        <span class="n">opt</span><span class="o">.</span><span class="n">background_color</span> <span class="o">=</span> <span class="n">np</span><span class="o">.</span><span class="n">asarray</span><span class="p">([</span><span class="mi">0</span><span class="p">,</span> <span class="mi">0</span><span class="p">,</span> <span class="mi">0</span><span class="p">])</span>
        <span class="k">return</span> <span class="kc">False</span>

    <span class="k">def</span> <span class="nf">load_render_option</span><span class="p">(</span><span class="n">vis</span><span class="p">):</span>
        <span class="n">vis</span><span class="o">.</span><span class="n">get_render_option</span><span class="p">()</span><span class="o">.</span><span class="n">load_from_json</span><span class="p">(</span><span class="n">render_option_path</span><span class="p">)</span>
</pre></div></td></tr></table></div>
</div>
<p>Function <code class="docutils literal notranslate"><span class="pre">draw_geometries_with_animation_callback</span></code> registers a Python callback function <code class="docutils literal notranslate"><span class="pre">rotate_view</span></code> as the idle function of the main loop. It rotates the view along the x-axis whenever the visualizer is idle. This defines an animation behavior.</p>
<a class="reference internal image-reference" href="../../_images/rotate_small.gif"><img alt="../../_images/rotate_small.gif" src="../../_images/rotate_small.gif" style="width: 400px;" /></a>
<div class="highlight-python notranslate"><div class="highlight"><table class="highlighttable"><tr><td class="linenos"><div class="linenodiv"><pre><span class="normal"> 79</span>
<span class="normal"> 80</span>
<span class="normal"> 81</span>
<span class="normal"> 82</span>
<span class="normal"> 83</span>
<span class="normal"> 84</span>
<span class="normal"> 85</span>
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
<span class="normal">108</span></pre></div></td><td class="code"><div><pre><span></span>        <span class="n">plt</span><span class="o">.</span><span class="n">show</span><span class="p">()</span>
        <span class="k">return</span> <span class="kc">False</span>

    <span class="n">key_to_callback</span> <span class="o">=</span> <span class="p">{}</span>
    <span class="n">key_to_callback</span><span class="p">[</span><span class="nb">ord</span><span class="p">(</span><span class="s2">&quot;K&quot;</span><span class="p">)]</span> <span class="o">=</span> <span class="n">change_background_to_black</span>
    <span class="n">key_to_callback</span><span class="p">[</span><span class="nb">ord</span><span class="p">(</span><span class="s2">&quot;R&quot;</span><span class="p">)]</span> <span class="o">=</span> <span class="n">load_render_option</span>
    <span class="n">key_to_callback</span><span class="p">[</span><span class="nb">ord</span><span class="p">(</span><span class="s2">&quot;,&quot;</span><span class="p">)]</span> <span class="o">=</span> <span class="n">capture_depth</span>
    <span class="n">key_to_callback</span><span class="p">[</span><span class="nb">ord</span><span class="p">(</span><span class="s2">&quot;.&quot;</span><span class="p">)]</span> <span class="o">=</span> <span class="n">capture_image</span>
    <span class="n">o3d</span><span class="o">.</span><span class="n">visualization</span><span class="o">.</span><span class="n">draw_geometries_with_key_callbacks</span><span class="p">([</span><span class="n">pcd</span><span class="p">],</span> <span class="n">key_to_callback</span><span class="p">)</span>


<span class="k">def</span> <span class="nf">custom_draw_geometry_with_camera_trajectory</span><span class="p">(</span><span class="n">pcd</span><span class="p">,</span> <span class="n">render_option_path</span><span class="p">,</span>
                                                <span class="n">camera_trajectory_path</span><span class="p">):</span>
    <span class="n">custom_draw_geometry_with_camera_trajectory</span><span class="o">.</span><span class="n">index</span> <span class="o">=</span> <span class="o">-</span><span class="mi">1</span>
    <span class="n">custom_draw_geometry_with_camera_trajectory</span><span class="o">.</span><span class="n">trajectory</span> <span class="o">=</span>\
        <span class="n">o3d</span><span class="o">.</span><span class="n">io</span><span class="o">.</span><span class="n">read_pinhole_camera_trajectory</span><span class="p">(</span><span class="n">camera_trajectory_path</span><span class="p">)</span>
    <span class="n">custom_draw_geometry_with_camera_trajectory</span><span class="o">.</span><span class="n">vis</span> <span class="o">=</span> <span class="n">o3d</span><span class="o">.</span><span class="n">visualization</span><span class="o">.</span><span class="n">Visualizer</span><span class="p">(</span>
    <span class="p">)</span>
    <span class="n">image_path</span> <span class="o">=</span> <span class="n">os</span><span class="o">.</span><span class="n">path</span><span class="o">.</span><span class="n">join</span><span class="p">(</span><span class="n">test_data_path</span><span class="p">,</span> <span class="s1">&#39;image&#39;</span><span class="p">)</span>
    <span class="k">if</span> <span class="ow">not</span> <span class="n">os</span><span class="o">.</span><span class="n">path</span><span class="o">.</span><span class="n">exists</span><span class="p">(</span><span class="n">image_path</span><span class="p">):</span>
        <span class="n">os</span><span class="o">.</span><span class="n">makedirs</span><span class="p">(</span><span class="n">image_path</span><span class="p">)</span>
    <span class="n">depth_path</span> <span class="o">=</span> <span class="n">os</span><span class="o">.</span><span class="n">path</span><span class="o">.</span><span class="n">join</span><span class="p">(</span><span class="n">test_data_path</span><span class="p">,</span> <span class="s1">&#39;depth&#39;</span><span class="p">)</span>
    <span class="k">if</span> <span class="ow">not</span> <span class="n">os</span><span class="o">.</span><span class="n">path</span><span class="o">.</span><span class="n">exists</span><span class="p">(</span><span class="n">depth_path</span><span class="p">):</span>
        <span class="n">os</span><span class="o">.</span><span class="n">makedirs</span><span class="p">(</span><span class="n">depth_path</span><span class="p">)</span>

    <span class="k">def</span> <span class="nf">move_forward</span><span class="p">(</span><span class="n">vis</span><span class="p">):</span>
        <span class="c1"># This function is called within the o3d.visualization.Visualizer::run() loop</span>
        <span class="c1"># The run loop calls the function, then re-render</span>
        <span class="c1"># So the sequence in this function is to:</span>
        <span class="c1"># 1. Capture frame</span>
</pre></div></td></tr></table></div>
</div>
<p>Callback functions can also be registered upon key press event. This script registered four keys. For example, pressing <kbd class="kbd docutils literal notranslate">k</kbd> changes the background color to black.</p>
<a class="reference internal image-reference" href="../../_images/key_k.png"><img alt="../../_images/key_k.png" src="../../_images/key_k.png" style="width: 400px;" /></a>
</div>
<div class="section" id="capture-images-in-a-customized-animation">
<h2>Capture images in a customized animation<a class="headerlink" href="#capture-images-in-a-customized-animation" title="Permalink to this headline">¶</a></h2>
<div class="highlight-python notranslate"><div class="highlight"><table class="highlighttable"><tr><td class="linenos"><div class="linenodiv"><pre><span class="normal">109</span>
<span class="normal">110</span>
<span class="normal">111</span>
<span class="normal">112</span>
<span class="normal">113</span>
<span class="normal">114</span>
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
<span class="normal">137</span>
<span class="normal">138</span>
<span class="normal">139</span>
<span class="normal">140</span>
<span class="normal">141</span>
<span class="normal">142</span>
<span class="normal">143</span>
<span class="normal">144</span>
<span class="normal">145</span>
<span class="normal">146</span>
<span class="normal">147</span>
<span class="normal">148</span>
<span class="normal">149</span>
<span class="normal">150</span>
<span class="normal">151</span>
<span class="normal">152</span>
<span class="normal">153</span>
<span class="normal">154</span>
<span class="normal">155</span>
<span class="normal">156</span>
<span class="normal">157</span>
<span class="normal">158</span>
<span class="normal">159</span>
<span class="normal">160</span></pre></div></td><td class="code"><div><pre><span></span>        <span class="c1"># 4. (Re-render)</span>
        <span class="n">ctr</span> <span class="o">=</span> <span class="n">vis</span><span class="o">.</span><span class="n">get_view_control</span><span class="p">()</span>
        <span class="n">glb</span> <span class="o">=</span> <span class="n">custom_draw_geometry_with_camera_trajectory</span>
        <span class="k">if</span> <span class="n">glb</span><span class="o">.</span><span class="n">index</span> <span class="o">&gt;=</span> <span class="mi">0</span><span class="p">:</span>
            <span class="nb">print</span><span class="p">(</span><span class="s2">&quot;Capture image </span><span class="si">{:05d}</span><span class="s2">&quot;</span><span class="o">.</span><span class="n">format</span><span class="p">(</span><span class="n">glb</span><span class="o">.</span><span class="n">index</span><span class="p">))</span>
            <span class="n">depth</span> <span class="o">=</span> <span class="n">vis</span><span class="o">.</span><span class="n">capture_depth_float_buffer</span><span class="p">(</span><span class="kc">False</span><span class="p">)</span>
            <span class="n">image</span> <span class="o">=</span> <span class="n">vis</span><span class="o">.</span><span class="n">capture_screen_float_buffer</span><span class="p">(</span><span class="kc">False</span><span class="p">)</span>
            <span class="n">plt</span><span class="o">.</span><span class="n">imsave</span><span class="p">(</span><span class="n">os</span><span class="o">.</span><span class="n">path</span><span class="o">.</span><span class="n">join</span><span class="p">(</span><span class="n">depth_path</span><span class="p">,</span> <span class="s1">&#39;</span><span class="si">{:05d}</span><span class="s1">.png&#39;</span><span class="o">.</span><span class="n">format</span><span class="p">(</span><span class="n">glb</span><span class="o">.</span><span class="n">index</span><span class="p">)),</span>
                       <span class="n">np</span><span class="o">.</span><span class="n">asarray</span><span class="p">(</span><span class="n">depth</span><span class="p">),</span>
                       <span class="n">dpi</span><span class="o">=</span><span class="mi">1</span><span class="p">)</span>
            <span class="n">plt</span><span class="o">.</span><span class="n">imsave</span><span class="p">(</span><span class="n">os</span><span class="o">.</span><span class="n">path</span><span class="o">.</span><span class="n">join</span><span class="p">(</span><span class="n">image_path</span><span class="p">,</span> <span class="s1">&#39;</span><span class="si">{:05d}</span><span class="s1">.png&#39;</span><span class="o">.</span><span class="n">format</span><span class="p">(</span><span class="n">glb</span><span class="o">.</span><span class="n">index</span><span class="p">)),</span>
                       <span class="n">np</span><span class="o">.</span><span class="n">asarray</span><span class="p">(</span><span class="n">image</span><span class="p">),</span>
                       <span class="n">dpi</span><span class="o">=</span><span class="mi">1</span><span class="p">)</span>
            <span class="c1"># vis.capture_depth_image(&quot;depth/{:05d}.png&quot;.format(glb.index), False)</span>
            <span class="c1"># vis.capture_screen_image(&quot;image/{:05d}.png&quot;.format(glb.index), False)</span>
        <span class="n">glb</span><span class="o">.</span><span class="n">index</span> <span class="o">=</span> <span class="n">glb</span><span class="o">.</span><span class="n">index</span> <span class="o">+</span> <span class="mi">1</span>
        <span class="k">if</span> <span class="n">glb</span><span class="o">.</span><span class="n">index</span> <span class="o">&lt;</span> <span class="nb">len</span><span class="p">(</span><span class="n">glb</span><span class="o">.</span><span class="n">trajectory</span><span class="o">.</span><span class="n">parameters</span><span class="p">):</span>
            <span class="n">ctr</span><span class="o">.</span><span class="n">convert_from_pinhole_camera_parameters</span><span class="p">(</span>
                <span class="n">glb</span><span class="o">.</span><span class="n">trajectory</span><span class="o">.</span><span class="n">parameters</span><span class="p">[</span><span class="n">glb</span><span class="o">.</span><span class="n">index</span><span class="p">],</span> <span class="n">allow_arbitrary</span><span class="o">=</span><span class="kc">True</span><span class="p">)</span>
        <span class="k">else</span><span class="p">:</span>
            <span class="n">custom_draw_geometry_with_camera_trajectory</span><span class="o">.</span><span class="n">vis</span><span class="o">.</span>\
                <span class="n">register_animation_callback</span><span class="p">(</span><span class="kc">None</span><span class="p">)</span>
        <span class="k">return</span> <span class="kc">False</span>

    <span class="n">vis</span> <span class="o">=</span> <span class="n">custom_draw_geometry_with_camera_trajectory</span><span class="o">.</span><span class="n">vis</span>
    <span class="n">vis</span><span class="o">.</span><span class="n">create_window</span><span class="p">()</span>
    <span class="n">vis</span><span class="o">.</span><span class="n">add_geometry</span><span class="p">(</span><span class="n">pcd</span><span class="p">)</span>
    <span class="n">vis</span><span class="o">.</span><span class="n">get_render_option</span><span class="p">()</span><span class="o">.</span><span class="n">load_from_json</span><span class="p">(</span><span class="n">render_option_path</span><span class="p">)</span>
    <span class="n">vis</span><span class="o">.</span><span class="n">register_animation_callback</span><span class="p">(</span><span class="n">move_forward</span><span class="p">)</span>
    <span class="n">vis</span><span class="o">.</span><span class="n">run</span><span class="p">()</span>
    <span class="n">vis</span><span class="o">.</span><span class="n">destroy_window</span><span class="p">()</span>


<span class="k">if</span> <span class="vm">__name__</span> <span class="o">==</span> <span class="s2">&quot;__main__&quot;</span><span class="p">:</span>
    <span class="n">sample_data</span> <span class="o">=</span> <span class="n">o3d</span><span class="o">.</span><span class="n">data</span><span class="o">.</span><span class="n">DemoCustomVisualization</span><span class="p">()</span>
    <span class="n">pcd_flipped</span> <span class="o">=</span> <span class="n">o3d</span><span class="o">.</span><span class="n">io</span><span class="o">.</span><span class="n">read_point_cloud</span><span class="p">(</span><span class="n">sample_data</span><span class="o">.</span><span class="n">point_cloud_path</span><span class="p">)</span>
    <span class="c1"># Flip it, otherwise the pointcloud will be upside down</span>
    <span class="n">pcd_flipped</span><span class="o">.</span><span class="n">transform</span><span class="p">([[</span><span class="mi">1</span><span class="p">,</span> <span class="mi">0</span><span class="p">,</span> <span class="mi">0</span><span class="p">,</span> <span class="mi">0</span><span class="p">],</span> <span class="p">[</span><span class="mi">0</span><span class="p">,</span> <span class="o">-</span><span class="mi">1</span><span class="p">,</span> <span class="mi">0</span><span class="p">,</span> <span class="mi">0</span><span class="p">],</span> <span class="p">[</span><span class="mi">0</span><span class="p">,</span> <span class="mi">0</span><span class="p">,</span> <span class="o">-</span><span class="mi">1</span><span class="p">,</span> <span class="mi">0</span><span class="p">],</span>
                           <span class="p">[</span><span class="mi">0</span><span class="p">,</span> <span class="mi">0</span><span class="p">,</span> <span class="mi">0</span><span class="p">,</span> <span class="mi">1</span><span class="p">]])</span>

    <span class="nb">print</span><span class="p">(</span><span class="s2">&quot;1. Customized visualization to mimic DrawGeometry&quot;</span><span class="p">)</span>
    <span class="n">custom_draw_geometry</span><span class="p">(</span><span class="n">pcd_flipped</span><span class="p">)</span>

    <span class="nb">print</span><span class="p">(</span><span class="s2">&quot;2. Changing field of view&quot;</span><span class="p">)</span>
    <span class="n">custom_draw_geometry_with_custom_fov</span><span class="p">(</span><span class="n">pcd_flipped</span><span class="p">,</span> <span class="mf">90.0</span><span class="p">)</span>
    <span class="n">custom_draw_geometry_with_custom_fov</span><span class="p">(</span><span class="n">pcd_flipped</span><span class="p">,</span> <span class="o">-</span><span class="mf">90.0</span><span class="p">)</span>

    <span class="nb">print</span><span class="p">(</span><span class="s2">&quot;3. Customized visualization with a rotating view&quot;</span><span class="p">)</span>
    <span class="n">custom_draw_geometry_with_rotation</span><span class="p">(</span><span class="n">pcd_flipped</span><span class="p">)</span>

    <span class="nb">print</span><span class="p">(</span><span class="s2">&quot;4. Customized visualization showing normal rendering&quot;</span><span class="p">)</span>
    <span class="n">custom_draw_geometry_load_option</span><span class="p">(</span><span class="n">pcd_flipped</span><span class="p">,</span>
</pre></div></td></tr></table></div>
</div>
<p>This function reads a camera trajectory, then defines an animation function <code class="docutils literal notranslate"><span class="pre">move_forward</span></code> to travel through the camera trajectory. In this animation function, both color image and depth image are captured using <code class="docutils literal notranslate"><span class="pre">Visualizer.capture_depth_float_buffer</span></code> and <code class="docutils literal notranslate"><span class="pre">Visualizer.capture_screen_float_buffer</span></code> respectively. The images are saved as png files.</p>
<p>The captured image sequence:</p>
<a class="reference internal image-reference" href="../../_images/image_small.gif"><img alt="../../_images/image_small.gif" src="../../_images/image_small.gif" style="width: 400px;" /></a>
<p>The captured depth sequence:</p>
<a class="reference internal image-reference" href="../../_images/depth_small.gif"><img alt="../../_images/depth_small.gif" src="../../_images/depth_small.gif" style="width: 400px;" /></a>
</div>
<div class="section" id="applying-texture-maps-to-objects">
<h2>Applying texture maps to objects<a class="headerlink" href="#applying-texture-maps-to-objects" title="Permalink to this headline">¶</a></h2>
<p>This example function uses the <code class="docutils literal notranslate"><span class="pre">rendering</span></code> class to load an object apply texture maps to it. This example can apply any of the albedo, normal, ao, metallic, and roughness textures present in the object directory.</p>
<p>This function takes the object model directory as the input and loads the object from the directory. It then looks for the available textures in the diretory and applies them to the object.</p>
<p>Before you apply a texture, you must ensure that the texture has the expected properties as supported by the <cite>defaultLit</cite> shader:</p>
<ul class="simple">
<li><p>albedo: This must be a 3 or 4 channel image, where the RGB components are the albedo. If there is a 4th channel, then it is the alpha channel for transparency. The <cite>defaultLit</cite> does not support transparency. You must use <cite>defaultLitTransparency</cite> instead of <cite>defaultLit</cite> to use transparency, that is similar to <cite>defaultLit</cite> except that it used alpha channel for transparency.</p></li>
<li><p>normal: This must be a 3 channel image, where RGB components represent the normal in tangent space at each pixel.</p></li>
<li><p>roughness: This can be 1, 2, 3, or 4 channel image. However, only the 1st channel (Red) is used and indicates the applicable roughness. The value ranges from 0, smooth and highly glossy, to 1, very rough and diffuse.</p></li>
<li><p>metallic: This can be 1, 2,3 , or 4 channel image.  However, only the 1st channel (Red) is used and indicates the applicable metallic finish. The value ranges from 0, non-metallic, to 1, metallic. Note that the values in between are generally not physically realistic.</p></li>
<li><p>ao: This can be 1, 2 ,3, or 4 channel image. However, only the 1st channel (Red) is used and indicates the ambient occlusion. The value ranges from 0, indicating all pixels are fully shadowed and not exposed to indirect lighting, to 1, indicating all pixels are fully lit by the indirect lighting.</p></li>
<li><p>reflectance: This can be 1, 2 ,3, or 4 channel image. However, only the 1st channel (Red) is used and indicates the reflectance or refraction of the image. The value ranges from 0, indicating not reflective, to 1, indicating highly-reflective. Generally, physically accurate materials do not have a value below 0.35.</p></li>
<li><p>anisotropy: This can be 1, 2 ,3, or 4 channel image. However, only the 1st channel (Red) is used and indicates the anistropic reflectance or refraction of the image. This is used to simulate materials with anisotropic reflectance like brushed metal.</p></li>
<li><p>ao_rough_metal: This must be a 3 channel image. If this is set then <cite>roughness</cite>, <cite>metallic</cite>, and <cite>ao</cite> texture maps are ignored. Instead, the the ao_rough_metal is used where the Red channel has the ao map, the Green channel has the roughness map, and the Blue channel has the metallic map.</p></li>
<li><p>anisotropy: This can be 1, 2 ,3, or 4 channel image. However, only the 1st channel (Red) is used to simulate materials with anisotropic reflectance like a brushed metal.</p></li>
</ul>
<p>Below is a sample python code that derives a texture path, checks if a texture is available, and then loads the texture.</p>
<div class="highlight-python notranslate"><div class="highlight"><pre><span></span><span class="kn">import</span> <span class="nn">open3d</span> <span class="k">as</span> <span class="nn">o3d</span>
<span class="kn">import</span> <span class="nn">open3d.visualization.gui</span> <span class="k">as</span> <span class="nn">gui</span>
<span class="kn">import</span> <span class="nn">open3d.visualization.rendering</span> <span class="k">as</span> <span class="nn">rendering</span>
<span class="kn">import</span> <span class="nn">sys</span><span class="o">,</span> <span class="nn">os</span>

<span class="k">def</span> <span class="nf">main</span><span class="p">():</span>
    <span class="k">if</span> <span class="nb">len</span><span class="p">(</span><span class="n">sys</span><span class="o">.</span><span class="n">argv</span><span class="p">)</span> <span class="o">&lt;</span> <span class="mi">2</span><span class="p">:</span>
        <span class="nb">print</span> <span class="p">(</span><span class="s2">&quot;Usage: texture-model.py [model directory]</span><span class="se">\n\t</span><span class="s2"> This example will load [model directory].obj and any of albedo, normal, ao, metallic and roughness textures present.&quot;</span><span class="p">)</span>
        <span class="n">exit</span><span class="p">()</span>

    <span class="c1"># Derive the object path set the model, material, and shader</span>
    <span class="n">model_dir</span> <span class="o">=</span> <span class="n">sys</span><span class="o">.</span><span class="n">argv</span><span class="p">[</span><span class="mi">1</span><span class="p">]</span>
    <span class="n">model_name</span> <span class="o">=</span> <span class="n">os</span><span class="o">.</span><span class="n">path</span><span class="o">.</span><span class="n">join</span><span class="p">(</span><span class="n">model_dir</span><span class="p">,</span> <span class="n">os</span><span class="o">.</span><span class="n">path</span><span class="o">.</span><span class="n">basename</span><span class="p">(</span><span class="n">model_dir</span><span class="p">)</span> <span class="o">+</span> <span class="s2">&quot;.obj&quot;</span><span class="p">)</span>
    <span class="n">model</span> <span class="o">=</span> <span class="n">o3d</span><span class="o">.</span><span class="n">io</span><span class="o">.</span><span class="n">read_triangle_mesh</span><span class="p">(</span><span class="n">model_name</span><span class="p">)</span>
    <span class="n">material</span> <span class="o">=</span> <span class="n">o3d</span><span class="o">.</span><span class="n">visualization</span><span class="o">.</span><span class="n">rendering</span><span class="o">.</span><span class="n">Material</span><span class="p">()</span>
    <span class="n">material</span><span class="o">.</span><span class="n">shader</span> <span class="o">=</span> <span class="s2">&quot;defaultLit&quot;</span>

    <span class="c1"># Derive the texture paths</span>
    <span class="n">albedo_name</span> <span class="o">=</span> <span class="n">os</span><span class="o">.</span><span class="n">path</span><span class="o">.</span><span class="n">join</span><span class="p">(</span><span class="n">model_dir</span><span class="p">,</span> <span class="s2">&quot;albedo.png&quot;</span><span class="p">)</span>
    <span class="n">normal_name</span> <span class="o">=</span> <span class="n">os</span><span class="o">.</span><span class="n">path</span><span class="o">.</span><span class="n">join</span><span class="p">(</span><span class="n">model_dir</span><span class="p">,</span> <span class="s2">&quot;normal.png&quot;</span><span class="p">)</span>
    <span class="n">ao_name</span> <span class="o">=</span> <span class="n">os</span><span class="o">.</span><span class="n">path</span><span class="o">.</span><span class="n">join</span><span class="p">(</span><span class="n">model_dir</span><span class="p">,</span> <span class="s2">&quot;ao.png&quot;</span><span class="p">)</span>
    <span class="n">metallic_name</span> <span class="o">=</span> <span class="n">os</span><span class="o">.</span><span class="n">path</span><span class="o">.</span><span class="n">join</span><span class="p">(</span><span class="n">model_dir</span><span class="p">,</span> <span class="s2">&quot;metallic.png&quot;</span><span class="p">)</span>
    <span class="n">roughness_name</span> <span class="o">=</span> <span class="n">os</span><span class="o">.</span><span class="n">path</span><span class="o">.</span><span class="n">join</span><span class="p">(</span><span class="n">model_dir</span><span class="p">,</span> <span class="s2">&quot;roughness.png&quot;</span><span class="p">)</span>

    <span class="c1"># Check if the textures are available and loads the texture. For example, if metallic exists then load metallic texture</span>
    <span class="k">if</span> <span class="n">os</span><span class="o">.</span><span class="n">path</span><span class="o">.</span><span class="n">exists</span><span class="p">(</span><span class="n">albedo_name</span><span class="p">):</span>
        <span class="n">material</span><span class="o">.</span><span class="n">albedo_img</span> <span class="o">=</span> <span class="n">o3d</span><span class="o">.</span><span class="n">io</span><span class="o">.</span><span class="n">read_image</span><span class="p">(</span><span class="n">albedo_name</span><span class="p">)</span>
    <span class="k">if</span> <span class="n">os</span><span class="o">.</span><span class="n">path</span><span class="o">.</span><span class="n">exists</span><span class="p">(</span><span class="n">normal_name</span><span class="p">):</span>
        <span class="n">material</span><span class="o">.</span><span class="n">normal_img</span> <span class="o">=</span> <span class="n">o3d</span><span class="o">.</span><span class="n">io</span><span class="o">.</span><span class="n">read_image</span><span class="p">(</span><span class="n">normal_name</span><span class="p">)</span>
    <span class="k">if</span> <span class="n">os</span><span class="o">.</span><span class="n">path</span><span class="o">.</span><span class="n">exists</span><span class="p">(</span><span class="n">ao_name</span><span class="p">):</span>
        <span class="n">material</span><span class="o">.</span><span class="n">ao_img</span> <span class="o">=</span> <span class="n">o3d</span><span class="o">.</span><span class="n">io</span><span class="o">.</span><span class="n">read_image</span><span class="p">(</span><span class="n">ao_name</span><span class="p">)</span>
    <span class="k">if</span> <span class="n">os</span><span class="o">.</span><span class="n">path</span><span class="o">.</span><span class="n">exists</span><span class="p">(</span><span class="n">metallic_name</span><span class="p">):</span>
        <span class="n">material</span><span class="o">.</span><span class="n">base_metallic</span> <span class="o">=</span> <span class="mf">1.0</span>
        <span class="n">material</span><span class="o">.</span><span class="n">metallic_img</span> <span class="o">=</span> <span class="n">o3d</span><span class="o">.</span><span class="n">io</span><span class="o">.</span><span class="n">read_image</span><span class="p">(</span><span class="n">metallic_name</span><span class="p">)</span>
    <span class="k">if</span> <span class="n">os</span><span class="o">.</span><span class="n">path</span><span class="o">.</span><span class="n">exists</span><span class="p">(</span><span class="n">roughness_name</span><span class="p">):</span>
        <span class="n">material</span><span class="o">.</span><span class="n">roughness_img</span> <span class="o">=</span> <span class="n">o3d</span><span class="o">.</span><span class="n">io</span><span class="o">.</span><span class="n">read_image</span><span class="p">(</span><span class="n">roughness_name</span><span class="p">)</span>

    <span class="c1"># Draw an object named cube using the available model and texture</span>
    <span class="n">o3d</span><span class="o">.</span><span class="n">visualization</span><span class="o">.</span><span class="n">draw</span><span class="p">([{</span><span class="s2">&quot;name&quot;</span><span class="p">:</span> <span class="s2">&quot;cube&quot;</span><span class="p">,</span> <span class="s2">&quot;geometry&quot;</span><span class="p">:</span> <span class="n">model</span><span class="p">,</span> <span class="s2">&quot;material&quot;</span><span class="p">:</span> <span class="n">material</span><span class="p">}])</span>

<span class="k">if</span> <span class="vm">__name__</span> <span class="o">==</span> <span class="s2">&quot;__main__&quot;</span><span class="p">:</span>
 <span class="n">main</span><span class="p">()</span>
</pre></div>
</div>
</div>
</div>


           </div>
           
          </div>
          <footer>
  
    <div class="rst-footer-buttons" role="navigation" aria-label="footer navigation">
      
        <a href="interactive_visualization.54" class="btn btn-neutral float-right" title="Interactive visualization" accesskey="n" rel="next">Next <span class="fa fa-arrow-circle-right"></span></a>
      
      
        <a href="visualization.html" class="btn btn-neutral float-left" title="Visualization" accesskey="p" rel="prev"><span class="fa fa-arrow-circle-left"></span> Previous</a>
      
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

<!-- Mirrored from www.open3d.org/docs/release/tutorial/visualization/customized_visualization.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 14 May 2023 10:33:25 GMT -->
</html>