view: users {
  sql_table_name: demo_db.users ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: age {
    type: number
    sql: ${TABLE}.age ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created_at ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }


  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension: full_name {
    type: string
    sql: concat(${first_name},' ',${last_name}) ;;
  }


  dimension: state {
    type: string

    sql: ${TABLE}.state ;;
  }

  dimension: state_California_or_Newyork {
    type: yesno
    sql: ${TABLE}.state="California" or ${TABLE}.state="New York" ;;

  }

  dimension: zip {
    type: zipcode
    sql: ${TABLE}.zip ;;
  }

measure: average_age {
  type: average
  sql: ${TABLE}.age ;;
}

  dimension: age_tier {
    type: tier
    tiers: [0,10,20,30,40,50,60,70,80]
    style: integer
    sql: ${age} ;;
  }

  dimension: break {

    type: string

    html: <div style="white-space:pre">{{ value }}</div> ;;

    sql: concat(${first_name}, "\r\n" , ${last_name}) ;;

  }


  measure: sold_percent_gauge {

    type: number

    sql: 100.0*${count}/nullif(${count},0) ;;

    value_format: "#.0\%"

    html:   <img src="https://chart.googleapis.com/chart?chs=400x250&cht=gom&chma=10,0,0,0&chxt=y&chco=635189,B1A8C4,1EA8DF,8ED3EF&chf=bg,s,FFFFFF00&chl={{ rendered_value }}&chd=t:{{ value }}">;;

  }



  measure: state_list {
    type: list
    list_field: state
  }


  measure: id_list {
    type: list
    list_field: id
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      first_name,
      last_name,
      events.count,
      orders.count,
      saralooker.count,
      sindhu.count,
      user_data.count
    ]
  }
}
