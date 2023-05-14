

<!DOCTYPE html>
<!--[if IE 8]><html class="no-js lt-ie9" lang="en" > <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang="en" > <!--<![endif]-->

<!-- Mirrored from www.open3d.org/docs/release/python_api/open3d.geometry.HalfEdgeTriangleMesh.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 14 May 2023 10:51:54 GMT -->
<head>
  <meta charset="utf-8">
  
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  
  <title>open3d.geometry.HalfEdgeTriangleMesh &mdash; Open3D 0.17.0 documentation</title>
  

  
  
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
    <link rel="next" title="open3d.geometry.Image" href="open3d.geometry.Image.html" />
    <link rel="prev" title="open3d.geometry.HalfEdge" href="open3d.geometry.HalfEdge.html" /> 
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
<li class="toctree-l1 current"><a class="reference internal" href="open3d.geometry.html">open3d.geometry</a><ul class="current">
<li class="toctree-l2"><a class="reference internal" href="open3d.geometry.AxisAlignedBoundingBox.c6">AxisAlignedBoundingBox</a></li>
<li class="toctree-l2"><a class="reference internal" href="open3d.geometry.DeformAsRigidAsPossibleEn">DeformAsRigidAsPossibleEnergy</a></li>
<li class="toctree-l2"><a class="reference internal" href="open3d.geometry.FilterScope.html">FilterScope</a></li>
<li class="toctree-l2"><a class="reference internal" href="open3d.geometry.Geometry.html">Geometry</a></li>
<li class="toctree-l2"><a class="reference internal" href="open3d.geometry.Geometry2D.html">Geometry2D</a></li>
<li class="toctree-l2"><a class="reference internal" href="open3d.geometry.Geometry3D.html">Geometry3D</a></li>
<li class="toctree-l2"><a class="reference internal" href="open3d.geometry.HalfEdge.html">HalfEdge</a></li>
<li class="toctree-l2 current"><a class="current reference internal" href="#">HalfEdgeTriangleMesh</a></li>
<li class="toctree-l2"><a class="reference internal" href="open3d.geometry.Image.html">Image</a></li>
<li class="toctree-l2"><a class="reference internal" href="open3d.geometry.ImageFilterType.189.delay">ImageFilterType</a></li>
<li class="toctree-l2"><a class="reference internal" href="open3d.geometry.KDTreeFlann.html">KDTreeFlann</a></li>
<li class="toctree-l2"><a class="reference internal" href="open3d.geometry.KDTreeSearchParam.ce.dela">KDTreeSearchParam</a></li>
<li class="toctree-l2"><a class="reference internal" href="open3d.geometry.KDTreeSearchParamHybrid.c">KDTreeSearchParamHybrid</a></li>
<li class="toctree-l2"><a class="reference internal" href="open3d.geometry.KDTreeSearchParamKNN.d0.d">KDTreeSearchParamKNN</a></li>
<li class="toctree-l2"><a class="reference internal" href="open3d.geometry.KDTreeSearchParamRadius.d">KDTreeSearchParamRadius</a></li>
<li class="toctree-l2"><a class="reference internal" href="open3d.geometry.LineSet.html">LineSet</a></li>
<li class="toctree-l2"><a class="reference internal" href="open3d.geometry.MeshBase.html">MeshBase</a></li>
<li class="toctree-l2"><a class="reference internal" href="open3d.geometry.Octree.html">Octree</a></li>
<li class="toctree-l2"><a class="reference internal" href="open3d.geometry.OctreeColorLeafNode.d5.de">OctreeColorLeafNode</a></li>
<li class="toctree-l2"><a class="reference internal" href="open3d.geometry.OctreeInternalNode.d6.del">OctreeInternalNode</a></li>
<li class="toctree-l2"><a class="reference internal" href="open3d.geometry.OctreeInternalPointNode.d">OctreeInternalPointNode</a></li>
<li class="toctree-l2"><a class="reference internal" href="open3d.geometry.OctreeLeafNode.html">OctreeLeafNode</a></li>
<li class="toctree-l2"><a class="reference internal" href="open3d.geometry.OctreeNode.html">OctreeNode</a></li>
<li class="toctree-l2"><a class="reference internal" href="open3d.geometry.OctreeNodeInfo.html">OctreeNodeInfo</a></li>
<li class="toctree-l2"><a class="reference internal" href="open3d.geometry.OctreePointColorLeafNode">OctreePointColorLeafNode</a></li>
<li class="toctree-l2"><a class="reference internal" href="open3d.geometry.OrientedBoundingBox.dc.de">OrientedBoundingBox</a></li>
<li class="toctree-l2"><a class="reference internal" href="open3d.geometry.PointCloud.html">PointCloud</a></li>
<li class="toctree-l2"><a class="reference internal" href="open3d.geometry.RGBDImage.html">RGBDImage</a></li>
<li class="toctree-l2"><a class="reference internal" href="open3d.geometry.SimplificationContraction">SimplificationContraction</a></li>
<li class="toctree-l2"><a class="reference internal" href="open3d.geometry.TetraMesh.html">TetraMesh</a></li>
<li class="toctree-l2"><a class="reference internal" href="open3d.geometry.TriangleMesh.html">TriangleMesh</a></li>
<li class="toctree-l2"><a class="reference internal" href="open3d.geometry.Voxel.html">Voxel</a></li>
<li class="toctree-l2"><a class="reference internal" href="open3d.geometry.VoxelGrid.html">VoxelGrid</a></li>
<li class="toctree-l2"><a class="reference internal" href="open3d.geometry.get_rotation_matrix_from_">get_rotation_matrix_from_axis_angle</a></li>
<li class="toctree-l2"><a class="reference internal" href="open3d.geometry-2.get_rotation_matrix_from_">get_rotation_matrix_from_quaternion</a></li>
<li class="toctree-l2"><a class="reference internal" href="open3d.geometry-3.get_rotation_matrix_from_">get_rotation_matrix_from_xyz</a></li>
<li class="toctree-l2"><a class="reference internal" href="open3d.geometry-4.get_rotation_matrix_from_">get_rotation_matrix_from_xzy</a></li>
<li class="toctree-l2"><a class="reference internal" href="open3d.geometry-5.get_rotation_matrix_from_">get_rotation_matrix_from_yxz</a></li>
<li class="toctree-l2"><a class="reference internal" href="open3d.geometry-6.get_rotation_matrix_from_">get_rotation_matrix_from_yzx</a></li>
<li class="toctree-l2"><a class="reference internal" href="open3d.geometry-7.get_rotation_matrix_from_">get_rotation_matrix_from_zxy</a></li>
<li class="toctree-l2"><a class="reference internal" href="open3d.geometry-8.get_rotation_matrix_from_">get_rotation_matrix_from_zyx</a></li>
</ul>
</li>
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
        
          <li><a href="open3d.geometry.html">open3d.geometry</a> &raquo;</li>
        
      <li>open3d.geometry.HalfEdgeTriangleMesh</li>
    
    
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
<div class="section" id="open3d-geometry-halfedgetrianglemesh">
<h1>open3d.geometry.HalfEdgeTriangleMesh<a class="headerlink" href="#open3d-geometry-halfedgetrianglemesh" title="Permalink to this headline">¶</a></h1>
<dl class="py class">
<dt id="open3d.geometry.HalfEdgeTriangleMesh">
<em class="property">class </em><code class="sig-prename descclassname">open3d.geometry.</code><code class="sig-name descname">HalfEdgeTriangleMesh</code><a class="headerlink" href="#open3d.geometry.HalfEdgeTriangleMesh" title="Permalink to this definition">¶</a></dt>
<dd><p>HalfEdgeTriangleMesh inherits TriangleMesh class with the addition of HalfEdge data structure for each half edge in the mesh as well as related functions.</p>
<dl class="py class">
<dt id="open3d.geometry.HalfEdgeTriangleMesh.Type">
<em class="property">class </em><code class="sig-name descname">Type</code><a class="headerlink" href="#open3d.geometry.HalfEdgeTriangleMesh.Type" title="Permalink to this definition">¶</a></dt>
<dd><p>Enum class for Geometry types.</p>
<dl class="py attribute">
<dt id="open3d.geometry.HalfEdgeTriangleMesh.Type.HalfEdgeTriangleMesh">
<code class="sig-name descname">HalfEdgeTriangleMesh</code><em class="property"> = &lt;Type.HalfEdgeTriangleMesh: 7&gt;</em><a class="headerlink" href="#open3d.geometry.HalfEdgeTriangleMesh.Type.HalfEdgeTriangleMesh" title="Permalink to this definition">¶</a></dt>
<dd></dd></dl>

