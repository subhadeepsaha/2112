view: orders {
  sql_table_name: demo_db.orders ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      time_of_day,
      hour,
      hour_of_day,
      hour12,
      hour2,
      minute,
      second,
      millisecond,
      microsecond,
      date,
      week,
      day_of_week,
      day_of_week_index,
      month,
      month_num,
      month_name,
      day_of_month,
      quarter,
      fiscal_quarter,
      quarter_of_year,
      fiscal_quarter_of_year,
      year,
      fiscal_year,
      day_of_year,
      week_of_year,
      yesno,

    ]
    sql: ${TABLE}.created_at ;;
  }




  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      users.id,
      users.first_name,
      users.last_name,
      billion_orders.count,
      fakeorders.count,
      hundred_million_orders.count,
      hundred_million_orders_wide.count,
      order_items.count,
      ten_million_orders.count
    ]
  }
  measure: date_name {
    sql:  (DATE(CONVERT_TZ(`orders`.`created_at`,'UTC','America/Los_Angeles'))) ;;
  }
}
