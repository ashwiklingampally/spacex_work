const getSpacexLaunchesquery = r'''
  query getSpacexLaunches() {
    
  launches {
    id,
    details,
    launch_date_utc,
    launch_site {
      site_id,
      site_name,
      site_name_long
    }
    launch_year,
    mission_name,
    links {
      flickr_images,
      wikipedia,
    }
  
}
  }
''';