<dl class="py attribute">
<dt id="open3d.geometry.HalfEdgeTriangleMesh.Type.Image">
<code class="sig-name descname">Image</code><em class="property"> = &lt;Type.Image: 8&gt;</em><a class="headerlink" href="#open3d.geometry.HalfEdgeTriangleMesh.Type.Image" title="Permalink to this definition">¶</a></dt>
<dd></dd></dl>

<dl class="py attribute">
<dt id="open3d.geometry.HalfEdgeTriangleMesh.Type.LineSet">
<code class="sig-name descname">LineSet</code><em class="property"> = &lt;Type.LineSet: 4&gt;</em><a class="headerlink" href="#open3d.geometry.HalfEdgeTriangleMesh.Type.LineSet" title="Permalink to this definition">¶</a></dt>
<dd></dd></dl>

<dl class="py attribute">
<dt id="open3d.geometry.HalfEdgeTriangleMesh.Type.PointCloud">
<code class="sig-name descname">PointCloud</code><em class="property"> = &lt;Type.PointCloud: 1&gt;</em><a class="headerlink" href="#open3d.geometry.HalfEdgeTriangleMesh.Type.PointCloud" title="Permalink to this definition">¶</a></dt>
<dd></dd></dl>

<dl class="py attribute">
<dt id="open3d.geometry.HalfEdgeTriangleMesh.Type.RGBDImage">
<code class="sig-name descname">RGBDImage</code><em class="property"> = &lt;Type.RGBDImage: 9&gt;</em><a class="headerlink" href="#open3d.geometry.HalfEdgeTriangleMesh.Type.RGBDImage" title="Permalink to this definition">¶</a></dt>
<dd></dd></dl>

<dl class="py attribute">
<dt id="open3d.geometry.HalfEdgeTriangleMesh.Type.TetraMesh">
<code class="sig-name descname">TetraMesh</code><em class="property"> = &lt;Type.TetraMesh: 10&gt;</em><a class="headerlink" href="#open3d.geometry.HalfEdgeTriangleMesh.Type.TetraMesh" title="Permalink to this definition">¶</a></dt>
<dd></dd></dl>

<dl class="py attribute">
<dt id="open3d.geometry.HalfEdgeTriangleMesh.Type.TriangleMesh">
<code class="sig-name descname">TriangleMesh</code><em class="property"> = &lt;Type.TriangleMesh: 6&gt;</em><a class="headerlink" href="#open3d.geometry.HalfEdgeTriangleMesh.Type.TriangleMesh" title="Permalink to this definition">¶</a></dt>
<dd></dd></dl>

<dl class="py attribute">
<dt id="open3d.geometry.HalfEdgeTriangleMesh.Type.Unspecified">
<code class="sig-name descname">Unspecified</code><em class="property"> = &lt;Type.Unspecified: 0&gt;</em><a class="headerlink" href="#open3d.geometry.HalfEdgeTriangleMesh.Type.Unspecified" title="Permalink to this definition">¶</a></dt>
<dd></dd></dl>

<dl class="py attribute">
<dt id="open3d.geometry.HalfEdgeTriangleMesh.Type.VoxelGrid">
<code class="sig-name descname">VoxelGrid</code><em class="property"> = &lt;Type.VoxelGrid: 2&gt;</em><a class="headerlink" href="#open3d.geometry.HalfEdgeTriangleMesh.Type.VoxelGrid" title="Permalink to this definition">¶</a></dt>
<dd></dd></dl>

<dl class="py method">
<dt id="open3d.geometry.HalfEdgeTriangleMesh.Type.value">
<em class="property">property </em><code class="sig-name descname">value</code><a class="headerlink" href="#open3d.geometry.HalfEdgeTriangleMesh.Type.value" title="Permalink to this definition">¶</a></dt>
<dd></dd></dl>

</dd></dl>

<dl class="py method">
<dt id="open3d.geometry.HalfEdgeTriangleMesh.__init__">
<code class="sig-name descname">__init__</code><span class="sig-paren">(</span><em class="sig-param"><span class="o">*</span><span class="n">args</span></em>, <em class="sig-param"><span class="o">**</span><span class="n">kwargs</span></em><span class="sig-paren">)</span><a class="headerlink" href="#open3d.geometry.HalfEdgeTriangleMesh.__init__" title="Permalink to this definition">¶</a></dt>
<dd><p>Overloaded function.</p>
<ol class="arabic simple">
<li><p>__init__(self: open3d.cpu.pybind.geometry.HalfEdgeTriangleMesh) -&gt; None</p></li>
</ol>
<p>Default constructor</p>
<ol class="arabic simple" start="2">
<li><p>__init__(self: open3d.cpu.pybind.geometry.HalfEdgeTriangleMesh, arg0: open3d.cpu.pybind.geometry.HalfEdgeTriangleMesh) -&gt; None</p></li>
</ol>
<p>Copy constructor</p>
</dd></dl>

