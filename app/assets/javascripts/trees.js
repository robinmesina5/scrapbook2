window.onload = function(){
  console.log('loaded trees.js');

// $.ajax({
//   method: 'get',
//   url: '/data',
//   dataType: 'json',
//   success: function(data){
//     console.log(data);
//   }
// });

var data = [
{ "name": "Mitch", "parent": "Leonidas and Teresa", "relation": "rel", "depth": 1 },
{ "name": "Leonidas and Teresa", "parent": "null", "relation": "null", "depth": 0 },
{ "name": "Lenny", "parent": "Mitch", "relation": "rel", "depth": 2 },
{ "name": "Justin", "parent": "Mitch", "relation": "foo", "depth": 2 },
{ "name": "Ramon", "parent": "Leonidas and Teresa", "relation": "rel", "depth": 1 },
{ "name": "Robin", "parent": "Ramon", "relation": "rel", "depth": 2 },
{ "name": "Bridget", "parent": "Ramon", "relation": "rel", "depth": 2 },
{ "name": "Jesse", "parent": "Ramon", "relation": "rel", "depth": 2 },
{ "name": "Caleb", "parent": "Jesse", "relation": "rel", "depth": 3 },
{ "name": "Ava", "parent": "Jesse", "relation": "rel", "depth": 3 },
{ "name": "Leah", "parent": "Leonidas and Teresa", "relation": "rel", "depth": 1 },
{ "name": "Joey", "parent": "Leonidas and Teresa", "relation": "rel", "depth": 1 },
{ "name": "Mark", "parent": "Leah", "relation": "rel", "depth": 2 },
{ "name": "Kevin", "parent": "Leah", "relation": "rel", "depth": 2 },
{ "name": "Derek", "parent": "Leah", "relation": "rel", "depth": 2 },
{ "name": "James", "parent": "Mark", "relation": "rel", "depth": 3 },
{ "name": "Collin", "parent": "Mark", "relation": "rel", "depth": 3 },
{ "name": "?", "parent": "Robin", "relation": "rel", "depth": 3 },
];

var dataMap = data.reduce(function(map, node) {
 map[node.name] = node;
 return map;
}, {});

// create the tree array
var treeData = [];
data.forEach(function(node) {
  // add to parent
  var parent = dataMap[node.parent];
  if (parent) {
    // create child array if it doesn't exist
    (parent.children || (parent.children = []))
      // add node to child array
      .push(node);
    } else {
    // parent is null or missing
    treeData.push(node);
  }
});

// ************** Generate the tree diagram  *****************
var margin = {top: 20, right: 160, bottom: 20, left: 220},
width = 960 - margin.right - margin.left,
height = 500 - margin.top - margin.bottom;

var i = 0,
duration = 750,
root;

var tree = d3.layout.tree()
.size([height, width]);

var diagonal = d3.svg.diagonal()
.projection(function(d) { return [d.y, d.x]; });

var svg = d3.select("#area2").append("svg")
.attr("width", width + margin.right + margin.left)
.attr("height", height + margin.top + margin.bottom)
.append("g")
.attr("transform", "translate(" + margin.left + "," + margin.top + ")");

root = treeData[0];
root.x0 = height / 2;
root.y0 = 0;

function collapse(d) {
	if (d.children) {
		d._children = d.children;
		d._children.forEach(collapse);
		d.children = null;
	}
}

root.children.forEach(collapse);
update(root);

d3.select(self.frameElement).style("height", "800px");

function update(source) {

  var nodes = tree.nodes(root).reverse(),
  links = tree.links(nodes);

  nodes.forEach(function(d) { d.y = d.depth * 180; });

  var node = svg.selectAll("g.node")
  .data(nodes, function(d) { return d.id || (d.id = ++i); });

  // Enter any new nodes at the parent's previous position.
  var nodeEnter = node.enter().append("g")
  .attr("class", "node")
  .attr("transform", function(d) { return "translate(" + source.y0 + "," + source.x0 + ")"; })
  .on("click", click);

  nodeEnter.append("circle")
  .attr("r", 1e-6)
  .style("fill", function(d) { return d._children ? "lightsteelblue" : "#fff"; });

  nodeEnter.append("text")
  .attr("x", function(d) { return d.children || d._children ? -10 : 10; })
  .attr("dy", ".35em")
  .attr("text-anchor", function(d) { return d.children || d._children ? "end" : "start"; })
  .text(function(d) { return d.name; })
  .style("fill-opacity", 1e-6)
  .style("color", "steelblue");

  // Transition nodes to their new position.
  var nodeUpdate = node.transition()
  .duration(duration)
  .attr("transform", function(d) { return "translate(" + d.y + "," + d.x + ")"; });

  nodeUpdate.select("circle")
  .attr("r", 4.5)
  .style("fill", function(d) { return d._children ? "lightsteelblue" : "#fff"; });

  nodeUpdate.select("text")
  .style("fill-opacity", 1);

  // Transition exiting nodes to the parent's new position.
  var nodeExit = node.exit().transition()
  .duration(duration)
  .attr("transform", function(d) { return "translate(" + source.y + "," + source.x + ")"; })
  .remove();

  nodeExit.select("circle")
  .attr("r", 1e-6);

  nodeExit.select("text")
  .style("fill-opacity", 1e-6);

  // Update the links…
  var link = svg.selectAll("path.link")
  .data(links, function(d) { return d.target.id; });

  // Enter any new links at the parent's previous position.
  link.enter().insert("path", "g")
  .attr("class", "link")
  .attr("d", function(d) {
  	var o = {x: source.x0, y: source.y0};
  	return diagonal({source: o, target: o});
  });

  // Transition links to their new position.
  link.transition()
  .duration(duration)
  .attr("d", diagonal);

  // Transition exiting nodes to the parent's new position.
  link.exit().transition()
  .duration(duration)
  .attr("d", function(d) {
  	var o = {x: source.x, y: source.y};
  	return diagonal({source: o, target: o});
  })
  .remove();

  // Stash the old positions for transition.
  nodes.forEach(function(d) {
  	d.x0 = d.x;
  	d.y0 = d.y;
  });
}

// Toggle children on click.
function click(d) {
	if (d.children) {
		d._children = d.children;
		d.children = null;
	} else {
		d.children = d._children;
		d._children = null;
	}
	update(d);
}
update(treeData)
}
