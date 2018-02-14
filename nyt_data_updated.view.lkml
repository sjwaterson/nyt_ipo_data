view: nyt_data_updated {
  sql_table_name: nyt_ipo.nyt_data ;;

  dimension: list_bhret3 {
    label: "% change 3 years later"
    type: number
    value_format: "#.00\%"
    sql: ${TABLE}.list_BHRET3 ;;
  }

  dimension_group: list_fulldate {
    label: "IPO Date"
    type: time
    timeframes: [
      date,
      day_of_month,
      day_of_week,
      day_of_year,
      month,
      month_name,
      month_num,
      week,
      week_of_year,year
      ]
    sql: ${TABLE}.list_fulldate ;;
  }

  dimension: ipo_date {
    type: date
    sql: ${TABLE}.list_fulldate ;;
  }

  dimension: list_name {
    label: "Company Name"
    type: string
    sql: ${TABLE}.list_NAME ;;
  }

  dimension: list_obs {
    hidden: yes
    label: "Observation ID"
    type: number
    sql: ${TABLE}.list_Obs ;;
  }

  dimension: list_r_mvmp {
    label: "Value day after IPO"
    description: "Millions, in today's dollars"
    type: number
    value_format_name: usd
    sql: ${TABLE}.list_rMVMP ;;
  }

  dimension: list_r_mvop {
    label: "Value at IPO"
    description: "Millions, in today's dollars"
    type: number
    value_format_name: usd
    sql: ${TABLE}.list_rMVOP ;;
  }

  measure: Total_Value_at_IPO {
    label: "Total Value at IPO"
    type: sum
    value_format_name: usd
    sql: ${list_r_mvop} ;;
  }

  measure: Total_Value_day_after_IPO {
    label: "Total Value day after IPO"
    type: sum
    value_format_name: usd
    sql: ${list_r_mvmp} ;;
  }

  measure: Avg_Value_at_IPO {
    label: "Average Value at IPO"
    type: average
    value_format_name: usd
    sql: ${list_r_mvop} ;;
  }

  measure: Avg_Value_day_after_IPO {
    label: "Average Value day after IPO"
    type: average
    value_format_name: usd
    sql: ${list_r_mvmp} ;;
  }


  measure: count {
    type: count
    drill_fields: [list_name]
  }
}