<dl class="py method">
<dt id="open3d.geometry.HalfEdgeTriangleMesh.boundary_half_edges_from_vertex">
<code class="sig-name descname">boundary_half_edges_from_vertex</code><span class="sig-paren">(</span><em class="sig-param"><span class="n">self</span></em>, <em class="sig-param"><span class="n">vertex_index</span></em><span class="sig-paren">)</span><a class="headerlink" href="#open3d.geometry.HalfEdgeTriangleMesh.boundary_half_edges_from_vertex" title="Permalink to this definition">¶</a></dt>
<dd><p>Query manifold boundary half edges from a starting vertex. If query vertex is not on boundary, empty vector will be returned.</p>
<dl class="field-list simple">
<dt class="field-odd">Parameters</dt>
<dd class="field-odd"><p><strong>vertex_index</strong> (<em>int</em>) – </p>
</dd>
<dt class="field-even">Returns</dt>
<dd class="field-even"><p>open3d.utility.IntVector</p>
</dd>
</dl>
</dd></dl>

<dl class="py method">
<dt id="open3d.geometry.HalfEdgeTriangleMesh.boundary_vertices_from_vertex">
<code class="sig-name descname">boundary_vertices_from_vertex</code><span class="sig-paren">(</span><em class="sig-param"><span class="n">self</span></em><span class="sig-paren">)</span><a class="headerlink" href="#open3d.geometry.HalfEdgeTriangleMesh.boundary_vertices_from_vertex" title="Permalink to this definition">¶</a></dt>
<dd><dl class="field-list simple">
<dt class="field-odd">Returns</dt>
<dd class="field-odd"><p>open3d.utility.IntVector</p>
</dd>
</dl>
</dd></dl>

<dl class="py method">
<dt id="open3d.geometry.HalfEdgeTriangleMesh.clear">
<code class="sig-name descname">clear</code><span class="sig-paren">(</span><em class="sig-param"><span class="n">self</span></em><span class="sig-paren">)</span><a class="headerlink" href="#open3d.geometry.HalfEdgeTriangleMesh.clear" title="Permalink to this definition">¶</a></dt>
<dd><p>Clear all elements in the geometry.</p>
<dl class="field-list simple">
<dt class="field-odd">Returns</dt>
<dd class="field-odd"><p>open3d.geometry.Geometry</p>
</dd>
</dl>
</dd></dl>

<dl class="py method">
<dt id="open3d.geometry.HalfEdgeTriangleMesh.compute_convex_hull">
<code class="sig-name descname">compute_convex_hull</code><span class="sig-paren">(</span><em class="sig-param"><span class="n">self</span></em><span class="sig-paren">)</span><a class="headerlink" href="#open3d.geometry.HalfEdgeTriangleMesh.compute_convex_hull" title="Permalink to this definition">¶</a></dt>
<dd><p>Computes the convex hull of the triangle mesh.</p>
<dl class="field-list simple">
<dt class="field-odd">Returns</dt>
<dd class="field-odd"><p>Tuple[open3d.geometry.TriangleMesh, List[int]]</p>
</dd>
</dl>
</dd></dl>

<dl class="py method">
<dt id="open3d.geometry.HalfEdgeTriangleMesh.create_from_triangle_mesh">
<em class="property">static </em><code class="sig-name descname">create_from_triangle_mesh</code><span class="sig-paren">(</span><em class="sig-param"><span class="n">mesh</span></em><span class="sig-paren">)</span><a class="headerlink" href="#open3d.geometry.HalfEdgeTriangleMesh.create_from_triangle_mesh" title="Permalink to this definition">¶</a></dt>
<dd><p>Convert HalfEdgeTriangleMesh from TriangleMesh. Throws exception if the input mesh is not manifolds</p>
<dl class="field-list simple">
<dt class="field-odd">Parameters</dt>
<dd class="field-odd"><p><strong>mesh</strong> (<a class="reference internal" href="open3d.geometry.TriangleMesh.html#open3d.geometry.TriangleMesh" title="open3d.geometry.TriangleMesh"><em>open3d.geometry.TriangleMesh</em></a>) – The input TriangleMesh</p>
</dd>
<dt class="field-even">Returns</dt>
<dd class="field-even"><p>open3d.geometry.HalfEdgeTriangleMesh</p>
</dd>
</dl>
</dd></dl>

<dl class="py method">
<dt id="open3d.geometry.HalfEdgeTriangleMesh.dimension">
<code class="sig-name descname">dimension</code><span class="sig-paren">(</span><em class="sig-param"><span class="n">self</span></em><span class="sig-paren">)</span><a class="headerlink" href="#open3d.geometry.HalfEdgeTriangleMesh.dimension" title="Permalink to this definition">¶</a></dt>
<dd><p>Returns whether the geometry is 2D or 3D.</p>
<dl class="field-list simple">
<dt class="field-odd">Returns</dt>
<dd class="field-odd"><p>int</p>
</dd>
</dl>
</dd></dl>

<dl class="py method">
<dt id="open3d.geometry.HalfEdgeTriangleMesh.get_axis_aligned_bounding_box">
<code class="sig-name descname">get_axis_aligned_bounding_box</code><span class="sig-paren">(</span><em class="sig-param"><span class="n">self</span></em><span class="sig-paren">)</span><a class="headerlink" href="#open3d.geometry.HalfEdgeTriangleMesh.get_axis_aligned_bounding_box" title="Permalink to this definition">¶</a></dt>
<dd><p>Returns an axis-aligned bounding box of the geometry.</p>
<dl class="field-list simple">
<dt class="field-odd">Returns</dt>
<dd class="field-odd"><p>open3d.geometry.AxisAlignedBoundingBox</p>
</dd>
</dl>
</dd></dl>

<dl class="py method">
<dt id="open3d.geometry.HalfEdgeTriangleMesh.get_boundaries">
<code class="sig-name descname">get_boundaries</code><span class="sig-paren">(</span><em class="sig-param"><span class="n">self</span></em><span class="sig-paren">)</span><a class="headerlink" href="#open3d.geometry.HalfEdgeTriangleMesh.get_boundaries" title="Permalink to this definition">¶</a></dt>
<dd><p>Returns a vector of boundaries. A boundary is a vector of vertices.</p>
<dl class="field-list simple">
<dt class="field-odd">Returns</dt>
<dd class="field-odd"><p>List[open3d.utility.IntVector]</p>
</dd>
</dl>
</dd></dl>

<dl class="py method">
<dt id="open3d.geometry.HalfEdgeTriangleMesh.get_center">
<code class="sig-name descname">get_center</code><span class="sig-paren">(</span><em class="sig-param"><span class="n">self</span></em><span class="sig-paren">)</span><a class="headerlink" href="#open3d.geometry.HalfEdgeTriangleMesh.get_center" title="Permalink to this definition">¶</a></dt>
<dd><p>Returns the center of the geometry coordinates.</p>
<dl class="field-list simple">
<dt class="field-odd">Returns</dt>
<dd class="field-odd"><p>numpy.ndarray[numpy.float64[3, 1]]</p>
</dd>
</dl>
</dd></dl>

