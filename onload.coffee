$ ->
    dataset = () ->
                $('input#done, input#need').map(->
                                                  parseInt($(@).val(), 10) || 0).get()

    width = 350
    height = 350
    radius = Math.min(width, height) / 2

    arc = d3.svg.arc()
      .innerRadius(radius - 90)
      .outerRadius(radius - 10)

    pie = d3.layout.pie()
      .sort(null)

    color = d3.scale.ordinal().range(['#00FF00', '#FF0000'])

    svg = d3.select('#target').append('svg')
      .attr(
               width  : width,
               height : height)
      .append('g')
      .attr('transform', "translate(#{width / 2}, #{height / 2})")

    path = svg.selectAll('path')
      .data(pie(dataset()))
      .enter().append('path')
      .attr('fill', (d, i) ->
                      color(i))
      .attr('d', arc)

    change = () ->
               path = path.data pie dataset()
               path.attr('d', arc)

    $('#done, #need').bind('change', change).change()