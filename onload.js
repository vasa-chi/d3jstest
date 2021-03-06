// Generated by CoffeeScript 1.6.2
(function() {
  $(function() {
    var $inputs, arc, arcTween, change, color, dataset, height, path, pie, radius, svg, width;

    $inputs = $('#P1_V_02, #P1_V_03');
    dataset = function() {
      return $inputs.map(function() {
        return parseInt($(this).val(), 10) || 0;
      }).get();
    };
    width = 350;
    height = 350;
    radius = Math.min(width, height) / 2;
    arc = d3.svg.arc().innerRadius(radius - 90).outerRadius(radius - 10);
    pie = d3.layout.pie().sort(null);
    color = d3.scale.ordinal().range(['#00FF00', '#FF0000']);
    svg = d3.select('#target').append('svg').attr({
      width: width,
      height: height
    }).append('g').attr('transform', "translate(" + (width / 2) + ", " + (height / 2) + ")").attr('class', 'testclass');
    path = svg.selectAll('path').data(pie(dataset())).enter().append('path').attr('fill', function(d, i) {
      return color(i);
    }).attr('d', arc).each(function(d) {
      return this._current = d;
    });
    arcTween = function(a) {
      var i;

      i = d3.interpolate(this._current, a);
      this._current = i(0);
      return function(t) {
        return arc(i(t));
      };
    };
    change = function() {
      path = path.data(pie(dataset()));
      return path.transition().duration(500).attrTween('d', arcTween);
    };
    return $inputs.bind('change', change).change();
  });

}).call(this);

/*
//@ sourceMappingURL=onload.map
*/