<dl class="py method">
<dt id="open3d.geometry.HalfEdgeTriangleMesh.get_geometry_type">
<code class="sig-name descname">get_geometry_type</code><span class="sig-paren">(</span><em class="sig-param"><span class="n">self</span></em><span class="sig-paren">)</span><a class="headerlink" href="#open3d.geometry.HalfEdgeTriangleMesh.get_geometry_type" title="Permalink to this definition">¶</a></dt>
<dd><p>Returns one of registered geometry types.</p>
<dl class="field-list simple">
<dt class="field-odd">Returns</dt>
<dd class="field-odd"><p>open3d.geometry.Geometry.GeometryType</p>
</dd>
</dl>
</dd></dl>

<dl class="py method">
<dt id="open3d.geometry.HalfEdgeTriangleMesh.get_max_bound">
<code class="sig-name descname">get_max_bound</code><span class="sig-paren">(</span><em class="sig-param"><span class="n">self</span></em><span class="sig-paren">)</span><a class="headerlink" href="#open3d.geometry.HalfEdgeTriangleMesh.get_max_bound" title="Permalink to this definition">¶</a></dt>
<dd><p>Returns max bounds for geometry coordinates.</p>
<dl class="field-list simple">
<dt class="field-odd">Returns</dt>
<dd class="field-odd"><p>numpy.ndarray[numpy.float64[3, 1]]</p>
</dd>
</dl>
</dd></dl>

<dl class="py method">
<dt id="open3d.geometry.HalfEdgeTriangleMesh.get_min_bound">
<code class="sig-name descname">get_min_bound</code><span class="sig-paren">(</span><em class="sig-param"><span class="n">self</span></em><span class="sig-paren">)</span><a class="headerlink" href="#open3d.geometry.HalfEdgeTriangleMesh.get_min_bound" title="Permalink to this definition">¶</a></dt>
<dd><p>Returns min bounds for geometry coordinates.</p>
<dl class="field-list simple">
<dt class="field-odd">Returns</dt>
<dd class="field-odd"><p>numpy.ndarray[numpy.float64[3, 1]]</p>
</dd>
</dl>
</dd></dl>

<dl class="py method">
<dt id="open3d.geometry.HalfEdgeTriangleMesh.get_minimal_oriented_bounding_box">
<code class="sig-name descname">get_minimal_oriented_bounding_box</code><span class="sig-paren">(</span><em class="sig-param"><span class="n">self</span><span class="p">:</span> <span class="n">open3d.cpu.pybind.geometry.Geometry3D</span></em>, <em class="sig-param"><span class="n">robust</span><span class="p">:</span> <span class="n">bool</span> <span class="o">=</span> <span class="default_value">False</span></em><span class="sig-paren">)</span> &#x2192; open3d::geometry::OrientedBoundingBox<a class="headerlink" href="#open3d.geometry.HalfEdgeTriangleMesh.get_minimal_oriented_bounding_box" title="Permalink to this definition">¶</a></dt>
<dd><p>Returns the minimal oriented bounding box for the geometry.</p>
<p>Creates the oriented bounding box with the smallest volume.
The algorithm makes use of the fact that at least one edge of
the convex hull must be collinear with an edge of the minimum
bounding box: for each triangle in the convex hull, calculate
the minimal axis aligned box in the frame of that triangle.
at the end, return the box with the smallest volume</p>
<dl class="field-list simple">
<dt class="field-odd">Parameters</dt>
<dd class="field-odd"><p><strong>robust</strong> (<em>bool</em>) – If set to true uses a more robust method which works in
degenerate cases but introduces noise to the points coordinates.</p>
</dd>
<dt class="field-even">Returns</dt>
<dd class="field-even"><p>The oriented bounding box. The
bounding box is oriented such that its volume is minimized.</p>
</dd>
<dt class="field-odd">Return type</dt>
<dd class="field-odd"><p><a class="reference internal" href="open3d.geometry.OrientedBoundingBox.dc.de#open3d.geometry.OrientedBoundingBox" title="open3d.geometry.OrientedBoundingBox">open3d.geometry.OrientedBoundingBox</a></p>
</dd>
</dl>
</dd></dl>

<dl class="py method">
<dt id="open3d.geometry.HalfEdgeTriangleMesh.get_oriented_bounding_box">
<code class="sig-name descname">get_oriented_bounding_box</code><span class="sig-paren">(</span><em class="sig-param"><span class="n">self</span><span class="p">:</span> <span class="n">open3d.cpu.pybind.geometry.Geometry3D</span></em>, <em class="sig-param"><span class="n">robust</span><span class="p">:</span> <span class="n">bool</span> <span class="o">=</span> <span class="default_value">False</span></em><span class="sig-paren">)</span> &#x2192; open3d::geometry::OrientedBoundingBox<a class="headerlink" href="#open3d.geometry.HalfEdgeTriangleMesh.get_oriented_bounding_box" title="Permalink to this definition">¶</a></dt>
<dd><p>Returns the oriented bounding box for the geometry.</p>
<p>Computes the oriented bounding box based on the PCA of the convex hull.
The returned bounding box is an approximation to the minimal bounding box.</p>
<dl class="field-list simple">
<dt class="field-odd">Parameters</dt>
<dd class="field-odd"><p><strong>robust</strong> (<em>bool</em>) – If set to true uses a more robust method which works in
degenerate cases but introduces noise to the points coordinates.</p>
</dd>
<dt class="field-even">Returns</dt>
<dd class="field-even"><p>The oriented bounding box. The
bounding box is oriented such that the axes are ordered with respect to
the principal components.</p>
</dd>
<dt class="field-odd">Return type</dt>
<dd class="field-odd"><p><a class="reference internal" href="open3d.geometry.OrientedBoundingBox.dc.de#open3d.geometry.OrientedBoundingBox" title="open3d.geometry.OrientedBoundingBox">open3d.geometry.OrientedBoundingBox</a></p>
</dd>
</dl>
</dd></dl>

<dl class="py method">
<dt id="open3d.geometry.HalfEdgeTriangleMesh.get_rotation_matrix_from_axis_angle">
<em class="property">static </em><code class="sig-name descname">get_rotation_matrix_from_axis_angle</code><span class="sig-paren">(</span><em class="sig-param"><span class="n">rotation</span><span class="p">:</span> <span class="n">numpy.ndarray[numpy.float64[3, 1]]</span></em><span class="sig-paren">)</span> &#x2192; numpy.ndarray[numpy.float64[3, 3]]<a class="headerlink" href="#open3d.geometry.HalfEdgeTriangleMesh.get_rotation_matrix_from_axis_angle" title="Permalink to this definition">¶</a></dt>
<dd></dd></dl>

