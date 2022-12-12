String readVideosQuery = """
  query ReadVideos {
    videos {
      id
      title
      description
      image {
        url
      }
      videoId
      releasedAt
      cast
      category {
        id
      }
    }
  }
""";