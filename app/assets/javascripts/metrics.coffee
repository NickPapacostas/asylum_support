ready = ->

  today = new Date()
  todayStr = today.toISOString().split('T')[0]
  $('#endDate').val(todayStr)

  charts = Object.values(Chartkick.charts).filter((e) -> e.xtype == "datetime").map((chart) -> chart.getChartObject())

  # initializing the charts with the selected dates
  d = new Date($("#startDate").val())
  charts.forEach((c) -> updateXAxisMin(c, d.valueOf()))
  d = new Date($("#endDate").val())
  charts.forEach((c) -> updateXAxisMax(c, d.valueOf()))

  # called when the startdate changes
  $("#startDate").change(
    ->
      d = new Date($("#startDate").val())
      charts.forEach((c) -> updateXAxisMin(c, d.valueOf()))
  )

  # called when the enddate changes
  $("#endDate").change(
    ->
      d = new Date($("#endDate").val())
      charts.forEach((c) -> updateXAxisMax(c, d.valueOf()))
  )

# updates the max x value of the charts
updateXAxisMax = (chart, val) ->
  chart.options.scales.x.max = val
  chart.update()


# updates the min x value of the charts
updateXAxisMin = (chart,val) ->
  chart.options.scales.x.min = val
  chart.update()

# vanilla version of groupBy
groupBy = (xs, f) ->
  return xs.reduce(((rv,x) ->
    (rv[f(x)] = rv[f(x)] || []).push(x)
    return rv)
    , [])




# not used right now, can be used to group other charts than linecharts after time
# might have to use "gon" for this
selectData = (startDate, endDate, data) ->
  sD = new Date(startDate)
  eD = new Date(endDate)
  # Convert to Date, filter for the given time span
  dataDate = JSON.parse(data).map((x) => [x[0], new Date(x[1])]).filter((x) => x[1] >= sD && x[1] <= eD)
  # Group by nationality in first field of the arrays
  grouped = groupBy(dataDate, (x) => x[0])
  groupedLength = []
  # "do" this function on the object
  # groupedLength = grouped.map((x) => [x[0], x[1].length]) changes groupedLength!!
  Object.keys(grouped).forEach((x, i) => groupedLength.push([x, grouped[x].length]))
  return groupedLength

$(document).ready(ready)
$(document).on('page:load', ready)