<dl class="py method">
<dt id="open3d.geometry.HalfEdgeTriangleMesh.get_rotation_matrix_from_quaternion">
<em class="property">static </em><code class="sig-name descname">get_rotation_matrix_from_quaternion</code><span class="sig-paren">(</span><em class="sig-param"><span class="n">rotation</span><span class="p">:</span> <span class="n">numpy.ndarray[numpy.float64[4, 1]]</span></em><span class="sig-paren">)</span> &#x2192; numpy.ndarray[numpy.float64[3, 3]]<a class="headerlink" href="#open3d.geometry.HalfEdgeTriangleMesh.get_rotation_matrix_from_quaternion" title="Permalink to this definition">¶</a></dt>
<dd></dd></dl>

<dl class="py method">
<dt id="open3d.geometry.HalfEdgeTriangleMesh.get_rotation_matrix_from_xyz">
<em class="property">static </em><code class="sig-name descname">get_rotation_matrix_from_xyz</code><span class="sig-paren">(</span><em class="sig-param"><span class="n">rotation</span><span class="p">:</span> <span class="n">numpy.ndarray[numpy.float64[3, 1]]</span></em><span class="sig-paren">)</span> &#x2192; numpy.ndarray[numpy.float64[3, 3]]<a class="headerlink" href="#open3d.geometry.HalfEdgeTriangleMesh.get_rotation_matrix_from_xyz" title="Permalink to this definition">¶</a></dt>
<dd></dd></dl>

<dl class="py method">
<dt id="open3d.geometry.HalfEdgeTriangleMesh.get_rotation_matrix_from_xzy">
<em class="property">static </em><code class="sig-name descname">get_rotation_matrix_from_xzy</code><span class="sig-paren">(</span><em class="sig-param"><span class="n">rotation</span><span class="p">:</span> <span class="n">numpy.ndarray[numpy.float64[3, 1]]</span></em><span class="sig-paren">)</span> &#x2192; numpy.ndarray[numpy.float64[3, 3]]<a class="headerlink" href="#open3d.geometry.HalfEdgeTriangleMesh.get_rotation_matrix_from_xzy" title="Permalink to this definition">¶</a></dt>
<dd></dd></dl>

<dl class="py method">
<dt id="open3d.geometry.HalfEdgeTriangleMesh.get_rotation_matrix_from_yxz">
<em class="property">static </em><code class="sig-name descname">get_rotation_matrix_from_yxz</code><span class="sig-paren">(</span><em class="sig-param"><span class="n">rotation</span><span class="p">:</span> <span class="n">numpy.ndarray[numpy.float64[3, 1]]</span></em><span class="sig-paren">)</span> &#x2192; numpy.ndarray[numpy.float64[3, 3]]<a class="headerlink" href="#open3d.geometry.HalfEdgeTriangleMesh.get_rotation_matrix_from_yxz" title="Permalink to this definition">¶</a></dt>
<dd></dd></dl>

<dl class="py method">
<dt id="open3d.geometry.HalfEdgeTriangleMesh.get_rotation_matrix_from_yzx">
<em class="property">static </em><code class="sig-name descname">get_rotation_matrix_from_yzx</code><span class="sig-paren">(</span><em class="sig-param"><span class="n">rotation</span><span class="p">:</span> <span class="n">numpy.ndarray[numpy.float64[3, 1]]</span></em><span class="sig-paren">)</span> &#x2192; numpy.ndarray[numpy.float64[3, 3]]<a class="headerlink" href="#open3d.geometry.HalfEdgeTriangleMesh.get_rotation_matrix_from_yzx" title="Permalink to this definition">¶</a></dt>
<dd></dd></dl>

<dl class="py method">
<dt id="open3d.geometry.HalfEdgeTriangleMesh.get_rotation_matrix_from_zxy">
<em class="property">static </em><code class="sig-name descname">get_rotation_matrix_from_zxy</code><span class="sig-paren">(</span><em class="sig-param"><span class="n">rotation</span><span class="p">:</span> <span class="n">numpy.ndarray[numpy.float64[3, 1]]</span></em><span class="sig-paren">)</span> &#x2192; numpy.ndarray[numpy.float64[3, 3]]<a class="headerlink" href="#open3d.geometry.HalfEdgeTriangleMesh.get_rotation_matrix_from_zxy" title="Permalink to this definition">¶</a></dt>
<dd></dd></dl>

<dl class="py method">
<dt id="open3d.geometry.HalfEdgeTriangleMesh.get_rotation_matrix_from_zyx">
<em class="property">static </em><code class="sig-name descname">get_rotation_matrix_from_zyx</code><span class="sig-paren">(</span><em class="sig-param"><span class="n">rotation</span><span class="p">:</span> <span class="n">numpy.ndarray[numpy.float64[3, 1]]</span></em><span class="sig-paren">)</span> &#x2192; numpy.ndarray[numpy.float64[3, 3]]<a class="headerlink" href="#open3d.geometry.HalfEdgeTriangleMesh.get_rotation_matrix_from_zyx" title="Permalink to this definition">¶</a></dt>
<dd></dd></dl>

<dl class="py method">
<dt id="open3d.geometry.HalfEdgeTriangleMesh.has_half_edges">
<code class="sig-name descname">has_half_edges</code><span class="sig-paren">(</span><em class="sig-param"><span class="n">self</span></em><span class="sig-paren">)</span><a class="headerlink" href="#open3d.geometry.HalfEdgeTriangleMesh.has_half_edges" title="Permalink to this definition">¶</a></dt>
<dd><p>Returns <code class="docutils literal notranslate"><span class="pre">True</span></code> if half-edges have already been computed.</p>
<dl class="field-list simple">
<dt class="field-odd">Returns</dt>
<dd class="field-odd"><p>bool</p>
</dd>
</dl>
</dd></dl>

<dl class="py method">
<dt id="open3d.geometry.HalfEdgeTriangleMesh.has_vertex_colors">
<code class="sig-name descname">has_vertex_colors</code><span class="sig-paren">(</span><em class="sig-param"><span class="n">self</span></em><span class="sig-paren">)</span><a class="headerlink" href="#open3d.geometry.HalfEdgeTriangleMesh.has_vertex_colors" title="Permalink to this definition">¶</a></dt>
<dd><p>Returns <code class="docutils literal notranslate"><span class="pre">True</span></code> if the mesh contains vertex colors.</p>
<dl class="field-list simple">
<dt class="field-odd">Returns</dt>
<dd class="field-odd"><p>bool</p>
</dd>
</dl>
</dd></dl>

