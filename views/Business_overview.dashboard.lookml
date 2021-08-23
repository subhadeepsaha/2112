- dashboard: first_dashboard
  title: First Dashboard
  layout: newspaper
  preferred_viewer: dashboards-next
  elements:
  - title: Funnel Chart
    name: Funnel Chart
    model: ecommerce_saha
    explore: order_items
    type: looker_funnel
    fields: [products.category, products.count]
    filters:
      products.category: Fashion Hoodies & Sweatshirts,Jeans,Tops & Tees,Swim,Accessories,Clothing
        Sets
    sorts: [products.count desc]
    limit: 500
    dynamic_fields: [{category: table_calculation, expression: "${products.count}*1.32",
        label: New Calculation, value_format: !!null '', value_format_name: decimal_2,
        _kind_hint: measure, table_calculation: new_calculation, _type_hint: number}]
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    smoothedBars: false
    orientation: automatic
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    color_application:
      collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      palette_id: fb7bb53e-b77b-4ab6-8274-9d420d3d73f3
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    hidden_fields: [products.count]
    listen: {}
    row: 16
    col: 0
    width: 14
    height: 11
  - title: Order Explore (Order Count By Status)
    name: Order Explore (Order Count By Status)
    model: ecommerce_saha
    explore: order_items
    type: looker_column
    fields: [orders.created_year, orders.count, orders.status]
    pivots: [orders.status]
    fill_fields: [orders.created_year]
    sorts: [orders.created_year desc, orders.status]
    limit: 500
    dynamic_fields: [{category: table_calculation, expression: 'sum(pivot_row(${orders.count}))',
        label: 'Total Orders Across Status ', value_format: !!null '', value_format_name: id,
        _kind_hint: supermeasure, table_calculation: total_orders_across_status, _type_hint: number}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: true
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    font_size: '15'
    label_value_format: ''
    series_types: {}
    series_colors:
      cancelled - orders.count: "#53ff6d"
      total_orders_across_status: "#a150ff"
    series_labels: {}
    label_color: [orange, Green]
    trend_lines: []
    show_dropoff: false
    defaults_version: 1
    show_null_points: true
    listen: {}
    row: 0
    col: 8
    width: 16
    height: 6
  - title: Order Count by Status (No,Yes) Order View
    name: Order Count by Status (No,Yes) Order View
    model: ecommerce_saha
    explore: order_items
    type: looker_bar
    fields: [orders.created_day_of_week, orders.count, orders.status]
    pivots: [orders.status]
    fill_fields: [orders.created_day_of_week]
    sorts: [orders.created_day_of_week, orders.status]
    limit: 500
    dynamic_fields: [{category: table_calculation, expression: 'if(${orders.created_day_of_week}="Saturday"
          OR ${orders.created_day_of_week}="Sunday",no,yes)', label: New Calculation,
        value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
        table_calculation: new_calculation, _type_hint: yesno}]
    x_axis_gridlines: true
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: circle
    show_value_labels: true
    label_density: 25
    x_axis_scale: ordinal
    y_axis_combined: true
    ordering: asc
    show_null_labels: true
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#db1013"
    show_null_points: true
    interpolation: linear
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: e34425a5-3228-4f76-b45d-2e7cd13a6766
      options:
        steps: 5
    font_size: '14'
    series_types: {}
    series_colors:
      cancelled - orders.count: "#A8A116"
      complete - orders.count: "#F9AB00"
      pending - orders.count: "#E52592"
    series_labels:
      cancelled - orders.count: Cancelled
      complete - orders.count: Complete
      pending - orders.count: Pending
    label_color: [Black]
    reference_lines: []
    defaults_version: 1
    hidden_fields: []
    hidden_points_if_no: [new_calculation]
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: fit_data
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    listen: {}
    row: 6
    col: 0
    width: 14
    height: 10
  - title: User Count
    name: User Count
    model: ecommerce_saha
    explore: order_items
    type: looker_area
    fields: [orders.created_year, users.count, products.count]
    fill_fields: [orders.created_year]
    sorts: [orders.created_year]
    limit: 500
    total: true
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: monotone
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: 5f313589-67ce-44ba-b084-ec5107a7bb7e
      palette_id: be92eae7-de25-46ae-8e4f-21cb0b69a1f3
      options:
        steps: 5
    y_axes: [{label: Count Of User / Product, orientation: left, series: [{axisId: users.count,
            id: users.count, name: Users Count}, {axisId: products.count, id: products.count,
            name: Products Count}], showLabels: true, showValues: true, valueFormat: '[>9999]0,"K"',
        unpinAxis: false, tickDensity: default, tickDensityCustom: 0, type: linear}]
    font_size: ''
    series_types: {}
    series_colors:
      users.count: "#9F4AB4"
      products.count: "#ff5953"
    series_point_styles:
      users.count: square
      products.count: triangle
    label_color: [Red]
    swap_axes: false
    ordering: none
    show_null_labels: false
    defaults_version: 1
    row: 6
    col: 14
    width: 10
    height: 10
  - title: User Count
    name: User Count (2)
    model: ecommerce_saha
    explore: order_items
    type: single_value
    fields: [orders.created_year, users.count]
    fill_fields: [orders.created_year]
    sorts: [orders.created_year desc]
    limit: 500
    total: true
    dynamic_fields: [{category: table_calculation, label: percentage change from previous,
        value_format: !!null '', value_format_name: percent_2, calculation_type: percent_difference_from_previous,
        table_calculation: percentage_change_from_previous, args: [users.count], _kind_hint: measure,
        _type_hint: number}]
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: 5f313589-67ce-44ba-b084-ec5107a7bb7e
      palette_id: be92eae7-de25-46ae-8e4f-21cb0b69a1f3
      options:
        steps: 5
    custom_color: "#8643B1"
    single_value_title: ''
    conditional_formatting: [{type: equal to, value: !!null '', background_color: !!null '',
        font_color: !!null '', color_application: {collection_id: 5f313589-67ce-44ba-b084-ec5107a7bb7e,
          palette_id: dc65924d-47ce-45e6-a469-9977cbc6bd0e}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    y_axes: [{label: Count Of User / Product, orientation: bottom, series: [{axisId: users.count,
            id: users.count, name: Users Count}, {axisId: new_calculation, id: new_calculation,
            name: New Calculation}], showLabels: true, showValues: true, valueFormat: '',
        unpinAxis: false, tickDensity: default, tickDensityCustom: 0, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    font_size: ''
    series_types: {}
    point_style: circle
    series_colors:
      users.count: "#9F4AB4"
      products.count: "#ff5953"
    series_point_styles:
      users.count: square
      products.count: triangle
    show_value_labels: true
    label_density: 25
    label_color: [Red]
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: true
    interpolation: monotone
    swap_axes: false
    defaults_version: 1
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    hidden_fields:
    row: 0
    col: 0
    width: 8
    height: 6
  - title: User Count BY order Year
    name: User Count BY order Year
    model: ecommerce_saha
    explore: order_items
    type: looker_waterfall
    fields: [orders.created_year, users.count]
    fill_fields: [orders.created_year]
    sorts: [orders.created_year desc]
    limit: 500
    total: true
    query_timezone: America/Los_Angeles
    up_color: "#B32F37"
    down_color: "#E57947"
    total_color: "#72D"
    show_value_labels: true
    show_x_axis_ticks: true
    show_x_axis_label: true
    x_axis_scale: ordinal
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_gridlines: true
    color_application:
      collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      palette_id: fb7bb53e-b77b-4ab6-8274-9d420d3d73f3
      options:
        steps: 5
    label_color: [Yellow]
    x_axis_gridlines: false
    show_view_names: false
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    label_density: 25
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    row: 16
    col: 14
    width: 10
    height: 11
  - title: State List Measure
    name: State List Measure
    model: ecommerce_saha
    explore: order_items
    type: looker_grid
    fields: [users.state_list]
    limit: 500
    query_timezone: America/Los_Angeles
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    row: 27
    col: 0
    width: 8
    height: 6
  - title: Order Explore (Order Created Date vs Order Status )
    name: Order Explore (Order Created Date vs Order Status )
    model: ecommerce_saha
    explore: order_items
    type: looker_column
    fields: [orders.created_date, orders.count, orders.status]
    pivots: [orders.status]
    fill_fields: [orders.created_date]
    filters:
      orders.created_date: 1000 days ago for 6 day
    sorts: [orders.created_date desc, orders.status]
    limit: 500
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle
    show_value_labels: true
    label_density: 25
    x_axis_scale: ordinal
    y_axis_combined: true
    ordering: none
    show_null_labels: true
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: Order Count, orientation: left, series: [{axisId: orders.count,
            id: cancelled - orders.count, name: cancelled}, {axisId: orders.count,
            id: complete - orders.count, name: complete}], showLabels: true, showValues: true,
        valueFormat: '', unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_label: Order Created date
    font_size: '18'
    series_types:
      complete - orders.count: area
      cancelled - orders.count: line
    series_colors:
      complete - orders.count: "#F9AB00"
    label_color: [Green, Black]
    defaults_version: 1
    row: 27
    col: 8
    width: 16
    height: 6
  - title: Product view Product Count vs Product Brand (Department)
    name: Product view Product Count vs Product Brand (Department)
    model: ecommerce_saha
    explore: order_items
    type: looker_column
    fields: [products.brand, products.department, products.count]
    pivots: [products.department]
    filters:
      products.brand: Calvin Klein,Nike,adidas,Tommy Hilfiger
    sorts: [products.count desc 0, products.department]
    limit: 500
    row_total: right
    query_timezone: America/Los_Angeles
    x_axis_gridlines: true
    y_axis_gridlines: true
    show_view_names: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: ordinal
    y_axis_combined: true
    ordering: asc
    show_null_labels: true
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#cc5e63"
    y_axes: [{label: '', orientation: left, series: [{axisId: Men - products.count,
            id: Men - products.count, name: Men}, {axisId: Women - products.count,
            id: Women - products.count, name: Women}], showLabels: true, showValues: true,
        maxValue: 600, minValue: 0, unpinAxis: true, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    font_size: '12'
    series_types: {}
    series_colors:
      Men - products.count: "#A8A116"
      Women - products.count: "#9334E6"
    series_point_styles:
      Women - products.count: square
    label_color: []
    reference_lines: []
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: fit_data
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    value_labels: legend
    label_type: labPer
    row: 33
    col: 0
    width: 13
    height: 7
  - title: Y axis Formatting
    name: Y axis Formatting
    model: ecommerce_saha
    explore: order_items
    type: looker_column
    fields: [orders.created_year, orders.count, products.department]
    pivots: [products.department]
    fill_fields: [orders.created_year]
    sorts: [orders.created_year, products.department]
    limit: 500
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: true
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: e34425a5-3228-4f76-b45d-2e7cd13a6766
      options:
        steps: 5
    y_axes: [{label: '', orientation: left, series: [{axisId: orders.count, id: Men
              - orders.count, name: Men}, {axisId: orders.count, id: Women - orders.count,
            name: Women}], showLabels: true, showValues: true, valueFormat: '[>=1000]0,"K";0',
        unpinAxis: false, tickDensity: custom, tickDensityCustom: 75, type: linear}]
    series_types:
      Men - orders.count: line
    series_colors:
      Women - orders.count: "#7CB342"
      Men - orders.count: "#9334E6"
    show_dropoff: false
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: fit_data
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    row: 40
    col: 0
    width: 12
    height: 9
