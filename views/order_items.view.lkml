view: order_items {
  sql_table_name: demo_db.order_items ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: inventory_item_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.inventory_item_id ;;
  }

  dimension: order_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.order_id ;;
  }

  dimension_group: returned {
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
    sql: ${TABLE}.returned_at ;;
  }

  dimension: date_formatted {
    sql: ${returned_date} ;;
    html: {{ rendered_value | date: "%A, %B %e, %Y  " }} ;;
  }

  dimension: sale_price {
    type: number
    sql: ${TABLE}.sale_price ;;
  }


measure: total_sale_price{
  type: sum
  value_format_name: usd
  sql: ${sale_price} ;;
}



  measure: revenue {
    type: sum
    sql: ${sale_price} ;;
  }

  dimension: order_amount_bucket {
    alpha_sort: yes
    case: {
      when: {
        sql: ${sale_price} <= 50;;
        label: "Small"
      }
      when: {
        sql: ${sale_price} > 50 AND ${sale_price} <= 150;;
        label: "Medium"
      }
      when: {
        sql: ${sale_price} > 150;;
        label: "Large"
      }
      else:"Unknown"
    }
  }

  measure: count {
    type: count
    drill_fields: [id, orders.id, inventory_items.id]
  }
  measure: doingaa {
    type: sum
    sql: ${id} + ${inventory_item_id};;
  }
}