<dl class="py method">
<dt id="open3d.geometry.HalfEdgeTriangleMesh.has_vertex_normals">
<code class="sig-name descname">has_vertex_normals</code><span class="sig-paren">(</span><em class="sig-param"><span class="n">self</span></em><span class="sig-paren">)</span><a class="headerlink" href="#open3d.geometry.HalfEdgeTriangleMesh.has_vertex_normals" title="Permalink to this definition">¶</a></dt>
<dd><p>Returns <code class="docutils literal notranslate"><span class="pre">True</span></code> if the mesh contains vertex normals.</p>
<dl class="field-list simple">
<dt class="field-odd">Returns</dt>
<dd class="field-odd"><p>bool</p>
</dd>
</dl>
</dd></dl>

<dl class="py method">
<dt id="open3d.geometry.HalfEdgeTriangleMesh.has_vertices">
<code class="sig-name descname">has_vertices</code><span class="sig-paren">(</span><em class="sig-param"><span class="n">self</span></em><span class="sig-paren">)</span><a class="headerlink" href="#open3d.geometry.HalfEdgeTriangleMesh.has_vertices" title="Permalink to this definition">¶</a></dt>
<dd><p>Returns <code class="docutils literal notranslate"><span class="pre">True</span></code> if the mesh contains vertices.</p>
<dl class="field-list simple">
<dt class="field-odd">Returns</dt>
<dd class="field-odd"><p>bool</p>
</dd>
</dl>
</dd></dl>

<dl class="py method">
<dt id="open3d.geometry.HalfEdgeTriangleMesh.is_empty">
<code class="sig-name descname">is_empty</code><span class="sig-paren">(</span><em class="sig-param"><span class="n">self</span></em><span class="sig-paren">)</span><a class="headerlink" href="#open3d.geometry.HalfEdgeTriangleMesh.is_empty" title="Permalink to this definition">¶</a></dt>
<dd><p>Returns <code class="docutils literal notranslate"><span class="pre">True</span></code> iff the geometry is empty.</p>
<dl class="field-list simple">
<dt class="field-odd">Returns</dt>
<dd class="field-odd"><p>bool</p>
</dd>
</dl>
</dd></dl>

<dl class="py method">
<dt id="open3d.geometry.HalfEdgeTriangleMesh.normalize_normals">
<code class="sig-name descname">normalize_normals</code><span class="sig-paren">(</span><em class="sig-param"><span class="n">self</span></em><span class="sig-paren">)</span><a class="headerlink" href="#open3d.geometry.HalfEdgeTriangleMesh.normalize_normals" title="Permalink to this definition">¶</a></dt>
<dd><p>Normalize vertex normals to length 1.</p>
<dl class="field-list simple">
<dt class="field-odd">Returns</dt>
<dd class="field-odd"><p>open3d.geometry.MeshBase</p>
</dd>
</dl>
</dd></dl>

<dl class="py method">
<dt id="open3d.geometry.HalfEdgeTriangleMesh.paint_uniform_color">
<code class="sig-name descname">paint_uniform_color</code><span class="sig-paren">(</span><em class="sig-param"><span class="n">self</span></em>, <em class="sig-param"><span class="n">color</span></em><span class="sig-paren">)</span><a class="headerlink" href="#open3d.geometry.HalfEdgeTriangleMesh.paint_uniform_color" title="Permalink to this definition">¶</a></dt>
<dd><p>Assigns each vertex in the MeshBase the same color.</p>
<dl class="field-list simple">
<dt class="field-odd">Parameters</dt>
<dd class="field-odd"><p><strong>color</strong> (<em>numpy.ndarray</em><em>[</em><em>numpy.float64</em><em>[</em><em>3</em><em>, </em><em>1</em><em>]</em><em>]</em>) – RGB colors of vertices.</p>
</dd>
<dt class="field-even">Returns</dt>
<dd class="field-even"><p>open3d.geometry.MeshBase</p>
</dd>
</dl>
</dd></dl>

<dl class="py method">
<dt id="open3d.geometry.HalfEdgeTriangleMesh.rotate">
<code class="sig-name descname">rotate</code><span class="sig-paren">(</span><em class="sig-param"><span class="o">*</span><span class="n">args</span></em>, <em class="sig-param"><span class="o">**</span><span class="n">kwargs</span></em><span class="sig-paren">)</span><a class="headerlink" href="#open3d.geometry.HalfEdgeTriangleMesh.rotate" title="Permalink to this definition">¶</a></dt>
<dd><p>Overloaded function.</p>
<ol class="arabic simple">
<li><dl class="simple">
<dt>rotate(self, R)</dt><dd><p>Apply rotation to the geometry coordinates and normals.</p>
</dd>
</dl>
</li>
</ol>
<dl class="field-list simple">
<dt class="field-odd">Parameters</dt>
<dd class="field-odd"><p><strong>R</strong> (<em>numpy.ndarray</em><em>[</em><em>numpy.float64</em><em>[</em><em>3</em><em>, </em><em>3</em><em>]</em><em>]</em>) – The rotation matrix</p>
</dd>
<dt class="field-even">Returns</dt>
<dd class="field-even"><p>open3d.geometry.Geometry3D</p>
</dd>
</dl>
<ol class="arabic simple" start="2">
<li><dl class="simple">
<dt>rotate(self, R, center)</dt><dd><p>Apply rotation to the geometry coordinates and normals.</p>
</dd>
</dl>
</li>
</ol>
<dl class="field-list simple">
<dt class="field-odd">Parameters</dt>
<dd class="field-odd"><ul class="simple">
<li><p><strong>R</strong> (<em>numpy.ndarray</em><em>[</em><em>numpy.float64</em><em>[</em><em>3</em><em>, </em><em>3</em><em>]</em><em>]</em>) – The rotation matrix</p></li>
<li><p><strong>center</strong> (<em>numpy.ndarray</em><em>[</em><em>numpy.float64</em><em>[</em><em>3</em><em>, </em><em>1</em><em>]</em><em>]</em>) – Rotation center used for transformation.</p></li>
</ul>
</dd>
<dt class="field-even">Returns</dt>
<dd class="field-even"><p>open3d.geometry.Geometry3D</p>
</dd>
</dl>
</dd></dl>

