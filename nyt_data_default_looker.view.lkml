# This VIEW is what Looker does by default with this data table.
view: nyt_data_default_looker {
  sql_table_name: nyt_ipo.nyt_data ;;

  dimension: list_bhret3 {
    type: number
    sql: ${TABLE}.list_BHRET3 ;;
  }

  dimension: list_fulldate {
    type: number
    sql: ${TABLE}.list_fulldate ;;
  }

  dimension: list_name {
    type: string
    sql: ${TABLE}.list_NAME ;;
  }

  dimension: list_obs {
    type: number
    sql: ${TABLE}.list_Obs ;;
  }

  dimension: list_r_mvmp {
    type: number
    sql: ${TABLE}.list_rMVMP ;;
  }

  dimension: list_r_mvop {
    type: number
    sql: ${TABLE}.list_rMVOP ;;
  }

  measure: count {
    type: count
    drill_fields: [list_name]
  }
}
