# This is a very basic remodeling take on the NYT IPO data to clean it up a bit
# and provide the option to use some fields as dimensions or measures
# (vs all dimensions, which is what we do by default)
view: nyt_data_basic {
  sql_table_name: nyt_ipo.nyt_data ;;

  dimension_group: list_fulldate {
    label: "IPO Date"
    type: time
    datatype:  yyyymmdd
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

  dimension: company_name {
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

  dimension: value_at_listing {
    label: "Value at IPO listing"
    description: "In today's dollars"
    type: number
    value_format_name: usd_0
    sql: ${TABLE}.list_rMVOP * 1000000;;
  }

  dimension: value_1day_later {
    label: "Value 1 day after IPO"
    description: "In today's dollars"
    type: number
    value_format_name: usd_0
    sql: ${TABLE}.list_rMVMP * 1000000;;
  }

  dimension: value_3years_later {
    type: number
    value_format_name: usd_0
    label: "Value 3 years after IPO"
    description: "In today's dollars"
    sql: (${value_change_3years_percent}/100 * ${value_at_listing}) + ${value_at_listing} ;;
  }

  dimension: value_change_3years_percent {
    label: "% change 3 years later"
    type: number
    value_format: "#.00\%"
    sql: ${TABLE}.list_BHRET3 ;;
  }

  dimension: value_change_1day_percent {
    label: "% change 1 day later"
    type: number
    value_format: "#.00\%"
    sql: (${value_1day_later} - ${value_at_listing})/${value_at_listing}*100;;
  }

  measure: total_listing_value {
    type: sum
    sql: ${value_at_listing} ;;
    value_format_name: usd_0
    }

  measure: total_value_1day_later {
    type: sum
    sql:  ${value_1day_later};;
    value_format_name: usd_0
  }

  measure: total_value_3years_later {
    type: sum
    sql:  ${value_3years_later};;
    value_format_name: usd_0
    }

  measure: company_count {
    type: count
    drill_fields: [company_name]
  }
}
