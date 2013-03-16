$ ->
  dataset =
    apples  : [53245, 28479],
    oranges : [200, 200]

  width = 1109
  height = 910
  radius = 100

  color = d3.scale.category20()

  pie = d3.layout.pie().sort(null)

  arc = d3.svg.arc()
    .innerRadius(radius - 40)
    .outerRadius(radius - 20)

  svg = d3.select("body").append("svg")
    .attr("width", width)
    .attr("height", height)
    .append("g")
    .attr("transform", "translate(" + width / 2 + "," + height / 2 + ")");

  path = svg.selectAll("path")
    .data(pie(dataset.apples))
    .enter().append("path")
    .attr("fill", (d, i) ->
           color(i))
    .attr("d", arc)

  change = () ->
    console.log([parseInt($('#one').val(), 10) || 1, parseInt($('#two').val(), 10) || 1])
    path = path.data(pie([parseInt($('#one').val(), 10) || 1, parseInt($('#two').val(), 10) || 1]))
    path.attr("d", arc)

  $('#one, #two').on("change", change).change()