<dl class="py method">
<dt id="open3d.geometry.HalfEdgeTriangleMesh.scale">
<code class="sig-name descname">scale</code><span class="sig-paren">(</span><em class="sig-param"><span class="o">*</span><span class="n">args</span></em>, <em class="sig-param"><span class="o">**</span><span class="n">kwargs</span></em><span class="sig-paren">)</span><a class="headerlink" href="#open3d.geometry.HalfEdgeTriangleMesh.scale" title="Permalink to this definition">¶</a></dt>
<dd><p>Overloaded function.</p>
<ol class="arabic simple">
<li><dl class="simple">
<dt>scale(self, scale, center)</dt><dd><p>Apply scaling to the geometry coordinates.</p>
</dd>
</dl>
</li>
</ol>
<dl class="field-list simple">
<dt class="field-odd">Parameters</dt>
<dd class="field-odd"><ul class="simple">
<li><p><strong>scale</strong> (<em>float</em>) – The scale parameter that is multiplied to the points/vertices of the geometry.</p></li>
<li><p><strong>center</strong> (<em>numpy.ndarray</em><em>[</em><em>numpy.float64</em><em>[</em><em>3</em><em>, </em><em>1</em><em>]</em><em>]</em>) – Scale center used for transformation.</p></li>
</ul>
</dd>
<dt class="field-even">Returns</dt>
<dd class="field-even"><p>open3d.geometry.Geometry3D</p>
</dd>
</dl>
<ol class="arabic simple" start="2">
<li><dl class="simple">
<dt>scale(self, scale, center)</dt><dd><p>Apply scaling to the geometry coordinates.</p>
</dd>
</dl>
</li>
</ol>
<dl class="field-list simple">
<dt class="field-odd">Parameters</dt>
<dd class="field-odd"><ul class="simple">
<li><p><strong>scale</strong> (<em>float</em>) – The scale parameter that is multiplied to the points/vertices of the geometry.</p></li>
<li><p><strong>center</strong> (<em>numpy.ndarray</em><em>[</em><em>numpy.float64</em><em>[</em><em>3</em><em>, </em><em>1</em><em>]</em><em>]</em>) – Scale center used for transformation.</p></li>
</ul>
</dd>
<dt class="field-even">Returns</dt>
<dd class="field-even"><p>open3d.geometry.Geometry3D</p>
</dd>
</dl>
</dd></dl>

<dl class="py method">
<dt id="open3d.geometry.HalfEdgeTriangleMesh.transform">
<code class="sig-name descname">transform</code><span class="sig-paren">(</span><em class="sig-param"><span class="n">self</span></em>, <em class="sig-param"><span class="n">arg0</span></em><span class="sig-paren">)</span><a class="headerlink" href="#open3d.geometry.HalfEdgeTriangleMesh.transform" title="Permalink to this definition">¶</a></dt>
<dd><p>Apply transformation (4x4 matrix) to the geometry coordinates.</p>
<dl class="field-list simple">
<dt class="field-odd">Parameters</dt>
<dd class="field-odd"><p><strong>arg0</strong> (<em>numpy.ndarray</em><em>[</em><em>numpy.float64</em><em>[</em><em>4</em><em>, </em><em>4</em><em>]</em><em>]</em>) – </p>
</dd>
<dt class="field-even">Returns</dt>
<dd class="field-even"><p>open3d.geometry.Geometry3D</p>
</dd>
</dl>
</dd></dl>

<dl class="py method">
<dt id="open3d.geometry.HalfEdgeTriangleMesh.translate">
<code class="sig-name descname">translate</code><span class="sig-paren">(</span><em class="sig-param"><span class="n">self</span></em>, <em class="sig-param"><span class="n">translation</span></em>, <em class="sig-param"><span class="n">relative</span><span class="o">=</span><span class="default_value">True</span></em><span class="sig-paren">)</span><a class="headerlink" href="#open3d.geometry.HalfEdgeTriangleMesh.translate" title="Permalink to this definition">¶</a></dt>
<dd><p>Apply translation to the geometry coordinates.</p>
<dl class="field-list simple">
<dt class="field-odd">Parameters</dt>
<dd class="field-odd"><ul class="simple">
<li><p><strong>translation</strong> (<em>numpy.ndarray</em><em>[</em><em>numpy.float64</em><em>[</em><em>3</em><em>, </em><em>1</em><em>]</em><em>]</em>) – A 3D vector to transform the geometry</p></li>
<li><p><strong>relative</strong> (<em>bool</em><em>, </em><em>optional</em><em>, </em><em>default=True</em>) – If true, the translation vector is directly added to the geometry coordinates. Otherwise, the center is moved to the translation vector.</p></li>
</ul>
</dd>
<dt class="field-even">Returns</dt>
<dd class="field-even"><p>open3d.geometry.Geometry3D</p>
</dd>
</dl>
</dd></dl>

<dl class="py attribute">
<dt id="open3d.geometry.HalfEdgeTriangleMesh.HalfEdgeTriangleMesh">
<code class="sig-name descname">HalfEdgeTriangleMesh</code><em class="property"> = &lt;Type.HalfEdgeTriangleMesh: 7&gt;</em><a class="headerlink" href="#open3d.geometry.HalfEdgeTriangleMesh.HalfEdgeTriangleMesh" title="Permalink to this definition">¶</a></dt>
<dd></dd></dl>

<dl class="py attribute">
<dt id="open3d.geometry.HalfEdgeTriangleMesh.Image">
<code class="sig-name descname">Image</code><em class="property"> = &lt;Type.Image: 8&gt;</em><a class="headerlink" href="#open3d.geometry.HalfEdgeTriangleMesh.Image" title="Permalink to this definition">¶</a></dt>
<dd></dd></dl>

<dl class="py attribute">
<dt id="open3d.geometry.HalfEdgeTriangleMesh.LineSet">
<code class="sig-name descname">LineSet</code><em class="property"> = &lt;Type.LineSet: 4&gt;</em><a class="headerlink" href="#open3d.geometry.HalfEdgeTriangleMesh.LineSet" title="Permalink to this definition">¶</a></dt>
<dd></dd></dl>

<dl class="py attribute">
<dt id="open3d.geometry.HalfEdgeTriangleMesh.PointCloud">
<code class="sig-name descname">PointCloud</code><em class="property"> = &lt;Type.PointCloud: 1&gt;</em><a class="headerlink" href="#open3d.geometry.HalfEdgeTriangleMesh.PointCloud" title="Permalink to this definition">¶</a></dt>
<dd></dd></dl>

<dl class="py attribute">
<dt id="open3d.geometry.HalfEdgeTriangleMesh.RGBDImage">
<code class="sig-name descname">RGBDImage</code><em class="property"> = &lt;Type.RGBDImage: 9&gt;</em><a class="headerlink" href="#open3d.geometry.HalfEdgeTriangleMesh.RGBDImage" title="Permalink to this definition">¶</a></dt>
<dd></dd></dl>

<dl class="py attribute">
<dt id="open3d.geometry.HalfEdgeTriangleMesh.TetraMesh">
<code class="sig-name descname">TetraMesh</code><em class="property"> = &lt;Type.TetraMesh: 10&gt;</em><a class="headerlink" href="#open3d.geometry.HalfEdgeTriangleMesh.TetraMesh" title="Permalink to this definition">¶</a></dt>
<dd></dd></dl>

<dl class="py attribute">
<dt id="open3d.geometry.HalfEdgeTriangleMesh.TriangleMesh">
<code class="sig-name descname">TriangleMesh</code><em class="property"> = &lt;Type.TriangleMesh: 6&gt;</em><a class="headerlink" href="#open3d.geometry.HalfEdgeTriangleMesh.TriangleMesh" title="Permalink to this definition">¶</a></dt>
<dd></dd></dl>

<dl class="py attribute">
<dt id="open3d.geometry.HalfEdgeTriangleMesh.Unspecified">
<code class="sig-name descname">Unspecified</code><em class="property"> = &lt;Type.Unspecified: 0&gt;</em><a class="headerlink" href="#open3d.geometry.HalfEdgeTriangleMesh.Unspecified" title="Permalink to this definition">¶</a></dt>
<dd></dd></dl>

<dl class="py attribute">
<dt id="open3d.geometry.HalfEdgeTriangleMesh.VoxelGrid">
<code class="sig-name descname">VoxelGrid</code><em class="property"> = &lt;Type.VoxelGrid: 2&gt;</em><a class="headerlink" href="#open3d.geometry.HalfEdgeTriangleMesh.VoxelGrid" title="Permalink to this definition">¶</a></dt>
<dd></dd></dl>

<dl class="py method">
<dt id="open3d.geometry.HalfEdgeTriangleMesh.half_edges">
<em class="property">property </em><code class="sig-name descname">half_edges</code><a class="headerlink" href="#open3d.geometry.HalfEdgeTriangleMesh.half_edges" title="Permalink to this definition">¶</a></dt>
<dd><p>List of HalfEdge in the mesh</p>
</dd></dl>

<dl class="py method">
<dt id="open3d.geometry.HalfEdgeTriangleMesh.ordered_half_edge_from_vertex">
<em class="property">property </em><code class="sig-name descname">ordered_half_edge_from_vertex</code><a class="headerlink" href="#open3d.geometry.HalfEdgeTriangleMesh.ordered_half_edge_from_vertex" title="Permalink to this definition">¶</a></dt>
<dd><p>Counter-clockwise ordered half-edges started from each vertex</p>
</dd></dl>

<dl class="py method">
<dt id="open3d.geometry.HalfEdgeTriangleMesh.triangle_normals">
<em class="property">property </em><code class="sig-name descname">triangle_normals</code><a class="headerlink" href="#open3d.geometry.HalfEdgeTriangleMesh.triangle_normals" title="Permalink to this definition">¶</a></dt>
<dd><p>Triangle normals.</p>
<dl class="field-list simple">
<dt class="field-odd">Type</dt>
<dd class="field-odd"><p><code class="docutils literal notranslate"><span class="pre">float64</span></code> array of shape <code class="docutils literal notranslate"><span class="pre">(num_triangles,</span> <span class="pre">3)</span></code>, use <code class="docutils literal notranslate"><span class="pre">numpy.asarray()</span></code> to access data</p>
</dd>
</dl>
</dd></dl>

<dl class="py method">
<dt id="open3d.geometry.HalfEdgeTriangleMesh.triangles">
<em class="property">property </em><code class="sig-name descname">triangles</code><a class="headerlink" href="#open3d.geometry.HalfEdgeTriangleMesh.triangles" title="Permalink to this definition">¶</a></dt>
<dd><p>List of triangles denoted by the index of points forming the triangle.</p>
<dl class="field-list simple">
<dt class="field-odd">Type</dt>
<dd class="field-odd"><p><code class="docutils literal notranslate"><span class="pre">int</span></code> array of shape <code class="docutils literal notranslate"><span class="pre">(num_triangles,</span> <span class="pre">3)</span></code>, use <code class="docutils literal notranslate"><span class="pre">numpy.asarray()</span></code> to access data</p>
</dd>
</dl>
</dd></dl>

<dl class="py method">
<dt id="open3d.geometry.HalfEdgeTriangleMesh.vertex_colors">
<em class="property">property </em><code class="sig-name descname">vertex_colors</code><a class="headerlink" href="#open3d.geometry.HalfEdgeTriangleMesh.vertex_colors" title="Permalink to this definition">¶</a></dt>
<dd><p>RGB colors of vertices.</p>
<dl class="field-list simple">
<dt class="field-odd">Type</dt>
<dd class="field-odd"><p><code class="docutils literal notranslate"><span class="pre">float64</span></code> array of shape <code class="docutils literal notranslate"><span class="pre">(num_vertices,</span> <span class="pre">3)</span></code>, range <code class="docutils literal notranslate"><span class="pre">[0,</span> <span class="pre">1]</span></code> , use <code class="docutils literal notranslate"><span class="pre">numpy.asarray()</span></code> to access data</p>
</dd>
</dl>
</dd></dl>

<dl class="py method">
<dt id="open3d.geometry.HalfEdgeTriangleMesh.vertex_normals">
<em class="property">property </em><code class="sig-name descname">vertex_normals</code><a class="headerlink" href="#open3d.geometry.HalfEdgeTriangleMesh.vertex_normals" title="Permalink to this definition">¶</a></dt>
<dd><p>Vertex normals.</p>
<dl class="field-list simple">
<dt class="field-odd">Type</dt>
<dd class="field-odd"><p><code class="docutils literal notranslate"><span class="pre">float64</span></code> array of shape <code class="docutils literal notranslate"><span class="pre">(num_vertices,</span> <span class="pre">3)</span></code>, use <code class="docutils literal notranslate"><span class="pre">numpy.asarray()</span></code> to access data</p>
</dd>
</dl>
</dd></dl>

<dl class="py method">
<dt id="open3d.geometry.HalfEdgeTriangleMesh.vertices">
<em class="property">property </em><code class="sig-name descname">vertices</code><a class="headerlink" href="#open3d.geometry.HalfEdgeTriangleMesh.vertices" title="Permalink to this definition">¶</a></dt>
<dd><p>Vertex coordinates.</p>
<dl class="field-list simple">
<dt class="field-odd">Type</dt>
<dd class="field-odd"><p><code class="docutils literal notranslate"><span class="pre">float64</span></code> array of shape <code class="docutils literal notranslate"><span class="pre">(num_vertices,</span> <span class="pre">3)</span></code>, use <code class="docutils literal notranslate"><span class="pre">numpy.asarray()</span></code> to access data</p>
</dd>
</dl>
</dd></dl>

</dd></dl>

</div>


           </div>
           
          </div>
          <footer>
  
    <div class="rst-footer-buttons" role="navigation" aria-label="footer navigation">
      
        <a href="open3d.geometry.Image.html" class="btn btn-neutral float-right" title="open3d.geometry.Image" accesskey="n" rel="next">Next <span class="fa fa-arrow-circle-right"></span></a>
      
      
        <a href="open3d.geometry.HalfEdge.html" class="btn btn-neutral float-left" title="open3d.geometry.HalfEdge" accesskey="p" rel="prev"><span class="fa fa-arrow-circle-left"></span> Previous</a>
      
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

<!-- Mirrored from www.open3d.org/docs/release/python_api/open3d.geometry.HalfEdgeTriangleMesh.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 14 May 2023 10:51:54 GMT -->
</html>